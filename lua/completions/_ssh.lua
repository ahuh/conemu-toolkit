-- Add custom args completions for _ssh launcher

local lib = require('cet_lib')

local function list_ssh_hosts()
    output = {}
    map = {}

    local config_path = clink.get_env("userprofile") .. "/.ssh/config"
    local f = io.open(config_path)
    if not f then
        return output
    end

    for line in f:lines() do
        local m = line:match("Host[ ]+([a-zA-Z0-9-_]+)")
        if m then
            if map[m] == nil then
                -- Prevent duplicates in profiles
                map[m] = 1
                table.insert(output, m)
            end
        end
    end

    f:close()
    return output
end

local p = clink.argmatcher("_ssh")
:addarg(list_ssh_hosts())
p = lib.add_common_arg(p)
p:nofiles()