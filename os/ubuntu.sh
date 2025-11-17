sudo sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list
sudo sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

sudo apt update -y
sudo apt install gcc git vim zsh konsole gnome-tweaks curl neofetch -y

sudo chsh -s /bin/zsh ${USER}
