#pragma once

#include <Windows.h>
#include <map>
#include <set>
#include <vector>
#include <string>
#include <memory>
#include <bee/utility/file_helper.h>

namespace bee::win::subprocess {
    namespace ignore_case {
        template <class T> struct less;
        template <> struct less<wchar_t> {
            bool operator()(const wchar_t& lft, const wchar_t& rht) const
            {
                return (towlower(static_cast<wint_t>(lft)) < towlower(static_cast<wint_t>(rht)));
            }
        };
        template <> struct less<std::wstring> {
            bool operator()(const std::wstring& lft, const std::wstring& rht) const
            {
                return std::lexicographical_compare(lft.begin(), lft.end(), rht.begin(), rht.end(), less<wchar_t>());
            }
        };
    }

    enum class console {
        eInherit,
        eDisable,
        eNew,
        eDetached,
        eHide,
    };
    enum class stdio {
        eInput,
        eOutput,
        eError,
    };

    namespace pipe {
        struct open_result {
            file::handle rd;
            file::handle wr;
            FILE*        open_read();
            FILE*        open_write();
            operator bool() { return rd && wr; }
        };
        _BEE_API open_result open();
        _BEE_API int         peek(FILE* f);
    }

    class spawn;
    class _BEE_API process {
    public:
        process(spawn& spawn);
        process(PROCESS_INFORMATION&& pi) { pi_ = std::move(pi); }
        ~process();
        void      close();
        bool      is_running();
        bool      kill(int signum);
        uint32_t  wait();
        uint32_t  get_id() const;
        bool      resume();
        uintptr_t native_handle();
        PROCESS_INFORMATION const& info() const { return pi_; }

    private:
        bool     wait(uint32_t timeout);
        uint32_t exit_code();

    private:
        PROCESS_INFORMATION           pi_;
    };

    struct args_t : public std::vector<std::wstring> {
        args_t() {}
        args_t(std::vector<std::wstring> init) : std::vector<std::wstring>(init) {}
        template <typename T> void push(T v) { push_back(v); }
    };

    class _BEE_API spawn {
        friend class process;
    public:
        spawn();
        ~spawn();
        void search_path();
        bool set_console(console type);
        bool hide_window();
        void suspended();
        void detached();
        void redirect(stdio type, file::handle h);
        void env_set(const std::wstring& key, const std::wstring& value);
        void env_del(const std::wstring& key);
        bool exec(const args_t& args, const wchar_t* cwd);

    private:
        bool raw_exec(const wchar_t* application, wchar_t* commandline, const wchar_t* cwd);
        void do_duplicate_shutdown();

    private:
        std::map<std::wstring, std::wstring, ignore_case::less<std::wstring>> set_env_;
        std::set<std::wstring, ignore_case::less<std::wstring>>               del_env_;
        STARTUPINFOW            si_;
        PROCESS_INFORMATION     pi_;
        DWORD                   flags_ = 0;
		console                 console_ = console::eInherit;
        bool                    inherit_handle_ = false;
        bool                    search_path_ = false;
        bool                    detached_ = false;
    };
}
