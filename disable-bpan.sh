#!/bin/bash
# Stop and disable the bpan services and timers
systemctl --user stop bpan.timer
systemctl --user disable bpan.timer
systemctl --user stop bpan-stop.timer
systemctl --user disable bpan-stop.timer
systemctl --user stop bpan.service
systemctl --user disable bpan.service
systemctl --user stop bpan-stop.service
systemctl --user disable bpan-stop.service
