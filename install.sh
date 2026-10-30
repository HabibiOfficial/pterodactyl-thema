#!/bin/bash
# Installer tema overlay Pterodactyl 1.15.2 — non-destruktif, tanpa migrate, tanpa composer.
# Pemakaian (dari folder repo ini, sebagai root):
#   ./install.sh <slug>              # pasang tema dari ./themes/<slug>.tar.gz
#   ./install.sh stock               # balik ke tampilan standar (juga hapus file CSS tema)
#   ./install.sh <slug> /path/x.tar.gz  # pasang dari tarball lain
# Panel sempat down sebentar selama instalasi; server TIDAK terganggu (server jalan di Wings, bukan di panel).
# File .env TIDAK PERNAH ditimpa (tarball tema tidak berisi .env, dan script ini memeriksa + mengembalikannya).
set -u
PANEL_DIR="${PANEL_DIR:-/var/www/pterodactyl}"
if [ "$(id -u)" -ne 0 ]; then echo "Jalankan sebagai root (sudo -i dulu)."; exit 1; fi
if [ $# -lt 1 ]; then echo "Pakai: $0 <slug|stock> [tarball]"; exit 1; fi
SLUG="$1"
DIR="$(cd "$(dirname "$0")" && pwd)"
TARBALL="${2:-$DIR/themes/$SLUG.tar.gz}"
[ -f "$TARBALL" ] || { echo "Tarball tidak ditemukan: $TARBALL"; exit 1; }
cd "$PANEL_DIR" || { echo "Panel tidak ditemukan: $PANEL_DIR"; exit 1; }
BK="/tmp/pterodactyl-theme-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BK"
cp -a resources/views/layouts/admin.blade.php resources/views/templates/wrapper.blade.php .env "$BK/" 2>/dev/null || true
echo "Backup layout + .env di: $BK"
up() { cd "$PANEL_DIR" && php artisan up; }
trap up EXIT
cp .env /tmp/pterodactyl-theme-env.bak
php artisan down
tar -xzf "$TARBALL"
if ! diff -q .env /tmp/pterodactyl-theme-env.bak >/dev/null 2>&1; then
  echo ".env berubah saat ekstrak — dikembalikan dari backup."
  cp /tmp/pterodactyl-theme-env.bak .env
fi
if [ "$SLUG" = "stock" ]; then rm -rf public/css/themes; fi
chmod -R 755 storage/* bootstrap/cache
php artisan view:clear
php artisan config:clear
php artisan optimize
chown -R www-data:www-data "$PANEL_DIR"
php artisan up
trap - EXIT
echo "SELESAI: tema '$SLUG' terpasang. Refresh panel (Ctrl+Shift+R kalau tampilan belum berubah)."
