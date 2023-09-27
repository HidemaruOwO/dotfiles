local function isNodejs()
	local packagejson = "package.json"

	if vim.fn.findfile(packagejson, "./") == packagejson then
		return true
	else
		return false
	end
end

local function removeExtension(fullPath)
	local lastDotIndex = string.find(fullPath, "%.[^%.]*$")
	if lastDotIndex then
		return string.sub(fullPath, 1, lastDotIndex - 1)
	else
		return fullPath
	end
end

require("runit").setup({
	js = function(file)
		if isNodejs() then
			return "node" .. file
		else
			return "deno run -A " .. file
		end
	end,
	ts = function(file)
		if isNodejs() then
			return "ts-node" .. file
		else
			return "deno run -A " .. file
		end
	end,
	mjs = function(file)
		return "node" .. file
	end,
	py = function(file)
		return "python3" .. file
	end,
	go = function(file)
		return "go run" .. file
	end,
	rs = function(file)
		return "cargo run"
		-- return "bash -c '" .. "rustc --edition 2021" .. file .. " && " .. removeExtension(file) .. "'"
	end,
})
