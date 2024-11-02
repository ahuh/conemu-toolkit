-- Add custom args completions for _kitty launcher

local lib = require('cet_lib')

local function get_kitty_dir()
    return os.getenv("APPDATA") .. "\\KiTTY"
end

local p = clink.argmatcher("_kitty")
:addarg(os.globfiles(get_kitty_dir()..'\\Sessions\\*'))
p = lib.add_common_arg(p)
p:nofiles()