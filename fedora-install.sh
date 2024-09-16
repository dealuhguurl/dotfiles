# dnf flags
echo 'max_parallel_downloads=20' | sudo tee -a /etc/dnf/dnf.conf
echo 'fastestmirror=True' | sudo tee -a /etc/dnf/dnf.conf

# flatpak repos
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update 

# rpm fusion repos
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm 
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm 

# Enable automatic security updates
echo -e '[commands] \nupgrade_type = security' > automatic.conf
sudo mv automatic.conf /etc/dnf/
sudo systemctl enable --now dnf-automatic-install.timer

# install icons
#cd && git clone https://github.com/vinceliuice/Tela-icon-theme.git && cd Tela-icon-theme && ./install.sh && cd && sudo rm -r Tela-icon-theme 

# packages
sudo dnf install g++ wayland-devel hyprland-devel hyprpaper hyprlock waybar dunst rofi-wayland neofetch nodejs clang-tools-extra htop curl neovim dnf-automatic mingw64-gcc-c++ fontawesome-fonts-all flatpak blueman pasystray pavucontrol sqlite kitty keepassxc python3-pip

# install codecs & drivers
sudo dnf install mpv akmod-nvidia

# update
sudo dnf update 

# reboot to load proprietary nvidia drivers 
reboot
