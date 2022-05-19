export _JAVA_AWT_WM_NONREPARENTING=1
export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1

dbus-update-activation-environment --systemd DISPLAY

exec systemd-cat --identifier=sway sway
