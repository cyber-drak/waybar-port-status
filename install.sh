#!/usr/bin/env bash
set -euo pipefail
dir="$(cd "$(dirname "$0")" && pwd)"
cfg="${XDG_CONFIG_HOME:-$HOME/.config}/server-port-status"

mkdir -p "$HOME/.local/bin" "$cfg"
install -m755 "$dir/port-status-waybar" "$HOME/.local/bin/"
[[ -f "$cfg/ssh" ]] || install -m644 "$dir/ssh.example" "$cfg/ssh"

echo "Done. See README for Waybar setup."
