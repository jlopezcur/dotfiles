#!/bin/sh

# set -C -f -u

# Arguments
# https://pkg.go.dev/github.com/gokcehan/lf#hdr-Previewing_Files
# ------------------------------------------------------------------------------
# $1 File path
# $2 Width
# $3 Height
# $4 Horizontal position
# $5 Vertical position

# Requirements
# ------------------------------------------------------------------------------
# Compressed files
# - tar|xz|unzip|unrar|7z
# Document files
# - odt2txt
# - catdoc: doc viewer
# - docx2txt
# - pdftotext
# Images/Audio/Video
# - chafa: images to chars
# - mediainfo: info about media files
# Code
# - bat: syntax highlighting
# - glow: syntax highlighting for Markdown

case "$1" in
  # Compressed files
  *.tgz|*.tar.gz) tar tzf "$1";;
  *.tar.bz2|*.tbz2) tar tjf "$1";;
  *.tar.txz|*.txz) xz --list "$1";;
  *.tar) tar tf "$1";;
  *.zip|*.jar|*.war|*.ear|*.oxt) unzip -l "$1";;
  *.rar) unrar l "$1";;
  *.7z) 7z l "$1";;
  # ???
  *.[1-8]) man "$1" | col -b ;;
  *.o) nm "$1" | less ;;
  # Documents files
  *.odt|*.ods|*.odp|*.sxw) odt2txt "$1";;
  *.doc) catdoc "$1" ;;
  *.docx) docx2txt "$1" - ;;
  *.csv) cat "$1" | sed s/,/\\n/g ;;
  *.pdf) pdftotext "$1" - ;;
  # Images files
  *.bmp|*.jpg|*.jpeg|*.png|*.xpm|*.svg|*.tif|*.tiff) chafa --fill=block --symbols=block -c full -s "$2"x"$3" "$1" || exit 1;;
  # Audio files
  *.wav|*.mp3|*.m4a|*.wma|*.ape|*.ac3|*.og[agx]|*.spx|*.opus|*.as[fx]|*.flac) mediainfo "$1";;
  # Video files
  *.avi|*.mp4|*.wmv|*.dat|*.3gp|*.ogv|*.mkv|*.mpg|*.mpeg|*.vob|*.fl[icv]|*.m2v|*.mov|*.webm|*.mts|*.m4v|*.r[am]|*.qt|*.divx) mediainfo "$1";;
  # Code files
  *.md) glow -p "$1" ;;
  # Rest as code files
  *) bat --color always -p "$1" || cat "$1";;
esac
