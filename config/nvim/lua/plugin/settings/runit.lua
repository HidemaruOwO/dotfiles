local function isNodejs()
  local packagejson = "package.json"

  if vim.fn.findfile(packagejson, "./") == packagejson then
    return true
  else
    return false
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
})
