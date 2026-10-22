#!/usr/bin/env bash
# Flux installer (Linux). Usage: install.sh [--dry-run]
set -euo pipefail
DRY=0; [[ "${1:-}" == "--dry-run" ]] && DRY=1
run() { if (( DRY )); then echo "[dry-run] $*"; else "$@"; fi; }
HERE="$(cd "$(dirname "$0")/.." && pwd)"

[[ "$(uname -s)" == "Linux" ]] || { echo "flux-installer targets Linux (PipeWire)."; exit 1; }

echo "==> Realtime audio permissions"
getent group audio >/dev/null && run sudo usermod -aG audio "$USER"
command -v rtkit-daemon >/dev/null || echo "warn: rtkit not found; install it via your package manager"

echo "==> PipeWire low-latency (quantum 64 @ 48k)"
DEST="${XDG_CONFIG_HOME:-$HOME/.config}/pipewire/pipewire.conf.d"
run mkdir -p "$DEST"
run cp "$HERE/pipewire/99-flux-lowlatency.conf" "$DEST/"
run systemctl --user restart pipewire pipewire-pulse wireplumber || true

echo "==> Host + plugins: TODO (flatpak/ manifest, plugin fetchers)"
echo "Done."
