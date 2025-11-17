# 从 U 盘恢复系统

准备 2 个 U 盘

下载系统镜像 dmg 或者 pkg

按住 Command + R 进入 macOS 实用工具

使用磁盘工具格式化要制作的 U 盘(USBName2)为 Mac OS 扩展(日志式)

## dmg

挂载 dmg

```
hdiutil attach /Volumes/USBName1/XXX.dmg
```

```
/Volumes/XXX.app/Contents/Resources/createinstallmedia --volume /Volumes/USBName2
```

输入 Y 回车

## pkg

安装 pkg

```
installer -pkg /Volumes/USBName1/XXX.pkg -target /Volumes/USBName1/directory
```

```
/Volumes/USBName1/directory/XXX.app/Contents/Resources/createinstallmedia --volume /Volumes/USBName2
```

重启 - 按住 Option 选择启动盘 - 安装

### 如果 "应用副本已损坏"

关闭网络 关闭 wifi

终端

```
date 062614102014.30
```
