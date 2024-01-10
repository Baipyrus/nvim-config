## Introduction

This project is a fork of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)


### Installation (Windows Only)

> **NOTE**
> [Backup](#FAQ) your previous configuration (if any exists)

Requirements:
* Make sure to review the readmes of the plugins if you are experiencing errors. In particular:
  * [ripgrep](https://github.com/BurntSushi/ripgrep#installation) is required for multiple [telescope](https://github.com/nvim-telescope/telescope.nvim#suggested-dependencies) pickers.

Neovim's configurations are located under the following path:

| Shell | PATH |
| :- | :--- |
| cmd | `%userprofile%\AppData\Local\nvim\` |
| powershell | `$env:USERPROFILE\AppData\Local\nvim\` |

- Download and install:
  - [MinGW](https://www.mingw-w64.org/)
  > **NOTE**
  > In this case, using [chocolatey](https://chocolatey.org/) is quick and easy
  - [CMake](https://cmake.org/)
  > **NOTE**
  > Make sure to select 'add to PATH' during installation
- [MSBuild-Tools](https://github.com/bycloudai/InstallVSBuildToolsWindows)
- Clone this repository:
  - on Windows (cmd)
  ```
  git clone https://github.com/Baipyrus/nvim-config.git %userprofile%\AppData\Local\nvim\
  ```

  - on Windows (powershell)
  ```
  git clone https://github.com/Baipyrus/nvim-config.git $env:USERPROFILE\AppData\Local\nvim\
  ```


### Post Installation

Start Neovim

```sh
nvim
```

The `Lazy` plugin manager will start automatically on the first run and install the configured plugins. After the installation is complete you can press `q` to close the `Lazy` UI and **you are ready to go**! Next time you run nvim `Lazy` will no longer show up.

If you would prefer to hide this step and run the plugin sync from the command line, you can use:

```sh
nvim --headless "+Lazy! sync" +qa
```


### FAQ

* What should I do if I already have a pre-existing neovim configuration?
  * You should back it up, then delete all files associated with it.
  * This includes your existing init.lua and the neovim files in `%userprofile%\AppData\Local\nvim-data\` (CMD) or `$env:USERPROFILE\AppData\Local\nvim-data\` (Powershell) which should be deleted afterwards.
  * You may also want to look at the [migration guide for lazy.nvim](https://github.com/folke/lazy.nvim#-migration-guide)
* What if I want to "uninstall" this configuration:
  * See [lazy.nvim uninstall](https://github.com/folke/lazy.nvim#-uninstalling) information
* Why is the kickstart `init.lua` a single file? Wouldn't it make sense to split it into multiple files?
  * The main purpose of kickstart is to serve as a teaching tool and a reference
    configuration that someone can easily `git clone` as a basis for their own.
    As you progress in learning Neovim and Lua, you might consider splitting `init.lua`
    into smaller parts. A fork of kickstart that does this while maintaining the exact
    same functionality is available here:
    * [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)
  * Discussions on this topic can be found here:
    * [Restructure the configuration](https://github.com/nvim-lua/kickstart.nvim/issues/218)
    * [Reorganize init.lua into a multi-file setup](https://github.com/nvim-lua/kickstart.nvim/pull/473)

