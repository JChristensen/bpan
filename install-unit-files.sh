#!/bin/bash
# Copy systemd unit files (.service, .timer) to
# /home/$USER/.config/systemd/user/

# ensure the systemd user directory exists
sysdUser="/home/$USER/.config/systemd/user"
if [ ! -d $sysdUser ]; then
    mkdir -p $sysdUser
fi

cp -av *.service *.timer $sysdUser
sed -i s/UUUU/$USER/ $sysdUser/bpan.service
loginctl enable-linger $USER
systemctl --user daemon-reload
