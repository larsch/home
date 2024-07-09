#!/bin/sh
echo "\033[44;1m\033[2K $(file "$1") \033[0m"
case "$(file -L -b --mime-type "$1")" in
    text/* | application/json)
        if command -v bat >/dev/null; then
            bat --style=numbers --color=always "$1"
        elif command -v batcat >/dev/null; then
            batcat --style=numbers --color=always "$1"
        else
            cat "$1"
        fi ;;
    image/*)
        mediainfo "$1" ;;
    audio/*)
        mediainfo "$1" ;;
    video/*)
        mediainfo "$1" ;;
    application/pdf)
        pdftotext "$1" - ;;
    application/gzip)
        tar tfz "$1" ;;
    application/zip)
        unzip -l "$1" ;;
    application/x-tar)
        tar tf "$1" ;;
    application/x-bzip2)
        tar tfj "$1" ;;
    application/x-xz)
        tar tfJ "$1" ;;
    inode/directory)
        eza --colour=always -T "$1" | head -200 ;;
esac
