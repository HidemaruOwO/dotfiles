#include <bee/utility/path_helper.h>
#include <bee/utility/dynarray.h>
#include <bee/error.h>

#if defined(_WIN32)

#include <Windows.h>
#include <shlobj.h>

// http://blogs.msdn.com/oldnewthing/archive/2004/10/25/247180.aspx
extern "C" IMAGE_DOS_HEADER __ImageBase;

namespace bee::path_helper {
    fs::path dll_path(void* module_handle) {
        wchar_t buffer[MAX_PATH];
        DWORD path_len = ::GetModuleFileNameW((HMODULE)module_handle, buffer, _countof(buffer));
        if (path_len == 0) {
            throw make_syserror("GetModuleFileNameW");
        }
        if (path_len < _countof(buffer)) {
            return fs::path(buffer, buffer + path_len);
        }
        for (DWORD buf_len = 0x200; buf_len <= 0x10000; buf_len <<= 1) {
            dynarray<wchar_t> buf(buf_len);
            path_len = ::GetModuleFileNameW((HMODULE)module_handle, buf.data(), buf_len);
            if (path_len == 0) {
                throw make_syserror("GetModuleFileNameW");
            }
            if (path_len < _countof(buffer)) {
                return fs::path(buf.data(), buf.data() + path_len);
            }
        }
        throw std::runtime_error("::GetModuleFileNameW return too long.");
    }

    fs::path exe_path() {
        return dll_path(NULL);
    }

    fs::path dll_path() {
        return dll_path(reinterpret_cast<void*>(&__ImageBase));
    }

    fs::path appdata_path() {
        wchar_t* path;
        if (SUCCEEDED(SHGetKnownFolderPath(FOLDERID_LocalAppData, 0, nullptr, &path))) {
            fs::path res(path);
            CoTaskMemFree(path);
            return res;
        }
        throw std::runtime_error("::SHGetKnownFolderPath failed.");
    }
}

#else

#if defined(__APPLE__)

#include <mach-o/dyld.h>

namespace bee::path_helper {
    fs::path exe_path() {
        uint32_t path_len = 0;
        _NSGetExecutablePath(0, &path_len);
        if (path_len <= 1) {
            throw std::runtime_error("_NSGetExecutablePath failed.");
        }
        dynarray<char> buf(path_len);
        int rv = _NSGetExecutablePath(buf.data(), &path_len);
        if (rv != 0) {
            throw std::runtime_error("_NSGetExecutablePath failed.");
        }
        return fs::path(buf.data(), buf.data() + path_len - 1);
    }
}

#else

#include <unistd.h>

namespace bee::path_helper {
    fs::path exe_path() {
        char buffer[0x100];
        ssize_t path_len = ::readlink("/proc/self/exe", buffer, sizeof(buffer)-1);
        if (path_len < 0) {
            throw make_syserror("readlink");
        }
        if (path_len < (ssize_t)sizeof(buffer)-1) {
            return fs::path(buffer, buffer + path_len);
        }
        for (size_t buf_len = 0x200; buf_len <= 0x10000; buf_len <<= 1) {
            dynarray<char> buf(buf_len);
            ssize_t path_len = ::readlink("/proc/self/exe", buf.data(), buf_len-1);
            if (path_len == 0) {
                throw make_syserror("readlink");
            }
            if (path_len < (ssize_t)sizeof(buffer)-1) {
                return fs::path(buf.data(), buf.data() + path_len);
            }
        }
        throw std::runtime_error("readlink return too long.");
    }

    fs::path appdata_path() {
        if (const char* env = getenv("XDG_DATA_HOME")) {
            return fs::path(env);
        }
        if (const char* env = getenv("HOME")) {
            return fs::path(env) / ".local" / "share";
        }
        throw std::runtime_error("neither XDG_DATA_HOME nor HOME environment is set");
    }
}

#endif

#if defined(BEE_DISABLE_DLOPEN)

namespace bee::path_helper {
    fs::path dll_path(void* module_handle) {
        throw std::runtime_error("disable dl.");
    }
    fs::path dll_path() {
        return dll_path(nullptr);
    }
}

#else

#include <dlfcn.h>

namespace bee::path_helper {
    fs::path dll_path(void* module_handle) {
        ::Dl_info dl_info;
        dl_info.dli_fname = 0;
        int const ret = ::dladdr(module_handle, &dl_info);
        if (0 != ret && dl_info.dli_fname != NULL) {
            return fs::absolute(dl_info.dli_fname).lexically_normal();
        }
        throw std::runtime_error("::dladdr failed.");
    }

    fs::path dll_path() {
        return dll_path((void*)&exe_path);
    }
}

#endif

#endif

namespace bee::path_helper {
#if defined(_WIN32)
    bool equal(fs::path const& lhs, fs::path const& rhs) {
        fs::path lpath = lhs.lexically_normal();
        fs::path rpath = rhs.lexically_normal();
        const fs::path::value_type* l(lpath.c_str());
        const fs::path::value_type* r(rpath.c_str());
        while ((towlower(*l) == towlower(*r) || (*l == L'\\' && *r == L'/') || (*l == L'/' && *r == L'\\')) && *l) {
            ++l; ++r;
        }
        return *l == *r;
    }
#elif defined(__APPLE__)
    bool equal(fs::path const& lhs, fs::path const& rhs) {
        fs::path lpath = lhs.lexically_normal();
        fs::path rpath = rhs.lexically_normal();
        const fs::path::value_type* l(lpath.c_str());
        const fs::path::value_type* r(rpath.c_str());
        while (towlower(*l) == towlower(*r) && *l) {
            ++l; ++r;
        }
        return *l == *r;
}
#else
    bool equal(fs::path const& lhs, fs::path const& rhs) {
        return lhs.lexically_normal() == rhs.lexically_normal();
    }
#endif
}
