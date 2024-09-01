# neovim config

This is where all the neovim configs are where
- init.lua, main entry point
- `after/plugin`, one of the [runtime dir](https://neovim.io/doc/user/options.html#'runtimepath'), this folder consist of all the customisation for the installed plugin
- `lua/keys.lua`, where all the keymappings are
- `lua/opts.lua`, where all the optins are
- `lua/plug.lua`, using [packer](https://github.com/wbthomason/packer.nvim) as plugin management, this is where the setup of packer and a list of plugin to install reside
- `lua/vars.lua`, this is where the global variables are define

# useful command

Refresh after change
```
:luafile %
```

Print variable value
```
:=<var_name>
```
Install LSP 
```
:MasonInstall gopls
```
