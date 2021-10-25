#!/bin/bash
# BPAN - Bash Privacy Automatic Navigator
# Inspired by https://create.arduino.cc/projecthub/cstram/apan-arduino-privacy-automatic-navigator-0c7c85
# 24Oct2021

usage()
{
    # a minimal amount of help
    PROGNAME=$(basename $0)
    echo -e "\n$PROGNAME usage: $PROGNAME [-h | -s]" >&2
    echo -e "\n  -h displays usage syntax." >&2
    echo -e "  -s saves browsed pages to tmp directory." >&2
    echo -e "\n  Runs in an infinite loop, browsing random web sites.\n" >&2
    return
}

# google search for a random string
google()
{
    # make a random string
    rand=$(mktemp --dry-run XXXXXXXXXX)
    
    url="https://www.google.com/search?q=$rand"
    if $SAVE_PAGES; then
        OUTPUT_FILE="$OUTPUT_DIR/g$(date +%Y%m%d-%H%M%S)"
    fi
    wget -nv --user-agent="" --output-document=$OUTPUT_FILE $url
}

# retrieve a random wikipedia article
wiki()
{
    url="https://en.wikipedia.org/wiki/Special:Random"
    if $SAVE_PAGES; then
        OUTPUT_FILE="$OUTPUT_DIR/w$(date +%Y%m%d-%H%M%S)"
    fi
    wget -nv --user-agent="" --output-document=$OUTPUT_FILE $url
}

# ==== MAIN SCRIPT STARTS HERE =========

# ---- user-configurable parameters ----
delay=15
OUTPUT_DIR="/tmp/bpan"
# --------------------------------------

# ---- don't change these, please ------
OUTPUT_FILE="/dev/null"
SAVE_PAGES=false
# --------------------------------------

# process command-line arguments
if [[ $# -gt 1 ]]; then
    echo -e "\nToo many arguments" >&2
    usage
    exit 1
fi

while [[ $# -gt 0 ]]; do
    case "$1" in
        -h) usage
            exit
            ;;
        -s) SAVE_PAGES=true
            # create the output directory if it doesn't exist
            if [ ! -d $OUTPUT_DIR ]; then
                mkdir $OUTPUT_DIR
            fi
            ;;
        *)  echo -e "\nUnrecognized argument: $1" >&2
            usage
            exit 2
            ;;
    esac
    shift
done

# loop forever
while (true); do
    google
    sleep $delay
    wiki
    sleep $delay
done
