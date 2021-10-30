#!/bin/bash
# Remove the bpan units
./disable-bpan.sh
rm -v /home/$USER/.config/systemd/user/bpan*
systemctl --user daemon-reload
systemctl --user reset-failed
