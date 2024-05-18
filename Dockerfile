FROM debian:12.2

# https://wiki.archlinux.org/title/Desktop_notifications#Standalone
RUN apt-get update && apt-get install -y \
    dbus \
    dbus-x11 \
    libnotify-bin \
    mate-notification-daemon

# https://askubuntu.com/a/1459113
RUN mkdir -p /usr/share/dbus-1/services && \
    cat <<EOF > /usr/share/dbus-1/services/org.freedesktop.Notifications.service
[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/mate-notification-daemon/mate-notification-daemon
EOF

# theme
# gsettings list-recursively org.mate.NotificationDaemon
# mate-notification-properties

# --icon
# https://specifications.freedesktop.org/icon-naming-spec/latest/ar01s04.html
# https://commons.wikimedia.org/wiki/GNOME_Desktop_icons

# Command to run your API service
CMD ["dbus-monitor"]
