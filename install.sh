#!/bin/bash
set -e

echo "Diego's Hyprland dotfiles setup script"
echo "======================================="

# Update system
echo "Updating system packages..."
sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel --noconfirm

# Install packages via yay
echo "Installing packages via yay..."
yay -S --needed --noconfirm \
    spotify socat paru zsh brightnessctl cava gnome-keyring \
    waybar nemo nemo-fileroller nemo-preview nemo-image-converter firefox \
    webcord visual-studio-code-bin hyprpaper network-manager-applet \
    grim slurp gtklock wofi kitty blueman fastfetch spicetify-cli \
    catppuccin-gtk-theme-mocha sddm zsh-autosuggestions zsh-syntax-highlighting \
    zathura xdg-desktop-portal-hyprland neovim btop gitui \
    ttf-ubuntu-mono-nerd ttf-dejavu ttf-bitstream-vera noto-fonts cantarell-fonts \
    ttf-iosevka otf-font-awesome ttf-firacode-nerd wlogout github-cli ttf-twemoji \
    lutris polkit-kde-agent swaync pnpm nvm \
    pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber \
    lib32-pipewire lib32-pipewire-jack \
    qt5-wayland

# Install Oh-My-Zsh
echo "Installing Oh-My-Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Optional: Remove intel driver if causing issues
# yay -R xf86-video-intel --noconfirm

# Switch to zsh
echo "Switching shell to zsh..."
chsh -s /usr/bin/zsh

# Create directories
echo "Creating directories..."
mkdir -p ~/GitHub
mkdir -p ~/Pictures
mkdir -p ~/.config/fontconfig
mkdir -p ~/.zsh

# Copy dotfiles
echo "Copying dotfiles..."
cp -r hypr ~/.config/
cp -r kitty ~/.config/
cp -r gtklock ~/.config/
cp -r waybar ~/.config/
cp -r wofi ~/.config/
cp -r cava ~/.config/
cp -r zathura ~/.config/
cp -r wlogout ~/.config/
cp -r gtk-3.0 ~/.config/
cp -r Webcord/Themes ~/.config/WebCord/
cp -r nvim ~/.config/
cp -r btop ~/.config/
cp -r gitui ~/.config/
cp .zshrc ~/
cp wallpaper.jpg ~/Pictures/
cp fonts.conf ~/.config/fontconfig/
cp code-flags.conf electron-flags.conf electron19-flags.conf ~/.config/

# Set default terminal to kitty
echo "Setting default terminal to kitty..."
gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty || true

# Setup GRUB theme
echo "Setting up GRUB theme..."
git clone --depth 1 https://github.com/catppuccin/grub.git /tmp/catppuccin-grub
sudo cp -r /tmp/catppuccin-grub/src/* /usr/share/grub/themes/
sudo cp grub-config/grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg
rm -rf /tmp/catppuccin-grub

# Setup SDDM
echo "Setting up SDDM..."
sudo cp -r sddm.conf.d /etc/
git clone --depth 1 https://github.com/catppuccin/sddm.git /tmp/catppuccin-sddm
sudo cp -r /tmp/catppuccin-sddm/src/catppuccin-mocha /usr/share/sddm/themes/
sudo systemctl enable sddm.service
sudo cp 10-monitor.conf /etc/X11/xorg.conf.d/
rm -rf /tmp/catppuccin-sddm

# Setup zsh syntax highlighting theme
echo "Setting up zsh syntax highlighting..."
git clone --depth 1 https://github.com/catppuccin/zsh-syntax-highlighting.git /tmp/zsh-catppuccin
cp /tmp/zsh-catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh/
rm -rf /tmp/zsh-catppuccin

# GTK theme
echo "Setting GTK theme..."
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Standard-Pink-dark" || true
gsettings set org.gnome.desktop.wm.preferences theme "Catppuccin-Mocha-Standard-Pink-dark" || true

# Enable services
echo "Enabling services..."
systemctl --user enable pipewire pipewire-pulse wireplumber || true
sudo systemctl enable bluetooth || true

# Spicetify setup (optional - requires Spotify installed)
if command -v spicetify &> /dev/null && [ -d /opt/spotify ]; then
    echo "Setting up Spicetify..."
    sudo chmod a+wr /opt/spotify
    sudo chmod a+wr /opt/spotify/Apps -R
    git clone --depth 1 https://github.com/catppuccin/spicetify /tmp/spicetify-catppuccin
    cp -r /tmp/spicetify-catppuccin/catppuccin-* ~/.config/spicetify/Themes/
    cp /tmp/spicetify-catppuccin/js/* ~/.config/spicetify/Extensions/
    spicetify backup apply
    spicetify config current_theme catppuccin color_scheme mocha
    spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
    spicetify apply
    rm -rf /tmp/spicetify-catppuccin
fi

# Remove conflicting portals
echo "Cleaning up conflicting XDG portals..."
yay -R --noconfirm xdg-desktop-portal-gtk xdg-desktop-portal-gnome 2>/dev/null || true

echo ""
echo "Done! Please reboot your system."
echo "Don't forget to create ~/.env.secrets for your API keys."
