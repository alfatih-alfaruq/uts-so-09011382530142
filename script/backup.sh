#!/bin/bash
# Nama  : Muhammad Fatih Alfaruq
# NIM   : 09011382530142
# Kelas : SKU3B

# 1. Deklarasi Variabel
NIM="09011382530142"
DIR_ASAL="$HOME/data_$NIM"
DIR_TUJUAN="$HOME/backup_$NIM"
FILE_LOG="$DIR_TUJUAN/backup.log"

# 2. Buat direktori tujuan jika belum ada
mkdir -p "$DIR_TUJUAN"

# 3. Buat nama file arsip berformat tanggal_jam
TANGGAL_JAM=$(date +%Y%m%d_%H%M%S)
NAMA_ARSIP="backup_${NIM}_${TANGGAL_JAM}.tar.gz"
PATH_ARSIP="$DIR_TUJUAN/$NAMA_ARSIP"

# 4. Cari semua file .txt dan simpan daftar ke file sementara
FILE_LIST=$(mktemp)
find "$DIR_ASAL" -type f -name "*.txt" > "$FILE_LIST"

# Hitung jumlah file .txt yang ditemukan
JUMLAH_FILE=$(wc -l < "$FILE_LIST")

# 5. Kompresi file-file .txt ke bentuk tar.gz
tar -czvf "$PATH_ARSIP" -T "$FILE_LIST" > /dev/null

# Hapus file sementara
rm -f "$FILE_LIST"

# 6. Verifikasi isi arsip
echo "=== Verifikasi Isi Arsip ==="
tar -tzvf "$PATH_ARSIP"

# 7. Format dan catat log
WAKTU_LOG=$(date "+%Y-%m-%d %H:%M:%S")
UKURAN_ARSIP=$(du -h "$PATH_ARSIP" | cut -f1)

echo "$WAKTU_LOG | $NAMA_ARSIP | $JUMLAH_FILE | $UKURAN_ARSIP" >> "$FILE_LOG"
