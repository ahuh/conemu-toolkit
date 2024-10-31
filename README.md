# ConEmu Toolkit

## Features

* Provides ConEmu **custom launchers and commands** (BAT / CMD scripts)
* Provides **SSH client** with GUI **directly integrated** in ConEmu, using KiTTY
* Provides **autocomplete** for ConEmu custom launchers with LUA scripts, using Clink
* Provides a **custom prompt for CMD** in ConEmu with git integration, using Oh My Posh
* Provides a **default ConEmu configuration** file, wrapping all components together

## Requirements

* **Chocolatey** installed with packages `conemu`, `git`, `oh-my-posh` and `kitty`
* A **Nerd font** must be installed in Windows (e.g. `CaskaydiaMono`), and configured as font in ConEmu: https://www.nerdfonts.com/font-downloads
* **Clink** installed for ConEmu: https://conemu.github.io/en/TabCompletion.html#ConEmu_and_clink
* **WSL 2** installed with a Linux distrib (e.g. `Ubuntu`)

## Install

* Set the env var `CONEMU_TOOLKIT_PATH` to this repo path
* Update the env var `PATH` to add `%CONEMU_TOOLKIT_PATH%\scripts`
* Execute in a ConEmu admin CMD, to register LUA scripts for Clink and custom prompt with Oh My Posh:

```bat
clink set lua.path "%CONEMU_TOOLKIT_PATH%\lua\module\clink_lib.lua"
clink set clink.path "%CONEMU_TOOLKIT_PATH%\lua"
```

* You may adapt the configuration to your environment, by modifiying the file `scripts\include\config.bat` (automatically created from `config.default.bat` at first custom launcher execution)
* Bonus: if you want to use **ConEmu with Clink in VSCode integrated terminal**, add and adapt the following **User Settings** to your environment:

```json
{
    // ..
    "terminal.integrated.defaultProfile.windows": "ConEmu",
    "terminal.integrated.profiles.windows": {
        "ConEmu": {
            "overrideName": true,
            "path": "${env:windir}\\System32\\cmd.exe",
            "args": ["/K", "${env:ProgramFiles}\\ConEmu\\ConEmu\\clink\\clink.bat", "inject"],
            "icon": "terminal"
        },
        // ..
    },
    "terminal.integrated.fontFamily": "CaskaydiaMono NF"
}
```