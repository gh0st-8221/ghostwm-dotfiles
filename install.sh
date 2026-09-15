mkdir -p ~/git
git clone https://github.com/gh0st-8221/ghostwm-dotfiles.git ~/git/ghostwm-dotfiles
git clone https://github.com/gh0st-8221/ghostwm ~/git/ghostwm

sudo pacman -Syu --noconfirm 7zip alacritty android-tools android-udev arduino-cli base base-devel bluez bluez-utils bottom cava chrpath cmake cmatrix dpkg dunst efibootmgr fastfetch fd firefox flatbuffers freetds git github-cli glib2-devel gradle grub gst-plugin-pipewire helix htop imagemagick intel-ucode jdk17-openjdk jdk21-openjdk kdenlive kicad libayatana-appindicator libdisplay-info libfbclient libftdi libinput libpulse libva-nvidia-driver libxkbcommon linux linux-firmware lua51 make mariadb-libs meson mkinitcpio mpv network-manager-applet networkmanager ninja nvidia-open obs-studio openrgb os-prober pipewire pipewire-alsa pipewire-jack pipewire-pulse pkgconf pkgfile playerctl polybar postgresql-libs python-pyserial qbittorrent qt6-serialport qt6-svg rofi rust scanmem sdbus-cpp seatd smartmontools sof-firmware steam sudo tor torbrowser-launcher ttf-nerd-fonts-symbols ueberzugpp unzip usbutils v4l2loopback-dkms v4l2loopback-utils wget wireplumber wpa_supplicant xdg-utils xorg-server xorg-xinit xorg-xwayland yazi zram-generator zsh  libdisplay-info libinput seatd mesa libxkbcommon

cd ~/git/ghostwm
make
if [ -d ~/git/ghostwm-dotfiles/usr/share/grub/themes/catppuccin-mocha-grub-theme ]; then
    sudo cp -r ~/git/ghostwm-dotfiles/usr/share/grub/themes/catppuccin-mocha-grub-theme /usr/share/grub/themes/
fi

if [ -f ~/git/ghostwm-dotfiles/etc/default/grub ]; then
    sudo cp ~/git/ghostwm-dotfiles/etc/default/grub /etc/default/grub
fi

sudo grub-mkconfig -o /boot/grub/grub.cfg

mkdir -p ~/.config
cp -r ~/git/ghostwm-dotfiles/.config/. ~/.config/
cp ~/git/ghostwm-dotfiles/.zshrc ~/.zshrc
cp ~/git/ghostwm-dotfiles/.zprofile ~/.zprofile

chsh -s $(which zsh) $USER
sudo chsh -s $(which zsh) root

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/plugins/zsh-syntax-highlighting

systemctl --user enable --now pipewire.service
systemctl --user enable --now pipewire-pulse.service
systemctl --user enable --now wireplumber.service