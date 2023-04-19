# Some-Help

### 基本配置
#### Shadowrocket
```
https://fastly.jsdelivr.net/gh/ykong1337/some-help@master/Shadowrocket.conf
```
#### Quantumult X
```
https://fastly.jsdelivr.net/gh/ykong1337/some-help@master/QuanX.conf
```
#### Surge
```
https://fastly.jsdelivr.net/gh/ykong1337/some-help@master/Surge.conf
```
#### Clash
```
https://fastly.jsdelivr.net/gh/ykong1337/some-help@master/config.yaml
```
#### Clash配置位置
```
~/.config/clash/config.yaml
```
#### 多订阅用[URLEncode](https://www.urlencoder.org/)后的链接, 订阅之间用|分隔
```
Clash: 
https://sub.xeton.dev/sub?target=clash&udp=false&list=true&url=订阅链接
https://sub.xeton.dev/sub?target=clash&udp=false&list=true&url=Encode后的[订阅|订阅|...]

QuanX: 
https://sub.xeton.dev/sub?target=quanx&udp=false&list=true&url=订阅链接
https://sub.xeton.dev/sub?target=quanx&udp=false&list=true&url=Encode后的[订阅|订阅|...]

Surge: 
https://sub.xeton.dev/sub?target=surge&udp=false&ver=4&list=true&url=订阅链接
https://sub.xeton.dev/sub?target=surge&udp=false&ver=4&list=true&url=Encode后的[订阅|订阅|...]

Clash自动配置:
https://sub.xeton.dev/sub?target=clash&udp=false&config=https%3A%2F%2Fraw.githubusercontent.com%2FACL4SSR%2FACL4SSR%2Fmaster%2FClash%2Fconfig%2FACL4SSR_Online_Mini.ini&url=订阅
```
编辑 /root/.bashrc
```
export all_proxy=http://127.0.0.1:7890
```
运行 source .bashrc

#### BIOS
```
1.开启CSM (兼容)
2.开启AHCI
3.关闭Source [Fast] Boot (如果安装Windows开启)
```
#### Archlinux
**连接网络**
```
iwctl
device lis
station wlan0 scan
station wlan0 get-networks
station wlan0 connect YOUR-WIRELESS-NAME
exit
```
**开启 32 位支持库**

```bash
vim /etc/pacman.conf
```

去掉[multilib]一节中两行的注释，来开启 32 位库支持。

添加Archlinuxcn源
```bash
[archlinuxcn]
Server = https://repo.archlinuxcn.org/$arch
```

最后:wq 保存退出，刷新 pacman 数据库

```bash
sudo pacman -Sy && sudo pacman -S archlinuxcn-keyring
```

重启电脑，即可看到欢迎界面，输入新用户的密码即可登录桌面

**安装一些基础功能包**

```bash
sudo pacman -S sof-firmware alsa-firmware alsa-ucm-conf                     #一些可能需要的声音固件
sudo pacman -S ntfs-3g                                                      #识别NTFS格式的硬盘
sudo pacman -S adobe-source-han-serif-cn-fonts wqy-zenhei                   #安装几个开源中文字体 一般装上文泉驿就能解决大多wine应用中文方块的问题
sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts-extra             #安装谷歌开源字体及表情
sudo pacman -S firefox                                                      #安装浏览器
sudo pacman -S ark                                                          #与dolphin同用右键解压
sudo pacman -S p7zip unrar unarchiver lzop lrzip                            #安装ark可选依赖
sudo pacman -S packagekit-qt5 packagekit appstream-qt appstream             #确保Discover(软件中心）可用 需重启
sudo pacman -S gwenview                                                     #图片查看器
sudo pacman -S git wget kate bind                                           #一些工具
sudo pacman -S yay
sudo pacman -S neofetch
sudo pacman -S neovim
```

**设置系统为中文**

打开 _System Settings_ > _Regional Settings_ > _Language_ -> _Add languages_ 中选择中文加入，再拖拽到第一位，Apply。

再将*System Settings* > _Regional Settings_ > _Formats_ 中的值设为`中文-简体中文(zh_CN)`

最后重新登陆

**安装输入法**

```bash
sudo pacman -S fcitx5-im              #基础包组
sudo pacman -S fcitx5-chinese-addons  #官方中文输入引擎
sudo pacman -S fcitx5-anthy           #日文输入引擎
yay -S fcitx5-pinyin-moegirl          #萌娘百科词库
sudo pacman -S fcitx5-pinyin-zhwiki   #中文维基百科词库
sudo pacman -S fcitx5-material-color  #主题
```

设置环境变量：编辑文件 `sudo vim /etc/environment` 加入以下内容。konsole 以及 dolphin 都需要这些环境变量，倒是 chrome 和 firefox 都不需要就可以输入中文

```bash
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
```

打开 _系统设置_ > _区域设置_ > _输入法_，先点击`运行Fcitx`即可，拼音为默认添加项。如你还需要更多输入法如五笔，则再点击`添加输入法`，找到简体中文下的五笔 ，点击添加即可加入五笔输入法。

接下来点击 _拼音_ 右侧的配置按钮，点选`云拼音`和`在程序中显示预编辑文本` 最后应用。

回到输入法设置，点击`配置附加组件`，找到 _经典用户界面_ 在主题里选择一个你喜欢的颜色 最后应用。

