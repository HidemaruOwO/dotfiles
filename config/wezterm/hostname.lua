local _M = {}
function _M.getHostname()
	local f = io.open("/etc/hostname", "r")
	for line in f:lines() do
		return line
	end
end

return _M
