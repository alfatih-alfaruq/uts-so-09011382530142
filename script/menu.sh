#!/bin/bash
# Nama  : Muhammad Fatih Alfaruq
# NIM   : 09011382530142
# Kelas : SKU3B

NIM="09011382530142"
DIR_BACKUP="$HOME/backup_$NIM"
DIR_RESTORE="$HOME/restore_$NIM"
FILE_LOG="$DIR_BACKUP/backup.log"
SCRIPT_BACKUP="$(dirname "$0")/backup.sh"

while true; do
    echo "=========================================="
    echo "   MENU UTAMA BACKUP & RESTORE SYSTEM     "
    echo "=========================================="
    echo "1. Jalankan Backup Sekarang"
    echo "2. Lihat Log Backup"
    echo "3. Lihat Daftar Arsip Backup"
    echo "4. Restore Arsip Backup"
    echo "5. Keluar"
    echo "=========================================="
    read -p "Pilihan Anda [1-5]: " pil

    case $pil in
        1)
            echo -e "\n[+] Menjalankan proses backup..."
            bash "$SCRIPT_BACKUP"
            echo -e "\nBackup selesai!\n"
            ;;
        2)
            echo -e "\n[+] Isi File Log Backup:"
            if [ -f "$FILE_LOG" ]; then
                cat "$FILE_LOG"
            else
                echo "Belum ada file log."
            fi
            echo ""
            ;;
        3)
            echo -e "\n[+] Daftar File Arsip di $DIR_BACKUP:"
            ls -lh "$DIR_BACKUP"/*.tar.gz 2>/dev/null || echo "Belum ada arsip."
            echo ""
            ;;
        4)
            echo -e "\n[+] Daftar Arsip yang Tersedia:"
            ls -1 "$DIR_BACKUP"/*.tar.gz 2>/dev/null
            if [ $? -ne 0 ]; then
                echo "Tidak ada arsip untuk di-restore."
                continue
            fi
            echo ""
            read -p "Masukkan nama file arsip (misal: backup_${NIM}_xxx.tar.gz): " NAMA_FILE
            PATH_FILE="$DIR_BACKUP/$NAMA_FILE"
            
            if [ -f "$PATH_FILE" ]; then
                mkdir -p "$DIR_RESTORE"
                tar -xzvf "$PATH_FILE" -C "$DIR_RESTORE"
                echo -e "\n[+] Berhasil di-restore ke direktori: $DIR_RESTORE\n"
            else
                echo -e "\n[-] File arsip tidak ditemukan!\n"
            fi
            ;;
        5)
            echo "Keluar dari program."
            exit 0
            ;;
        *)
            echo -e "\nPilihan tidak valid, silakan coba lagi.\n"
            ;;
    esac
done
