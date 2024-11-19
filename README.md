# ConEmu Toolkit

## Features

* Provides ConEmu **custom launchers and commands** (BAT / CMD scripts)
* Provides **SSH client** with GUI **directly integrated** in ConEmu, using KiTTY
* Provides **autocomplete for custom launchers**in ConEmu with LUA scripts, using Clink
* Provides **more autocompletion** support for Clink from other GitHub repositories (*choco, git, java, mvn, kubectl, ...*)
* Provides a **custom prompt** in ConEmu (CMD / Clink, Powershell & WSL) with python and git integration, using Oh My Posh
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
* **WSL 2** installed with a Linux distrib (e.g. `Ubuntu`): https://learn.microsoft.com/en-us/windows/wsl/install
* A **Nerd font** must be installed in Windows (e.g. `CaskaydiaMono`), and configured as font in ConEmu: https://www.nerdfonts.com/font-downloads
  * Download a font ZIP file, unzip it, open the folder in explorer, select all `.ttf` files and install them from the right-click menu
  * In ConEmu settings, set the main console font: https://conemu.github.io/en/SettingsFonts.html

## Install

### Common steps

* In ConEmu configuration, import the default configuration available in this repo (or adapt your configuration to add missing parts): `default/ConEmu.xml`
* In Windows, set the env var `CONEMU_TOOLKIT_PATH` to this repo path
* Update the env var `PATH` to add `%CONEMU_TOOLKIT_PATH%\scripts`
* You may adapt the scripts configuration to your environment, by modifiying the file `scripts\include\config.bat` (automatically created from `config.default.bat` at first custom launcher execution)

### Install prompt for ConEmu / Clink

* In a ConEmu CMD, execute these lines to register LUA scripts for Clink and custom prompt with Oh My Posh:

```bat
clink installscripts "%CONEMU_TOOLKIT_PATH%\lua"
```

* Do the same operations to register MORE scripts:
  * From the repo `clink-completions`: https://github.com/vladimir-kotikov/clink-completions?tab=readme-ov-file#using-git
  * From the repo `more-clink-completions`: https://github.com/sebthom/more-clink-completions?tab=readme-ov-file#2-install-more-clink-completions

* **BONUS #1**: if you want to use **ConEmu with Clink in VSCode integrated terminal**, add and adapt the following **User Settings** to your environment:

```json
{
    "terminal.integrated.defaultProfile.windows": "ConEmu",
    "terminal.integrated.profiles.windows": {
      "ConEmu": {
        "overrideName": true,
        "path": "${env:windir}\\System32\\cmd.exe",
        "args": ["/K", "${env:ProgramFiles}\\ConEmu\\ConEmu\\CmdInit.cmd"],
        "icon": "terminal"
      }
    },
    "terminal.integrated.fontFamily": "CaskaydiaMono NF"
}
```

* **BONUS #2**: if you want to also use **Clink in Windows Terminal**
  * Change the CMD command line in Terminal settings
    * Replace the default value... : `%SystemRoot%\System32\cmd.exe`
    * .. by this value with Clink injection: `%SystemRoot%\System32\cmd.exe /K "%PROGRAMFILES%\ConEmu\ConEmu\clink\clink.bat" inject`
  * Select the `CaskaydiaMono NF` font in Terminal settings

### Install prompt for Powershell

* In Powershell, use your preferred editor to modify the profile file: `notepad++ $PROFILE.CurrentUserAllHosts`
  * Add shortcut to close shell with `Ctrl+D`,
  * Add prompt at the end of file: https://ohmyposh.dev/docs/installation/prompt

  ```powershell
  # Add shortcut to close shell with Ctrl+D
  Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
  
  # Register Oh My Posh prompt
  oh-my-posh init pwsh --config "$env:CONEMU_TOOLKIT_PATH/posh/themes/ahuh-conemu.json" | Invoke-Expression
  ```

* **BONUS**: if you want to also use **Powershell in Windows Terminal**
  * Select the `CaskaydiaMono NF` font in Terminal settings

### Install prompt for WSL

* In Windows, set the env var `WSLENV`: https://devblogs.microsoft.com/commandline/share-environment-vars-between-wsl-and-windows/
  * Add `USERPROFILE/p:CONEMU_TOOLKIT_PATH/p` to the `:` separated list (if exists)
* Install Oh My Posh in WSL, by following the steps in the documentation: https://ohmyposh.dev/docs/installation/linux
* In WSL, use your preferred editor to modify the bashrc file: `nano ~/.bashrc`
  * Load local binaries,
  * Add prompt at the end of file: https://ohmyposh.dev/docs/installation/prompt

  ```shell
  # set PATH so it includes user's private bin if it exists
  if [ -d "$HOME/bin" ] ; then
      PATH="$HOME/bin:$PATH"
  fi

  # set PATH so it includes user's private bin if it exists
  if [ -d "$HOME/.local/bin" ] ; then
      PATH="$HOME/.local/bin:$PATH"
  fi

  # Register Oh My Posh prompt
  eval "$(oh-my-posh init bash --config $CONEMU_TOOLKIT_PATH/posh/themes/ahuh-conemu.json)"
  ```

* In WSL, repeat operation to install and configure Oh My Posh for root user: `sudo su`
  * First you will need to pass the env var to the root user, by modifying the sudoers configuration: `sudo visudo`

  ```shell
  sudo su
  cd /etc/sudoers.d
  echo "# For the Oh My Posh prompt registration" > prompt-posh
  echo "Defaults:%sudo env_keep += \"USERPROFILE CONEMU_TOOLKIT_PATH\"" >> prompt-posh
  ```

  * Reinstall Oh My Posh in WSL for the root user, and update root's bashrc file (see previous step)

* **BONUS**: if you want to also use **WSL in Windows Terminal**
  * Select the `CaskaydiaMono NF` font in Terminal settings