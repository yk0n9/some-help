# My-Tools

**获取订阅链接**：
```
Clash：
https://sub.xeton.dev/sub?target=clash&list=true&url=订阅

QuanX：
https://sub.xeton.dev/sub?target=quanx&list=true&url=订阅

Surge：
https://sub.xeton.dev/sub?target=surge&ver=4&list=true&url=订阅
```
编辑 /root/.bashrc
```
export all_proxy=http://127.0.0.1:7890
```
运行 source .bashrc

**BIOS**
```
1.开启CSM（兼容）
2.开启AHCI
3.关闭Source (Fast) Boot
```

**铜豌豆软件源**：
```
wget https://www.atzlinux.com/atzlinux/download/install-all-single-script.sh
```
**non-free软件源**

vim /etc/apt/sources.list
```
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free

deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free
```
sudo apt-get update

**查看网卡型号**:
```
lspci -nn
```
**wifi**:
```
sudo apt-get install firmware-iwlwifi firmware-intelwimax firmware-realtek firmware-atheros
sudo apt-get install gnome-control-center
```
**显卡**：

命令自动安装

安装源内版本，终端执行：
```
sudo apt-get install nvidia-driver #安装驱动包
```
如果以上命令不能正常安装驱动，请终端执行：
```
ubuntu-drivers list  #检测合适的驱动包
```
然后使用如下命令安装对应的驱动包，例如检测的结果为nvidia-legacy-340xx-driver
```
sudo apt-get install  nvidia-legacy-340xx-driver #安装驱动包
```
卸载

如果为命令自动安装，终端执行如下命令可卸载：
```
sudo apt-get remove nvidia-driver nvidia-kernel-dkms glx-alternative-nvidia
```
如果为手动安装，终端执行如下命令可卸载：
```
sudo nvidia-uninstall
sudo nvidia-installer --uninstall
```
**双显卡方案**：

**Intel & NVIDIA**

关闭独显

开机时，依据屏幕提示进主板设置，将独显设置为不启用。

独显切换

安装第三方的Bumblebee程序，可实现NVIDIA Optimus，终端中执行：
```
sudo apt-get install bumblebee-nvidia primus #安装Bumblebee-nvidia(适用于闭源驱动),其中primus可选,用于提升性能
sudo apt-get install bumblebee primus #安装Bumblebee(适用于开源驱动)
sudo update-glx --config glx    #切换显卡的工作模式   选择的配置
```
在grub中给内核添加参数来防止系统出现冻结。

在 GRUB_CMDLINE_LINUX_DEFAULT 变量中以
```
sudo vim /etc/default/grub
```
```
acpi_osi=! acpi_osi="Windows 2009"
```
安装完毕后重启电脑使Bumblebee生效，但是Bumblebee并不能做到集显（Intel显卡）和独显（NVIDIA显卡）之间的自动切换。系统运行时会默认使用集成显卡（Intel显卡），当你需要使用独显（NVIDIA显卡）运行某个程序或游戏时候，终端执行如下命令即可：
```
optirun command #使用独显运行command程序
```
```
optirun -b primus command #使用独显运行command程序,提升性能
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
**Docker**
```
mysql
docker run --name mysql -it -p 3306:3306 -v /d/mysql/mysqld:/var/run/mysqld -v /d/mysql/db:/var/lib/mysql -v /d/mysql/conf:/etc/mysql/conf.d -v /d/mysql/files:/var/lib/mysql-files -e MYSQL_ROOT_PASSWORD=root --privileged=true -d mysql:latest

mongo
docker run --name mongo -p 27017:27017 -v /d/mongo/data:/data/db -d mongo:latest

redis
docker run --name redis -p 6379:6379 -v /d/redis/redis.conf:/etc/redis/redis.conf -v /d/redis/data:/data -d redis:latest redis-server /etc/redis/redis.conf --appendonly yes

nacos
docker run --name nacos -p 8848:8848 -e MODE=standalone -d nacos/nacos-server:2.0.3

clash
docker run --name clash -p 9090:9090 -p 7890:7890 -v /d/clash:/root/.config/clash -d --restart always dreamacro/clash:latest
```

**同步GitHub项目**

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

### Rust

**rustup default stable-x86_64-pc-windows-msvc**

下载 [Visual Studio Community](https://visualstudio.microsoft.com/zh-hans/vs/community/) -- **使用C++的桌面开发**

**rustup default stable-x86_64-pc-windows-gnu**

下载 [MinGW-w64](https://sourceforge.net/projects/mingw-w64/files/) -- **x86_64-posix-seh**

下载 [CMake](https://cmake.org/download/) -- 环境变量

**.cargo/config**
```
[source.crates-io]
registry = "https://github.com/rust-lang/crates.io-index"

replace-with = 'tuna'
[source.tuna]
registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"
```

**mysqlclient**

安装 [MySQL Connector/C](https://downloads.mysql.com/archives/c-c/)

设置环境变量：MYSQLCLIENT_LIB_DIR

默认在 C:\Program Files\MySQL\MySQL Connector C 6.1\lib\vs14

然后执行 cargo install diesel_cli --no-default-features --features mysql
