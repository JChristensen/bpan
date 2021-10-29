#!/bin/bash
# Copy systemd unit files (.service, .timer) to
# /home/$USER/.config/systemd/user/

cp -av *.service *.timer /home/$USER/.config/systemd/user/
sed -i s/UUUU/$USER/ /home/$USER/.config/systemd/user/bpan.service
loginctl enable-linger $USER
systemctl --user daemon-reload
