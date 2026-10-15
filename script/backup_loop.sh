#!/bin/bash
# Nama  : Muhammad Fatih Alfaruq
# NIM   : 09011382530142
# Kelas : SKU3B

# Jeda waktu perulangan (default 60 detik)
INTERVAL=60

# Lokasi script backup
SCRIPT_BACKUP="$(dirname "$0")/backup.sh"

echo "Loop backup berjalan setiap $INTERVAL detik... (Tekan Ctrl+C atau gunakan kill untuk menghentikan)"

while true
do
    if [ -f "$SCRIPT_BACKUP" ]; then
        bash "$SCRIPT_BACKUP" > /dev/null 2>&1
    fi
    sleep $INTERVAL
done