注销，重新登陆，就可以发现已经可以在各个软件中输入中文了

**英特尔核芯显卡**

```bash
sudo pacman -S mesa lib32-mesa vulkan-intel lib32-vulkan-intel
```

**英伟达独立显卡**

```bash
sudo pacman -S nvidia nvidia-settings lib32-nvidia-utils
```

**AMD 显卡**

```bash
sudo pacman -S mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon
```

**创建桌面图标**
```
cd ~/Desktop
touch idea.desktop
sudo vim idea.desktop

or

sudo vim /usr/share/applications/idea.desktop
```
```
[Desktop Entry]
Name=IDEA
Type=Application
Exec=/home/ideaIU/bin/idea.sh
Icon=/home/ideaIU/bin/idea.svg
Terminal=false
```

sddm.conf 文件现在默认不会自动生成了。需要自己创建：
```bash
sudo vim /usr/local/etc/sddm.conf
```
写入
```
MinimumUid=0

MaximumUid=0
```
0就是root用户。

然后更改
```bash
sudo vim /usr/local/etc/pam.d/sddm
```
把include之后的login，替换成system，一共4个。

之后就可以以root登录sddm了

将root加到pulse-access组
```
sudo usermod -a -G pulse-access root
```

#### Windows开机自启
运行CMD，输入
```
shell:startup
```
把应用程序放入文件夹内

#### Docker
mysql
```
docker run --name some-mysql -p 3306:3306 -v /d/mysql/datadir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:8.0.27
```
mongo
```
docker run --name some-mongo -p 27017:27017 -v /d/mongo/data:/data/db -d mongo:latest
```
redis
```
docker run --name some-redis -p 6379:6379 -v /d/redis/redis.conf:/etc/redis/redis.conf -v /d/redis/data:/data -d redis:latest redis-server /etc/redis/redis.conf --appendonly yes
```
nacos
```
docker run --name some-nacos -p 8848:8848 -e MODE=standalone -d nacos/nacos-server:2.0.3
```
clash
```
docker run --name some-clash -p 9090:9090 -p 7890:7890 -v /d/clash:/root/.config/clash -d --restart always dreamacro/clash:latest
```

#### 设置Git
**~/.gitconfig**
```
[http]
proxy = 127.0.0.1:7890
[https]
proxy = 127.0.0.1:7890
[user]
email = email
name = name
```
#### Git命令流程
```
git init
git commit -m "init"
git remote add origin https://github.com/username/repositoryname.git
git push -u origin master
```
#### Git Sync Fork命令
```
git remote add upstream [url]

git checkout master
git pull upstream master
```
#### Windows下的包管理器 (PowerShell)
安装scoop
```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

iex (new-object net.webclient).downloadstring('https://raw.fastgit.org/scoopinstaller/install/master/install.ps1')
```
为scoop增加源
```
scoop bucket add main
scoop bucket add extras
scoop bucket add nonportable
```
安装指定版本
```
scoop install nodejs@16.12.0
scoop install firefox@110.0
```
更新scoop已安装应用
```
scoop update *
```
清理cache
```
scoop cache rm *
```
清理旧版本
```
scoop cleanup *
```
显卡驱动(NVIDIA)
```
scoop install sudo ddu
sudo scoop install nvidia-display-driver
```

#### Rust-Windows
```
scoop install rustup
```
#### Rust-Linux
```
curl https://sh.rustup.rs -sSf | sh
```
---
安装LLVM
```
scoop install llvm
```
**rustup default stable-msvc**

下载 [C++ Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/) -- **使用C++的桌面开发**

**rustup default stable-gnu**

安装MinGW
```
scoop install mingw
```
#### 其他
---
安装CMake
```
scoop install cmake
```
安装MySQL
```
scoop install mysql57
```
```
mysqld --console
```
```
mysql
ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
```

**~/.cargo/config**
```
[source.crates-io]
registry = "https://github.com/rust-lang/crates.io-index"
replace-with = 'ustc'

[source.ustc]
registry = "https://mirrors.ustc.edu.cn/crates.io-index"
```
**设置代理**
```
[http]
proxy = "127.0.0.1:7890"
[https]
proxy = "127.0.0.1:7890"
```
**mysqlclient**

安装 [MySQL Connector/C](https://downloads.mysql.com/archives/c-c/)

设置环境变量：MYSQLCLIENT_LIB_DIR

默认在 C:\Program Files\MySQL\MySQL Connector C 6.1\lib\vs14

然后执行
```
cargo install diesel_cli --no-default-features --features mysql
```

安装Vim
```
scoop install vim
```

#### Vim-Plug
```
vim ~/.vimrc
```
###### Unix

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
###### Windows (PowerShell)

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```
#### NeoVim-Plug

###### Unix, Linux

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
```
nvim ~/.config/nvim/init.vim
```
###### Windows (PowerShell)

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```
```
nvim ~/AppData/Local/nvim/init.vim
```
---
#### 安装LazyVim
###### Windows
```
git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
```
###### Linux
```
git clone https://github.com/LazyVim/starter ~/.config/nvim
```
#### Fleet配置位置
```
~/.fleet/settings.json
```
#### Vim配置位置
```
~/.vimrc
```
#### wezterm配置位置
```
~/.wezterm.lua
```
