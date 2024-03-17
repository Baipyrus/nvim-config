# nvim-config

## Introduction

*This is a fork of [dam9000/kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim) that represents my personal configuration of Neovim.*

## Installation

### Install Neovim

Kickstart.nvim targets *only* the latest
['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest
['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim.
If you are experiencing issues, please make sure you have the latest versions.

### Install External Dependencies

> **NOTE**
> [Backup](#FAQ) your previous configuration (if any exists)

External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- A [Nerd Font](https://www.nerdfonts.com/): provides various icons
- Language utils: `rustup`, `npm`, `dotnet`, `python`
- Optionally, install [Alacritty](https://github.com/alacritty/alacritty#installation)
  - Or on Windows, just install using `winget install alacritty --source winget`

> **NOTE**
> See [Windows Installation](#Windows-Installation) to double check any additional Windows notes

Neovim's configurations are located under the following paths, depending on your OS:

| OS | PATH |
| :- | :--- |
| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%userprofile%\AppData\Local\nvim\` |
| Windows (powershell)| `$env:USERPROFILE\AppData\Local\nvim\` |

### Install this Configuration

Clone it from GitHub:

<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/Baipyrus/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```bat
git clone https://github.com/Baipyrus/nvim-config.git %userprofile%\AppData\Local\nvim\
```

If you're using `powershell.exe`

```pwsh
git clone https://github.com/Baipyrus/nvim-config.git $env:USERPROFILE\AppData\Local\nvim\
```

</details>

### Post Installation

<details><summary> Extras for Linux and Mac </summary>
In the [`options`](./lua/options.lua) file, change the settings to specify the terminal of your choice. This installation is used and maintained by a Windows user and, as such, will use Powershell. This setting may need to be updated after each upgrade.
</details>

Start Neovim

```sh
nvim
```

That's it! Lazy will install all the plugins you have. Use `:Lazy` to view
current plugin status.

### FAQ

* What should I do if I already have a pre-existing neovim configuration?
  * You should back it up and then delete all associated files.
  * This includes your existing init.lua and the neovim files in `~/.local` which can be deleted with `rm -rf ~/.local/share/nvim/` or their windows counterparts in `AppData\Local\nvim-data`
* Can I keep my existing configuration in parallel to kickstart?
  * Yes! You can use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME` to maintain multiple configurations. For example, you can install the kickstart configuration in `~/.config/nvim-kickstart` and create an alias:
    ```sh
    alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
    ```
    When you run Neovim using `nvim-kickstart` alias it will use the alternative config directory and the matching local directory `~/.local/share/nvim-kickstart`.
    You could also run your configuration inline, for example in Windows Powershell:
    ```pwsh
    $env:NVIM_APPNAME = 'nvim-kickstart'; nvim
    ```
* What if I want to "uninstall" this configuration:
  * See [lazy.nvim uninstall](https://github.com/folke/lazy.nvim#-uninstalling) information

### Windows Installation

Installation requires gcc and make, for which you don't need to change the config,
the easiest way is to use choco:

1. install [chocolatey](https://chocolatey.org/install)
either follow the instructions on the page or use winget,
run in cmd as **admin**:
```
winget install --accept-source-agreements chocolatey.chocolatey
```

2. install all requirements using choco, exit previous cmd and
open a new one so that choco path is set, and run in cmd as **admin**:
```
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```

Then continue with the [Install Kickstart](#Install-this-Configuration) step.
