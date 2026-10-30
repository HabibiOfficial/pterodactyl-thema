# 8 Tema Panel Pterodactyl 1.15.2

Kumpulan tema overlay buat panel Pterodactyl **1.15.2** — tiap tema cuma mengubah file tampilan
(1 file CSS + 2 file layout Blade), dibangun dari panel **standar** 1.15.2. Tanpa migrate,
tanpa composer, tanpa ubah database/server. Ganti tema = timpa file tampilan aja, server tetap jalan.

> **PENTING — ganti dulu:** perintah di bawah pakai `OWNER` sebagai placeholder.
> Ganti `OWNER` dengan username GitHub pemilik repo ini setelah repo dibuat dan file release diunggah.
> Contoh: kalau repo-nya `HabibiOfficial/pterodactyl-thema`, maka `OWNER` = `HabibiOfficial`.
>
> **Hanya untuk panel 1.15.2.** Versi panel lain layout-nya bisa beda — jangan dipaksakan.
> Tiap instalasi bikin panel down sebentar (beberapa menit); server TIDAK terganggu.
> File `.env` tidak pernah ditimpa. Screenshot tiap tema menyusul (tema sudah dicek file +
> strukturnya, tapi belum dites live di panel).

## Daftar tema

| Tema | Tampilan |
|---|---|
| Dark Gaming Neon | Gelap + hijau neon & ungu nge-glow, gaya gamer |
| Branded Server Cloud ID | Biru-putih profesional + nama brand di header (Habibi Cloud Host ID) |
| Minecraft | Blok-blok piksel, hijau rumput + coklat tanah, font piksel |
| Minimal Modern | Bersih minimal, warna netral terang, banyak ruang kosong |
| Nebula | Gradasi ungu-biru luar angkasa + bintang, aksen glowing |
| Cyberpunk | Pink neon + cyan di atas gelap, gaya futuristik bersudut |
| Ocean | Gradasi biru-teal, motif ombak, kalem dan bersih |
| Royal Gold | Hitam + emas mewah, judul serif, aksen emas elegan |

## Cara pasang (satu perintah per tema, jalankan sebagai root di VPS, mis. `sudo -i` dulu)

### 1. Dark Gaming Neon
```bash
cd /var/www/pterodactyl && php artisan down && curl -L https://github.com/HabibiOfficial/pterodactyl-thema/releases/latest/download/dark-gaming-neon.tar.gz | tar -xzv && chmod -R 755 storage/* bootstrap/cache && php artisan view:clear && php artisan config:clear && php artisan optimize && chown -R www-data:www-data /var/www/pterodactyl; php artisan up
```

### 2. Branded Server Cloud ID
```bash
cd /var/www/pterodactyl && php artisan down && curl -L https://github.com/HabibiOfficial/pterodactyl-thema/releases/latest/download/server-cloud-id.tar.gz | tar -xzv && chmod -R 755 storage/* bootstrap/cache && php artisan view:clear && php artisan config:clear && php artisan optimize && chown -R www-data:www-data /var/www/pterodactyl; php artisan up
```

### 3. Minecraft
```bash
cd /var/www/pterodactyl && php artisan down && curl -L https://github.com/HabibiOfficial/pterodactyl-thema/releases/latest/download/minecraft.tar.gz | tar -xzv && chmod -R 755 storage/* bootstrap/cache && php artisan view:clear && php artisan config:clear && php artisan optimize && chown -R www-data:www-data /var/www/pterodactyl; php artisan up
```

### 4. Minimal Modern
```bash
cd /var/www/pterodactyl && php artisan down && curl -L https://github.com/HabibiOfficial/pterodactyl-thema/releases/latest/download/minimal-modern.tar.gz | tar -xzv && chmod -R 755 storage/* bootstrap/cache && php artisan view:clear && php artisan config:clear && php artisan optimize && chown -R www-data:www-data /var/www/pterodactyl; php artisan up
```

### 5. Nebula
```bash
cd /var/www/pterodactyl && php artisan down && curl -L https://github.com/HabibiOfficial/pterodactyl-thema/releases/latest/download/nebula.tar.gz | tar -xzv && chmod -R 755 storage/* bootstrap/cache && php artisan view:clear && php artisan config:clear && php artisan optimize && chown -R www-data:www-data /var/www/pterodactyl; php artisan up
```

### 6. Cyberpunk
```bash
cd /var/www/pterodactyl && php artisan down && curl -L https://github.com/HabibiOfficial/pterodactyl-thema/releases/latest/download/cyberpunk.tar.gz | tar -xzv && chmod -R 755 storage/* bootstrap/cache && php artisan view:clear && php artisan config:clear && php artisan optimize && chown -R www-data:www-data /var/www/pterodactyl; php artisan up
```

### 7. Ocean
```bash
cd /var/www/pterodactyl && php artisan down && curl -L https://github.com/HabibiOfficial/pterodactyl-thema/releases/latest/download/ocean.tar.gz | tar -xzv && chmod -R 755 storage/* bootstrap/cache && php artisan view:clear && php artisan config:clear && php artisan optimize && chown -R www-data:www-data /var/www/pterodactyl; php artisan up
```

### 8. Royal Gold
```bash
cd /var/www/pterodactyl && php artisan down && curl -L https://github.com/HabibiOfficial/pterodactyl-thema/releases/latest/download/royal-gold.tar.gz | tar -xzv && chmod -R 755 storage/* bootstrap/cache && php artisan view:clear && php artisan config:clear && php artisan optimize && chown -R www-data:www-data /var/www/pterodactyl; php artisan up
```

## Ganti tema

Tinggal jalankan perintah tema lain — file tema lama ketimpa sama tema baru. Nggak perlu uninstall dulu.

## Balik ke tampilan standar (uninstall tema)

```bash
cd /var/www/pterodactyl && php artisan down && curl -L https://github.com/HabibiOfficial/pterodactyl-thema/releases/latest/download/stock.tar.gz | tar -xzv && rm -rf public/css/themes && chmod -R 755 storage/* bootstrap/cache && php artisan view:clear && php artisan config:clear && php artisan optimize && chown -R www-data:www-data /var/www/pterodactyl; php artisan up
```

## Cara lain: pakai install.sh

Kalau repo ini sudah di-clone ke VPS:

```bash
./install.sh <slug>   # mis. ./install.sh nebula
./install.sh stock    # balik ke standar
```

Script ini backup layout + `.env` dulu ke `/tmp`, lalu ekstrak, bersihkan cache, dan
**selalu** menaikkan panel lagi (`php artisan up`) meski ada langkah yang gagal.

## Isi repo

- `themes/` — 8 tarball tema + `stock.tar.gz` (file standar buat revert). Tiap tarball tema
  cuma berisi: `public/css/themes/<slug>.css`, `resources/views/layouts/admin.blade.php`,
  `resources/views/templates/wrapper.blade.php`. Tarball `stock` cuma berisi 2 file layout standar.
- `src/` — source tiap tema (CSS + layout) buat yang mau edit warna/font sendiri lalu rebuild tarball.
- `install.sh` — script installer lokal (lihat di atas).
