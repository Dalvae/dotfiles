#!/bin/bash

# Config created by Keyitdev https://www.github.com/keyitdev/dotfiles
# Copyright (C) 2022 Keyitdev

config_directory="$HOME/.config"
fonts_directory="/usr/share/fonts"
scripts_directory="/usr/local/bin"
gtk_theme_directory="/usr/share/themes"

green='\033[0;32m'
no_color='\033[0m'
date=$(date +%s)

sudo pacman --noconfirm --needed -Sy dialog

system_update(){
    echo -e "${green}[*] Doing a system update, cause stuff may break if it's not the latest version...${no_color}"
    sudo pacman -Sy --noconfirm archlinux-keyring
    sudo pacman --noconfirm -Syu
    sudo pacman -S --noconfirm --needed base-devel wget git curl
}
install_aur_helper(){ 
    if ! command -v "$aurhelper" &> /dev/null
    then
    echo -e "${green}[*] It seems that you don't have $aurhelper installed, I'll install that for you before continuing.${no_color}"
    git clone https://aur.archlinux.org/"$aurhelper".git $HOME/.srcs/"$aurhelper"
    (cd $HOME/.srcs/"$aurhelper"/ && makepkg -si)
    else
    echo -e "${green}[*] It seems that you already have $aurhelper installed, skipping.${no_color}"
    fi
}
# add something to instal lib32 packages 
install_pkgs(){
    echo -e "${green}[*] Installing packages with pacman.${no_color}"
    sudo pacman -S --noconfirm --needed acpi alsa-utils base-devel curl git pulseaudio pulseaudio-alsa xorg xorg-xinit alacritty btop code dunst feh firefox i3-gaps libnotify light mpc mpd ncmpcpp nemo neofetch neovim pacman-contrib papirus-icon-theme picom polybar ranger rofi scrot slop xclip zathura zathura-pdf-mupdf zsh acpi alacritty alsa-utils baobab base base-devel blueman bluetooth-autoconnect bluez bluez-utils btop calibre cheese deluge dhcpcd dialog digikam discord dunst efibootmgr eog epiphany evince feh ffcast firefox foliate gamemode gimp git github-cli gnome-keyring gparted grilo-plugins grub gvfs-afc gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb i3-resurrect i3-wm i3lock-color intel-ucode iwd keyboard-visualizer-git lib32-alsa-lib lib32-alsa-plugins lib32-gamemode lib32-giflib lib32-gnutls lib32-gst-plugins-base-li.22. lib32-gtk3 lib32-libjpeg-turbo lib32-libpulse lib32-libva lib32-libva-mesa-driver lib32-libxcomposite lib32-libxinerama lib32-libxslt lib32-mesa-demos lib32-mesa-vdpau lib32-mpg123 lib32-nvidia-utils lib32-ocl-icd lib32-openal lib32-opencl-mesa lib32-sqlite lib32-v4l-utils lib32-vkd3d lib32-vulkan-mesa-layers libnotify libreoffice-fresh libva-mesa-driver light linux linux-firmware lutris lxpolkit-git maim mesa-demos mesa-vdpau mpc mpd nano nautilus ncmpcpp nemo nemo-fileroller neofetch neovim networkmanager noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ntfs-3g ntp nvidia nvidia-settings obs-studio oh-my-zsh-git opencl-mesa opencl-nvidia openrgb orca os-prober pacman-contrib papirus-icon-theme picom pipewire-media-session polkit-gnome polkit-kde-agent polybar pulseaudio pulseaudio-alsa pulsemixer python-cookiecutter python-pip qbittorrent qt5-graphicaleffects qt5-quickcontrols2 qt5-svg ranger rofi rygel scrot sddm simple-mtpfs simple-scan slop spotify-launcher stremio sushi ticktick totem tracker3-miners unetbootin unrar v4l2loopback-dkms visual-studio-code-bin vivaldi vkd3d vlc vnstat vulkan-mesa-layers vulkan-tools wget wine-staging xclip xdg-desktop-portal-gnome xdg-user-dirs-gtk xf86-video-vesa xfce-polkit xorg-bdftopcf xorg-docs xorg-font-util xorg-fonts-100dpi xorg-fonts-75dpi xorg-fonts-encodings xorg-iceauth xorg-mkfontscale xorg-server xorg-server-common xorg-server-devel xorg-server-xephyr xorg-server-xnest xorg-server-xvfb xorg-sessreg xorg-setxkbmap xorg-smproxy xorg-x11perf xorg-xauth xorg-xbacklight xorg-xcmsdb xorg-xcursorgen xorg-xdpyinfo xorg-xdriinfo xorg-xev xorg-xgamma xorg-xhost xorg-xinit xorg-xinput xorg-xkbcomp xorg-xkbevd xorg-xkbutils xorg-xkill xorg-xlsatoms xorg-xlsclients xorg-xmodmap xorg-xpr xorg-xprop xorg-xrandr xorg-xrdb xorg-xrefresh xorg-xset xorg-xsetroot xorg-xvinfo xorg-xwayland xorg-xwd xorg-xwininfo xorg-xwud yay yelp zathura zathura-cb zathura-pdf-mupdf zram-generator zsh
}
install_aur_pkgs(){
    echo -e "${green}[*] Installing packages with $aurhelper.${no_color}"
    "$aurhelper" -S --noconfirm --needed i3lock-color i3-resurrect ffcast oh-my-zsh-git
}
create_default_directories(){
    echo -e "${green}[*] Copying configs to $config_directory.${no_color}"
    mkdir -p "$HOME"/.config
    sudo mkdir -p  /usr/local/bin
    sudo mkdir -p  /usr/share/themes
    mkdir -p "$HOME"/pictures/wallpapers
}
create_backup(){
    echo -e "${green}[*] Creating backup of existing configs.${no_color}"
    [ -d "$config_directory"/alacritty ] && mv "$config_directory"/alacritty "$config_directory"/alacritty_$date && echo "alacritty configs detected, backing up."
    [ -d "$config_directory"/btop ] && mv "$config_directory"/btop "$config_directory"/btop_$date && echo "btop configs detected, backing up."
    [ -d "$config_directory"/dunst ] && mv "$config_directory"/dunst "$config_directory"/dunst_$date && echo "dunst configs detected, backing up."
    [ -d "$config_directory"/gtk-3.0 ] && mv "$config_directory"/gtk-3.0 "$config_directory"/gtk-3.0_$date && echo "gtk-3.0 configs detected, backing up."
    [ -d "$config_directory"/i3 ] && mv "$config_directory"/i3 "$config_directory"/i3_$date && echo "i3 configs detected, backing up."
    [ -d "$config_directory"/mpd ] && mv "$config_directory"/mpd "$config_directory"/mpd_$date && echo "mpd configs detected, backing up."
    [ -d "$config_directory"/ncmpcpp ] && mv "$config_directory"/ncmpcpp "$config_directory"/ncmpcpp_$date && echo "ncmpcpp configs detected, backing up."
    [ -d "$config_directory"/neofetch ] && mv "$config_directory"/neofetch "$config_directory"/neofetch_$date && echo "neofetch configs detected, backing up."
    [ -d "$config_directory"/nvim ] && mv "$config_directory"/nvim "$config_directory"/nvim_$date && echo "nvim configs detected, backing up."
    [ -d "$config_directory"/picom ] && mv "$config_directory"/picom "$config_directory"/picom_$date && echo "picom configs detected, backing up."
    [ -d "$config_directory"/polybar ] && mv "$config_directory"/polybar "$config_directory"/polybar_$date && echo "polybar configs detected, backing up."
    [ -d "$config_directory"/ranger ] && mv "$config_directory"/ranger "$config_directory"/ranger_$date && echo "ranger configs detected, backing up."
    [ -d "$config_directory"/rofi ] && mv "$config_directory"/rofi "$config_directory"/rofi_$date && echo "rofi configs detected, backing up."
    [ -d "$config_directory"/zathura ] && mv "$config_directory"/zathura "$config_directory"/zathura_$date && echo "zathura configs detected, backing up."

    [ -d "$scripts_directory" ] && sudo mv "$scripts_directory" "$scripts_directory"_$date && echo "scripts ($scripts_directory) detected, backing up."

    [ -f "$config_directory"/Code\ -\ OSS/User/settings.json ] && mv "$config_directory"/Code\ -\ OSS/User/settings.json "$config_directory"/Code\ -\ OSS/User/settings.json_$date && echo "Vsc configs detected, backing up."

    [ -f /fonts/local.conf ] && sudo mv /etc/fonts/local.conf /etc/fonts/local.conf_$date && echo "Fonts configs detected, backing up."
}
copy_configs(){
    echo -e "${green}[*] Copying configs to $config_directory.${no_color}"
    cp -r ./config/* "$config_directory"
}
copy_scripts(){
    echo -e "${green}[*] Copying scripts to $scripts_directory.${no_color}"
    sudo cp -r ./scripts/* "$scripts_directory"
}
copy_fonts(){
    echo -e "${green}[*] Copying fonts to $fonts_directory.${no_color}"
    sudo cp -r ./fonts/* "$fonts_directory"
    fc-cache -fv
}
copy_other_configs(){
    echo -e "${green}[*] Copying gtk theme to /usr/share/themes.${no_color}"
    sudo cp -r ./tokyonight_gtk /usr/share/themes
    echo -e "${green}[*] Copying wallpapers to "$HOME"/Pictures/wallpapers.${no_color}"
    cp -r ./wallpapers/* "$HOME"/Pictures/wallpapers
    echo -e "${green}[*] Copying vsc configs.${no_color}"
    cp -r ./vsc/* "$HOME"/.vscode-oss/extensions
    cp ./vsc/settings.json "$HOME"/.config/Code\ -\ OSS/User
    echo -e "${green}[*] Copying zsh configs.${no_color}"
    sudo cp ./keyitdev.zsh-theme /usr/share/oh-my-zsh/custom/themes
    cp ./.zshrc "$HOME"
}
install_additional_pkgs(){
    echo -e "${green}[*] Installing additional packages with $aurhelper.${no_color}"
    "$aurhelper" -S --noconfirm --needed dhcpcd gimp iwd libreoffice ntfs-3g ntp pulsemixer vnstat
}
install_emoji_fonts(){
    echo -e "${green}[*] Installing emoji fonts with $aurhelper.${no_color}"
    "$aurhelper" -S --noconfirm --needed noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
    sudo cp -f ./local.conf /etc/fonts
    fc-cache -fv
}
install_sddm(){
    echo -e "${green}[*] Installing sddm theme.${no_color}"
    "$aurhelper" -S --noconfirm --needed qt5-graphicaleffects qt5-quickcontrols2 qt5-svg sddm
    sudo systemctl enable sddm.service
    sudo git clone https://github.com/keyitdev/sddm-flower-theme.git /usr/share/sddm/themes/sddm-flower-theme
    sudo cp /usr/share/sddm/themes/sddm-flower-theme/Fonts/* /usr/share/fonts/
    echo "[Theme]
    Current=sddm-flower-theme" | sudo tee /etc/sddm.conf
}
finishing(){
    echo -e "${green}[*] Chmoding light.${no_color}"
    sudo chmod +s /usr/bin/light
    echo -e "${green}[*] Setting Zsh as default shell.${no_color}"
    chsh -s /bin/zsh
    sudo chsh -s /bin/zsh
    echo -e "${green}[*] Updating nvim extensions.${no_color}"
    nvim +PackerSync
}

cmd=(dialog --clear --title "Aur helper" --menu "Firstly, select the aur helper you want to install (or have already installed)." 10 50 16)
options=(1 "yay" 2 "paru")
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

case $choices in
    1) aurhelper="yay";;
    2) aurhelper="paru";;
esac

cmd=(dialog --clear --separate-output --checklist "Select (with space) what script should do.\\nChecked options are required for proper installation, do not uncheck them if you do not know what you are doing." 26 86 16)
options=(1 "System update" on
         2 "Install aur helper" on
         3 "Install basic packages" on
         4 "Install basic packages (aur)" on
         5 "Create default directories" on
         6 "Create backup of existing configs (to prevent overwritting)" on
         7 "Copy configs" on
         8 "Copy scripts" on
         9 "Copy fonts" on
         10 "Copy other configs (gtk theme, wallpaper, vsc configs, zsh configs)" on
         11 "Install additional packages" on
         12 "Install emoji fonts" on
         13 "Install sddm with flower theme" on
         14 "Make Light executable, set zsh as default shell, update nvim extensions." on)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

clear

for choice in $choices
do
    case $choice in
        1) system_update;;
        2) install_aur_helper;;
        3) install_pkgs;;
        4) install_aur_pkgs;;
        5) create_default_directories;;
        6) create_backup;;
        7) copy_configs;;
        8) copy_scripts;;
        9) copy_fonts;;
        10) copy_other_configs;;
        11) install_additional_pkgs;;
        12) install_emoji_fonts;;
        13) install_sddm;;
        14) finishing;;
    esac
done
