#!/bin/bash

# workspace keybinds
for i in {1..10}
do
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i ["'<Super>$i'"]
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i ["'<Super><Shift>$i'"]
done

# window positioning
gsettings set org.gnome.desktop.wm.keybindings switch-applications ["'<Super>l'"]
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward ["'<Super>h'"]

gsettings set org.gnome.desktop.wm.keybindings switch-windows ["'<Super>j'"]
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward ["'<Super>k'"]

gsettings set org.gnome.desktop.wm.keybindings move-to-side-n ["'<Super><Shift>k'"]
gsettings set org.gnome.desktop.wm.keybindings move-to-side-e ["'<Super><Shift>l'"]
gsettings set org.gnome.desktop.wm.keybindings move-to-side-s ["'<Super><Shift>j'"]
gsettings set org.gnome.desktop.wm.keybindings move-to-side-w ["'<Super><Shift>h'"]

gsettings set org.gnome.desktop.wm.keybindings move-to-corner-ne ["'<Super><Shift>kl'"]
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-nw ["'<Super><Shift>kh'"]
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-se ["'<Super><Shift>jl'"]
gsettings set org.gnome.desktop.wm.keybindings move-to-corner-sw ["'<Super><Shift>jh'"]

# move to monitors
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up ["'<Super><Alt>k'"]
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down ["'<Super><Alt>j'"]
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left ["'<Super><Alt>h'"]
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right ["'<Super><Alt>l'"]

