#!/bin/bash

# Killing all klipper processes
echo "Killing all klipper-processes"
killall klipper 2>/dev/null

echo "deleting following files;  ~/.config/autostart/klipper.desktop,  /etc/xdg/autostart/klipper.desktop"
# Removing files mentioned above
rm -fv ~/.config/autostart/klipper.desktop
rm -fv  /etc/xdg/autostart/klipper.desktop

echo "checking if  ~/.config/klipperrc exists, moving it to ~/.config/klipperrc.backup if it does exist"
if [ -f ~/.config/klipperrc ]; then
    mv ~/.config/klipperrc ~/.config/klipperrc.backup
else
    echo "~/.config/klipperrc not found, skipping..."
fi

# deleting klipper
echo "deleting klipper"
rm -fv /usr/share/applications/org.kde.klipper.desktop
rm -fv /usr/bin/klipper

echo "Klipper has been deleted,disabled. It won't bother you until the next update!"
# where pacman hooks live > /etc/pacman.d/hooks