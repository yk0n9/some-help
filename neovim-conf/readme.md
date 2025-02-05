# Neovim-Intellij

## Vim-Plug

#### Linux

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

```
mkdir ~/.config/nvim
```

```
curl https://raw.githubusercontent.com/ykong1337/some-help/master/neovim-conf/init.vim -o ~/.config/nvim/init.vim
```

```
nvim ~/.config/nvim/init.vim
```

#### Windows

```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

```
mkdir $env:LOCALAPPDATA/nvim
```

```
curl https://raw.githubusercontent.com/ykong1337/some-help/master/neovim-conf/init.vim -o $env:LOCALAPPDATA/nvim/init.vim
```

```
nvim $env:LOCALAPPDATA/nvim/init.vim
```

=============================================

```
:PlugInstall
```
