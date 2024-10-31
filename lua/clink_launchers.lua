local lib = require('clink_lib')

local p = clink.argmatcher(
    "_cmd",
    "_cmd-admin",
    "_pwsh",
    "_pwsh-admin",
    "_kitty-gui",
    "_su",
    "_wsl",
    "_choco-update",
    "_choco-cleaner",
    "_disk-cleaner",
    "_wsl-compact",
    "_wsl-update"
)
p = lib.add_common_arg(p)
p:nofiles()