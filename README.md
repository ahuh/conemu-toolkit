# ConEmu Toolkit

## Features

* Provides ConEmu **custom launchers and commands** (BAT / CMD scripts)
* Provides **SSH client** with GUI **directly integrated** in ConEmu, using KiTTY
* Provides **autocomplete** for ConEmu custom launchers with LUA scripts, using Clink
* Provides a **custom prompt for CMD** in ConEmu with git integration, using Oh My Posh
* Provides a **default ConEmu configuration** file, wrapping all components together

## Requirements

* `choco` installed with packages `conemu`, `git`, `oh-my-posh` and `kitty`
  * **Chocolatey** → The package manager for windows: https://chocolatey.org/
  * **ConEmu** → Handy, comprehensive, fast and reliable terminal window: https://conemu.github.io/
  * **Git** → Free and open source distributed version control system: https://git-scm.com/
  * **Oh My Posh** → A prompt theme engine for any shell: https://ohmyposh.dev/
  * **KiTTY** → fork of PuTTY telnet / SSH client with new features: http://www.9bis.net/kitty
* `clink` installed for ConEmu:
  * **Clink** → Bash's powerful command line editing in cmd.exe: https://github.com/chrisant996/clink
  * ConEmu integration: https://conemu.github.io/en/TabCompletion.html#ConEmu_and_clink
* A **Nerd font** must be installed in Windows (e.g. `CaskaydiaMono`), and configured as font in ConEmu: https://www.nerdfonts.com/font-downloads
  * Download a font ZIP file, unzip it, open the folder in explorer, select all `.ttf` files and install them from the right-click menu
  * In ConEmu settings, set the main console font: https://conemu.github.io/en/SettingsFonts.html
* **WSL 2** installed with a Linux distrib (e.g. `Ubuntu`): https://learn.microsoft.com/en-us/windows/wsl/install

## Install

* Set the env var `CONEMU_TOOLKIT_PATH` to this repo path
* Update the env var `PATH` to add `%CONEMU_TOOLKIT_PATH%\scripts`
* Execute in a ConEmu admin CMD, to register LUA scripts for Clink and custom prompt with Oh My Posh:

```bat
clink set lua.path "%CONEMU_TOOLKIT_PATH%\lua\module\clink_lib.lua"
clink set clink.path "%CONEMU_TOOLKIT_PATH%\lua"
```

* You may adapt the configuration to your environment, by modifiying the file `scripts\include\config.bat` (automatically created from `config.default.bat` at first custom launcher execution)