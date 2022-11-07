# My-Tools

## 获取订阅链接
###### Clash
```
~/.config/clash/config.yaml
```
多订阅用[encode](https://www.urlencoder.org/)后的链接,用|分隔
```
Clash：
https://sub.xeton.dev/sub?target=clash&list=true&url=你的订阅链接

https://sub.xeton.dev/sub?target=clash&list=true&url=encode后的[订阅|订阅|...]

QuanX：
https://sub.xeton.dev/sub?target=quanx&list=true&url=你的订阅链接

https://sub.xeton.dev/sub?target=quanx&list=true&url=encode后的[订阅|订阅|...]

Surge：
https://sub.xeton.dev/sub?target=surge&ver=4&list=true&url=你的订阅链接

https://sub.xeton.dev/sub?target=surge&ver=4&list=true&url=encode后的[订阅|订阅|...]

---
https://api.v1.mk/sub?target=auto&list=true&url=你的订阅链接
```
编辑 /root/.bashrc
```
export all_proxy=http://127.0.0.1:7890
```
运行 source .bashrc

## BIOS
```
1.开启CSM (兼容)
2.开启AHCI
3.关闭Source [Fast] Boot (如果安装Windows开启)
```
## Archlinux
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
sudo pacman -S chromium                                                     #安装谷歌浏览器
sudo pacman -S ark                                                          #与dolphin同用右键解压
sudo pacman -S p7zip unrar unarchiver lzop lrzip                            #安装ark可选依赖
sudo pacman -S packagekit-qt5 packagekit appstream-qt appstream             #确保Discover(软件中心）可用 需重启
sudo pacman -S gwenview                                                     #图片查看器
sudo pacman -S git wget kate bind                                           #一些工具
sudo pacman -S yay
sudo pacman -S neofetch
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
sudo pacman -S mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau
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
## 开机自启

###### windows
运行CMD，输入
```
shell:startup
```
把应用程序放入文件夹内

## Docker
```
mysql
docker run --name some-mysql -p 3306:3306 -v /d/mysql/datadir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:8.0.27

mongo
docker run --name some-mongo -p 27017:27017 -v /d/mongo/data:/data/db -d mongo:latest

redis
docker run --name some-redis -p 6379:6379 -v /d/redis/redis.conf:/etc/redis/redis.conf -v /d/redis/data:/data -d redis:latest redis-server /etc/redis/redis.conf --appendonly yes

nacos
docker run --name some-nacos -p 8848:8848 -e MODE=standalone -d nacos/nacos-server:2.0.3

clash
docker run --name some-clash -p 9090:9090 -p 7890:7890 -v /d/clash:/root/.config/clash -d --restart always dreamacro/clash:latest
```

## 同步GitHub项目

生成SSH秘钥

第一步先生成ssh秘钥。在系统根目录下打开命令行终端，执行命令：
```
ssh-keygen -t rsa -C "填写你的任意邮箱"
```
执行完成后，会生成一个.ssh文件夹，里面的id_rsa.pub文件内容就是秘钥，那么我们就进入ssh文件夹打开该文件后复制它的内容。或者命令行快速打开
```
cd ./.ssh && cat id_rsa.pub
```
然后会有一大串字符打印在终端，这个是秘钥内容，全部复制下来。

登录github新建SSH Key

登录自己的github，在右上角头像框点击邮件选择Settings，然后在左边菜单选择SSH and GPG keys,在SSH keys一栏点击New SSH key的绿色按钮，title随便写，key那一个框框里把刚才复制的id_rsa.pub的内容粘贴到这里，确定复制的是完整的秘钥不要漏了。粘贴完后点下面Add的绿色按钮，这样就在github上生成了一个对应的SSH秘钥了。

验证SSH

回到本地，随便找个空文件夹或者新建一个文件夹，在这个新文件夹下新建一个git本地仓库。终端在这个文件夹的路径下打开，路径一定要正确，然后执行
```
git init
```
再然后就是设置用户名和邮箱：
```
git config --global user.name "用户名"
git config --global user.email "你的邮箱"
```
设置完后，设置你想要建立对应连接的远程仓库地址：
```
git remote add origin git@github.com:XXXXXXX/xxxxxxx.git   
```
这里的地址填写你github仓库的SSH地址，注意是SSH的地址不是http的地址

设置完成后，把远程仓库的源代码拉取到本地：
```
git pull origin master --allow-unrelated-histories 
```
这里的master是你远程仓库的分支名，如果你的分支名不是master你就改成你的分支名

一般来讲没有改过的分支名肯定有一个是master，只不过不知道你想要的代码在不在master分支。

执行上述命令后会出现一堆信息，大概就是关于验证的，结束会有一个（yes/no），这里手打‘yes’再回车就可以完成验证了，直接打回车会验证错误，    验证通过后就会拉取远程master分支的代码到你的文件夹，并同时在本地创建一个master分支。接下来就是要建立本地分支和远程分支的追踪关系，方便以后push，执行如下命令：
```
git branch --set-upstream-to=origin/master
```
至此，本地仓库重新与github远程仓库建立了连接,再次执行git pull,出现up to date就没问题了

## Rust

### Windows

下载 [Rustup](https://win.rustup.rs/x86_64)

**rustup default stable-msvc**

下载 [Visual Studio Community](https://visualstudio.microsoft.com/zh-hans/vs/community/) -- **使用C++的桌面开发**

**rustup default stable-gnu**

下载 [MinGW-w64](https://sourceforge.net/projects/mingw-w64/files/) -- **x86_64-posix-seh**

下载 [CMake](https://cmake.org/download/) -- 环境变量

### Linux

执行
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
**~/.cargo/config**
```
[source.crates-io]
registry = "https://github.com/rust-lang/crates.io-index"

replace-with = 'tuna' 

# 中国科学技术大学
[source.ustc]
registry = "git://mirrors.ustc.edu.cn/crates.io-index"

# 上海交通大学
[source.sjtu]
registry = "https://mirrors.sjtug.sjtu.edu.cn/git/crates.io-index"

# 清华大学
[source.tuna]
registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"

# rustcc社区
[source.rustcc]
registry = "https://code.aliyun.com/rustcc/crates.io-index.git"
```

**mysqlclient**

安装 [MySQL Connector/C](https://downloads.mysql.com/archives/c-c/)

设置环境变量：MYSQLCLIENT_LIB_DIR

默认在 C:\Program Files\MySQL\MySQL Connector C 6.1\lib\vs14

然后执行
```
cargo install diesel_cli --no-default-features --features mysql
```
## Vim-Plug

###### Unix, Linux

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
###### Windows (PowerShell)

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```
edit ~/.vimrc
```
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'

call plug#end()
```
```
:source %
:PlugInstall
```

