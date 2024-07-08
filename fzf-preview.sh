#!/bin/sh
case "$(file -L -b --mime-type "$1")" in
    text/* | application/json)
        bat --style=numbers --color=always "$1" ;;
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
        tree -C "$1" | head -200 ;;
    *)
        echo "Don't know how to preview '$1'" ;;
esac
