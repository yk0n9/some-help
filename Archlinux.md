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
device list
station wlan0 scan
station wlan0 get-networks
station wlan0 connect [WIRELESS-NAME]
exit
```

**使用国内源**

```bash
vim /etc/pacman.d/mirrorlist
```

```bash
Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch
```

**更新包**

```
sudo pacman -Syy
sudo rm -rf /etc/pacman.d/gnupg
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -S archlinux-keyring
sudo pacman -Syu
```

**开启 32 位支持库**

```bash
vim /etc/pacman.conf
```

去掉[multilib]一节中两行的注释开启 32 位库支持
**添加 Archlinuxcn 源**

```
[archlinuxcn]
Server = https://repo.archlinuxcn.org/$arch
```

```bash
sudo pacman-key --lsign-key "farseerfc@archlinux.org"
sudo pacman -Sy archlinuxcn-keyring
sudo pacman -Syu
```

重新更新源

```bash
sudo rm -R /var/lib/pacman/sync
sudo pacman -Syy
```

卸载

```
sudo pacman -Rsn xxx
```

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
sudo pacman -S base-devel glibc                                             #开发环境
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

0 就是 root 用户。

然后更改

```bash
sudo vim /usr/local/etc/pam.d/sddm
```

把 include 之后的 login，替换成 system，一共 4 个。

之后就可以以 root 登录 sddm 了

将 root 加到 pulse-access 组

```bash
sudo usermod -a -G pulse-access root
```

系统代理设置

```bash
vim /etc/environment
```

```bash
http_proxy=http://ip:port
https_proxy=http://ip:port
```
