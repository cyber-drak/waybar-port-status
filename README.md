# server-port-status

Waybar module: open TCP ports + optional SSH tunnel checks.

Bar: `13` + plug icon, `2/3` + key icon (Font Awesome). Hover shows a table.

## Install

```bash
./install.sh
```

## SSH config (optional)

Edit `~/.config/server-port-status/ssh`:

```
vps:user@my-server.com
db:5433
```

- **Text** — matched against running `ssh`/`autossh` processes
- **Number** — checks if that local port is listening

## Waybar

Add to `~/.config/waybar/config.jsonc`:

```json
"custom/ports": {
  "format": "{}",
  "return-type": "json",
  "interval": 10,
  "escape": false,
  "exec": "~/.local/bin/port-status-waybar",
  "on-click": "footclient -e 'ss -tlnp'"
}
```

Add `"custom/ports"` to your `modules-right`.

Add to `~/.config/waybar/style.css` (needs Font Awesome installed):

```css
@import "style.css"; /* or copy from this repo */
```

Or paste from `style.css` in this repo.

Restart waybar:

```bash
killall waybar && waybar &
```

## Test

```bash
~/.local/bin/port-status-waybar | python3 -m json.tool
```

Tooltip example:

```
OPEN PORTS
PORT  BIND       PROCESS
─────────────────────────
5432  0.0.0.0    postgres
8080  127.0.0.1  node

SSH TUNNELS
NAME  STATUS
────────────
vps   up
db    down
```
