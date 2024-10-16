echo "Conrad's hyprland config setup script"
echo "Don't forget to chmod +x first"
echo "Updating system packages"
sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel --noconfirm

echo "Grabbing packages via yay"
yay -S catch2-git spotify socat paru zsh brightnessctl cava gnome-keyring waybar-hyprland-git nemo nemo-fileroller nemo-preview nemo-image-converter firefox \
webcord xed visual-studio-code-bin hyprpaper-git network-manager-applet auto-cpufreq grim-git slurp gtklock wofi alacritty \
blueman pfetch spicetify-cli catppuccin-gtk-theme-mocha sddm-git zsh-autosuggestions zsh-syntax-highlighting-git zathura \
xviewer xplayer xdg-desktop-portal-hyprland-git ttf-ubuntu-mono-nerd ttf-dejavu ttf-bitstream-vera noto-fonts cantarell-fonts ttf-iosevka \
otf-font-awesome starship ttf-firacode-nerd wlogout github-cli ttf-twemoji lutris \
folder-color-switcher nemo-python-git polkit-kde-agent dunst pnpm nvm \
pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber \
lib32-pipewire lib32-pipewire-jack \
amdvlk lib32-amdvlk mesa \
dxvk-bin --noconfirm

#optional iwgtk light ripgrep bc gojq blueberry

echo "Removing the shitty intel gpu driver"
yay -R xf86-video-intel --noconfirm

echo "Switching from bash to zsh"
chsh -s /usr/bin/zsh
echo "Moving dot files"
echo "Making github folder"
mkdir ~/GitHub
echo "Moving hyprland dots"
cp -r hypr ~/.config/
echo "Moving wrappedh1.desktop"
cp wrappedh1.desktop ~/.local/bin/
cp wrappedh1.desktop /usr/share/wayland-sessions/
echo "Setting background photo"
cp wallpaper.jpg ~/Pictures/
echo "Moving alacritty dots"
cp -r alacritty ~/.config/
echo "Moving gtklock dots"
cp -r gtklock ~/.config/
echo "Moving waybar dots"
cp -r waybar ~/.config/
echo "Moving wofi dots"
cp -r wofi ~/.config/
echo "Moving cava dots"
cp -r cava ~/.config/
echo "Moving zathura dots"
cp -r zathura ~/.config/
echo "Set default terminal to alacritty"
gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty
echo "Setting grub theme"
git clone https://github.com/catppuccin/grub.git
sudo cp -r grub/src/* /usr/share/grub/themes/
sudo cp grub-config/grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo dracut-rebuild
echo "Removing catppuccin grub repo"
rm -rf grub
echo "Moving SDDM dots"
sudo cp -r sddm.conf.d /etc/
echo "Cloning SDDM theme"
git clone https://github.com/catppuccin/sddm.git
echo "Moving SDDM theme"
sudo cp -r sddm/src/catppuccin-mocha /usr/share/sddm/themes/
echo "Creating symlinks for SDDM"
sudo systemctl enable sddm.service
echo "Changing sddm resolution"
sudo cp 10-monitor.conf /etc/X11/xorg.conf.d/
echo "Removing sddm catppuccin"
rm -rf sddm
#echo "Enabling auto-cpufreq"
#sudo systemctl enable auto-cpufreq
#sudo systemctl start auto-cpufreq
echo "Removing zsh syntax theme".config/alacritty/catppuccin
rm -rf zsh-syntax-highlighting
echo "Getting spotifywm"
git clone https://github.com/amurzeau/spotifywm.git ~/GitHub/spotifywm
echo "Building spotifywm"
make -C ~/GitHub/spotifywm/
echo "Moving starship config"
cp starship.toml ~/.config/
echo "Move electron wayland flags"
cp code-flags.conf ~/.config/
cp electron-flags.conf ~/.config/
cp electron19-flags.conf ~/.config/
echo "Move wlogout config"
cp -r wlogout ~/.config/
echo "Grabbing catppuccin zsh syntax highlighting"
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
mkdir ~/.zsh
cp -v zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh/
echo "Changing gtk to dark mode"
cp -r gtk-3.0 ~/.config/
echo "Change system gtk to catppuccin pink dark"
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Standard-Pink-dark"
gsettings set org.gnome.desktop.wm.preferences theme "Catppuccin-Mocha-Standard-Pink-dark"
echo "Moving .zshrc"
cp .zshrc ~/
echo "Enabling bluetooth"
systemctl enable bluetooth
echo "Move webcord theme"
cp -r Webcord/Themes ~/.config/WebCord/
echo "Enabling emojis"
mkdir ~/.config/fontconfig
cp fonts.conf ~/.config/fontconfig/
echo "Spicetify Catppuccion"
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
git clone https://github.com/catppuccin/spicetify
cp -r spicetify/catppuccin-* ~/.config/spicetify/Themes/
cp spicetify/js/* ~/.config/spicetify/Extensions/
spicetify backup
spicetify config current_theme catppuccin
spicetify config color_scheme mocha
spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify apply
sudo rm -rf spicetify
echo "Fix xdg shit just in case"
yay -S qt5-wayland --noconfirm
yay -R xdg-desktop-portal-gtk xdg-desktop-portal-gnome --noconfirm
echo "Done script"

exit
