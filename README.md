# Some-Help

### 基本配置
#### Shadowrocket
```
https://cdn.jsdelivr.net/gh/ykong1337/some-help@master/Shadowrocket.conf
```
#### Quantumult X
```
https://cdn.jsdelivr.net/gh/ykong1337/some-help@master/QuanX.conf
```
#### Surge
```
https://cdn.jsdelivr.net/gh/ykong1337/some-help@master/Surge.conf
```
#### Clash
```
https://cdn.jsdelivr.net/gh/ykong1337/some-help@master/config.yaml
```
#### Clash配置位置
```
~/.config/clash/config.yaml
```
#### 多订阅用[URLEncode](https://www.urlencoder.org/)后的链接, 订阅之间用|分隔
```
Clash: 
https://sub.xeton.dev/sub?target=clash&list=true&url=订阅链接
https://sub.xeton.dev/sub?target=clash&list=true&url=Encode后的[订阅|订阅|...]

QuanX: 
https://sub.xeton.dev/sub?target=quanx&list=true&url=订阅链接
https://sub.xeton.dev/sub?target=quanx&list=true&url=Encode后的[订阅|订阅|...]

Surge: 
https://sub.xeton.dev/sub?target=surge&ver=4&list=true&url=订阅链接
https://sub.xeton.dev/sub?target=surge&ver=4&list=true&url=Encode后的[订阅|订阅|...]

Clash自动配置:
https://sub.xeton.dev/sub?target=clash&config=https%3A%2F%2Fraw.githubusercontent.com%2FACL4SSR%2FACL4SSR%2Fmaster%2FClash%2Fconfig%2FACL4SSR_Online_Mini.ini&url=订阅

[订阅转换](https://acl4ssr-sub.github.io/)
```

[Github加速转换](https://www.jsdelivr.com/github)

#### Windows开机自启
运行CMD，输入
```
shell:startup
```
把应用程序放入文件夹内

#### Docker
```
mysql
docker run --name some-mysql -p 3306:3306 -v /d/mysql/datadir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:latest
mongo
docker run --name some-mongo -p 27017:27017 -v /d/mongo/data:/data/db -d mongo:latest
redis
docker run --name some-redis -p 6379:6379 -v /d/redis/redis.conf:/etc/redis/redis.conf -v /d/redis/data:/data -d redis:latest redis-server /etc/redis/redis.conf --appendonly yes
nacos
docker run --name some-nacos -p 8848:8848 -e MODE=standalone -d nacos/nacos-server:2.0.3
```
#### 设置Git
**~/.gitconfig**
```
[http]
proxy = 127.0.0.1:7890
[https]
proxy = 127.0.0.1:7890
[user]
email = ykonghao@icloud.com
name = ykong1337
[pull]
rebase = false
[credential]
helper = store
[safe]
directory = *
[core]
autocrlf = false
[credential "helperselector"]
selected = manager
```
#### Git命令流程
```
git init
git commit -m "init"
git remote add origin https://github.com/user/repo.git
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
---normal
irm get.scoop.sh | iex
irm get.scoop.sh [-Proxy 'http://ip:port'] | iex
irm https://cdn.jsdelivr.net/gh/ScoopInstaller/Install@master/install.ps1 | iex
---admin
iex "& {$(irm https://cdn.jsdelivr.net/gh/ScoopInstaller/Install@master/install.ps1)} -RunAsAdmin"
---custom
irm get.scoop.sh -outfile 'install.ps1'
irm https://cdn.jsdelivr.net/gh/ScoopInstaller/Install@master/install.ps1 -outfile 'install.ps1'
./install.ps1 -ScoopDir 'D:\Scoop' -ScoopGlobalDir 'D:\Scoop\Apps' [-RunAsAdmin]
```
别名
```
scoop alias add i 'scoop install $args[0]';scoop alias add rm 'scoop uninstall $args[0]';scoop alias add ls 'scoop list';scoop alias add u 'scoop update $args[0]'
```
为scoop增加源
```
scoop bucket add main
scoop bucket add extras
scoop bucket add versions
scoop bucket add nonportable
scoop bucket add dorado https://github.com/chawyehsu/dorado
```
更新scoop已安装应用
```
scoop update *
```
清理cache
```
scoop cache rm *
scoop cleanup *
```
显卡驱动(NVIDIA)
```
sudo scoop install nonportable/nvidia-display-driver-dch-np
```
#### Rust-Windows
```
scoop install rustup
```
#### Rust-Linux
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
```
source "$HOME/.cargo/env"
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
**~/.cargo/config.toml**
**设置代理**
```
[http]
proxy = "127.0.0.1:7890"
[https]
proxy = "127.0.0.1:7890"
```
**Cargo Git Fetch**
windows
```
set CARGO_NET_GIT_FETCH_WITH_CLI=true
```
linux
```
vim ~/.bashrc
export CARGO_NET_GIT_FETCH_WITH_CLI=true
source ~/.bashrc
```
**mysqlclient**

安装 [MySQL Connector/C](https://downloads.mysql.com/archives/c-c/)

设置环境变量：MYSQLCLIENT_LIB_DIR

默认在 C:\Program Files\MySQL\MySQL Connector C 6.1\lib\vs14

然后执行
```
cargo install diesel_cli --no-default-features --features mysql
```
**Windows 关闭VBS**
```
sudo bcdedit /set hypervisorlaunchtype off
```
