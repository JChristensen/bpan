# BPAN - Bash Privacy Automatic Navigator
https://github.com/JChristensen/bpan  
README file  

## License
BPAN - Bash Privacy Automatic Navigator Copyright (C) 2021 Jack Christensen GNU GPL v3.0

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3.0 as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/gpl.html>

## Overview
BPAN Uses `wget` to do random Google searches and retrieve random pages from Wikipedia.

Runs on Raspberry Pi OS and probably many other Debian-based distros.

The script accepts a few command-line arguments:

`-s` saves retrieved web pages to `/tmp/bpan` -- this is mostly for debugging and verification purposes.

`-q` invokes wget in quiet mode, so that the script does not generate any output, and sends retrieved web pages to `/dev/null`.

`-h` prints brief help information.

Running the script without command-line arguments causes the retrieved web pages to be sent to `/dev/null`.

Inspired by <https://create.arduino.cc/projecthub/cstram/apan-arduino-privacy-automatic-navigator-0c7c85>

## Installation
BPAN is scheduled to start and stop at any desired times via systemd and runs as a normal user (i.e. your user ID).

Clone a copy of the project from GitHub so that it resides in /home/$USER/bpan:  
`$ git clone https://github.com/JChristensen/bpan`  

Change to the bpan directory:  
`$ cd bpan`

Edit the `OnCalendar` line in the `bpan.timer` file for the desired start time.

Edit the `OnCalendar` line in the `bpan-stop.timer` file for the desired stop time.

Run the script to install the systemd unit files:  
`$ ./install-unit-files.sh`

Run the script to start the BPAN services and timers:  
`$ ./enable-bpan.sh`

To suspend bpan operation, run the script:  
`$ ./disable-bpan.sh`