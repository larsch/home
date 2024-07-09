#!/bin/bash
set -exu
set -o pipefail
mkdir -p "$HOME/bin" "$HOME/.local/completions"
url=$(curl -Lsf https://api.github.com/repos/eza-community/eza/releases/latest | jq -r '.assets[] | select(.name | contains("x86_64-unknown-linux-gnu.tar.gz")) | .browser_download_url')
curl -Lsf "$url" | tar -x -z -C "$HOME/bin"
url=$(curl -Lsf https://api.github.com/repos/eza-community/eza/releases/latest | jq -r '.assets[] | select(.name | contains("completions")) | .browser_download_url')
curl -Lsf "$url" | tar -z -x -C "$HOME/.local/completions" --wildcards --strip=3 './target/completions-*/_eza'
url=$(curl -Lsf https://api.github.com/repos/junegunn/fzf/releases/latest | jq -r '.assets[] | select(.name | contains("linux_amd64.tar.gz")) | .browser_download_url')
curl -Lsf "$url" | tar -x -z -C "$HOME/bin"
