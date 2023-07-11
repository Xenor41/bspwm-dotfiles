#!/bin/bash

clear
echo "██████╗ ███████╗██████╗ ██╗    ██╗███╗   ███╗    ██████╗  ██████╗ ████████╗███████╗"
echo "██╔══██╗██╔════╝██╔══██╗██║    ██║████╗ ████║    ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝"
echo "██████╔╝███████╗██████╔╝██║ █╗ ██║██╔████╔██║    ██║  ██║██║   ██║   ██║   ███████╗"
echo "██╔══██╗╚════██║██╔═══╝ ██║███╗██║██║╚██╔╝██║    ██║  ██║██║   ██║   ██║   ╚════██║"
echo "██████╔╝███████║██║     ╚███╔███╔╝██║ ╚═╝ ██║    ██████╔╝╚██████╔╝   ██║   ███████║"
echo "╚═════╝ ╚══════╝╚═╝      ╚══╝╚══╝ ╚═╝     ╚═╝    ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝ By Fab1anDev"



#Install Yay
ISYAY=/sbin/yay
if [ -f "$ISYAY" ]; then 
    echo -e "yay was located, moving on.\n"
    yay -Suy
else 
    sudo pacman -S git
    git clone https://aur.archlinux.org/yay-bin
    cd yay-bin
    makepkg -si
    cd ..
fi

    

read -n1 -rep 'Install Packages for BSPWM? (y,n)' YayOrNay
if [[ $YayOrNay == "Y" || $YayOrNay == "y" ]]; then

    #Install Packages
    yay -S paru
    paru -S kitty polybar rofi bspwm-rounded-corners-git xdg-user-dirs nautilus xorg picom pavucontrol blueberry xfce4-power-manager feh lxappearance papirus-icon-theme file-roller gtk-engines gtk-engine-murrine neofetch imagemagick parcellite xclip maim gpick curl jq tint2 zsh moreutils recode dunst plank python-xdg redshift mate-polkit xfce4-settings mpv yaru-sound-theme fish alsa-utils slim xorg-xinit brightnessctl acpi mugshot playerctl python-pytz glava wmctrl i3lock-color jgmenu inter-font networkmanager-dmenu-git conky-lua bsp-layout zscroll noise-suppression-for-voice starship system76-power lsof gamemode lib32-gamemode xdo bluez bluez-utils bluez-libs bluez-tools python python- pip firefox-developer-edition gtk-layer-shell cmake github-desktop code postman qbittorrent cava pipes.sh 
    pip install pylrc --break-system-packages

    #Install EWW
    git clone https://github.com/elkowar/eww.git
    cd eww
    cargo build --release -j $(nproc)
    sudo cp -r target/release/eww /usr/bin/eww
    cd ..

    #Download xqp
    git clone https://github.com/baskerville/xqp.git
    cd xqp
    make
    sudo make install
    cd ..

    #Download themes
    git clone https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme.git
    cd Tokyo-Night-GTK-Theme/
    sudo mv themes/Tokyonight-Dark-BL /usr/share/themes/
    cd ..

    #Install the Dots
    sudo cp -r .config .scripts .local .cache .wallpapers ~/
    sudo cp -r .xinitrc .gtkrc-2.0 ~/

    #Install Fonts
    cd .fonts
    mv * /usr/share/fonts
    cd ..

    #Move Files to /etc
    cd etc/
    sudo mv slim.conf environment /etc/
    cd ..

    #Move Files to /usr
    sudo cp -r usr/* /usr/

else
    echo "Idk what i say here bro but have a good day :D"

fi
clear


read -n1 -rep 'Start BSPWM? (y,n)' bspwm
if [[ $bspwm == "Y" || $bspwm == "y" ]]; then
    exec Hyprland
else
    exit
fi


