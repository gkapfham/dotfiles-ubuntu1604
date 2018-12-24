# ~/.profile: executed by the command interpreter for login shells.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# GTK configuration
export APPMENU_DISPLAY_BOTH=1
if [ -n "$GTK_MODULES" ]
then
  GTK_MODULES="$GTK_MODULES:unity-gtk-module"
else
  GTK_MODULES="unity-gtk-module"
fi

if [ -z "$UBUNTU_MENUPROXY" ]
then
  UBUNTU_MENUPROXY=1
fi
export GTK_MODULES
export UBUNTU_MENUPROXY

# add rust to the path
export PATH="$HOME/.cargo/bin:$PATH"

# set the wallpaper for i3
feh --bg-fill ~/configure/wallpaper/mountains.png

# run the Gnome keyring manager
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start) &
    export SSH_AUTH_SOCK
fi