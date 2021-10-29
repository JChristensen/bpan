#!/bin/bash
# Enable and start the bpan services and timers
systemctl --user enable bpan.service
systemctl --user enable bpan.timer
systemctl --user enable bpan-stop.service
systemctl --user enable bpan-stop.timer
systemctl --user start bpan.timer
systemctl --user start bpan-stop.timer
