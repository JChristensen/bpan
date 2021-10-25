# BPAN - Bash Privacy Automatic Navigator
https://github.com/JChristensen/bpan  
README file  

## License
BPAN - Bash Privacy Automatic Navigator Copyright (C) 2021 Jack Christensen GNU GPL v3.0

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3.0 as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/gpl.html>

## Introduction
Uses `wget` to do random Google searches and retrieve random pages from Wikipedia.

Runs on Raspberry Pi OS and probably many other Debian-based distros.

Run the script with the `-s` command-line argument to save the retrieved web pages to `/tmp/bpan` -- this is mostly for debugging and verification purposes.

Run the script without command-line arguments and the retrieved web pages are sent to `/dev/null`.

Inspired by <https://create.arduino.cc/projecthub/cstram/apan-arduino-privacy-automatic-navigator-0c7c85>
