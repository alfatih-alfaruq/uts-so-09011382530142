
# uts-so
# Tugas Besar UTS Sistem Operasi

## Identitas
- **Nama**: Muhammad Fatih Alfaruq
- **NIM**: 09011382530142
- **Kelas**: SKU3B

## Deskripsi
Repository ini berisi otomatisasi backup file catatan praktikum (.txt) menggunakan shell script Linux. Script mencari semua file `.txt` di direktori sumber, mengarsipkannya dengan `tar` dan `gzip` berformat tanggal dan jam, serta mencatat riwayat eksekusi ke file log.

## Cara Menjalankan
1. Memberi izin eksekusi seluruh script:
   ```bash
   chmod +x script/*.sh
## Bukti Job Control
al@Ubuntu:~/uts-so-09011382530142$ ./script/backup_loop.sh &
[1] 8095
al@Ubuntu:~/uts-so-09011382530142$ Loop backup berjalan setiap 60 detik... (Tekan Ctrl+C atau gunakan kill untuk menghentikan)
jobs -l
[1]+ 8095 Running                 ./script/backup_loop.sh &
al@Ubuntu:~/uts-so-09011382530142$ fg
./script/backup_loop.sh
^Z
[1]+ Stopped                 ./script/backup_loop.sh
al@Ubuntu:~/uts-so-09011382530142$ bg
[1]+ ./script/backup_loop.sh &
al@Ubuntu:~/uts-so-09011382530142$ ps x | grep backup
  8095 pts/0    S      0:00 /bin/bash ./script/backup_loop.sh
  8168 pts/0    S+     0:00 grep backup
al@Ubuntu:~/uts-so-09011382530142$ kill %1
[1]+ Terminated              ./script/backup_loop.sh

## Fitur Pengembangan
Menu Interaktif (script/menu.sh): Memudahkan pengguna memilih opsi backup, lihat log, lihat daftar arsip, restore, atau keluar menggunakan read dan case.

Restore: Fitur untuk mengekstrak file arsip pilihan pengguna ke direktori ~/restore_09011382530142 dengan opsi tar -xzvf ... -C.

## kendala
Koneksi GitHub terputus (Recv failure): Diatasi dengan memeriksa status jaringan di VM dan mengaktifkan credential helper.

Git Author Identity Unknown: Diatasi dengan mengatur git config --global user.email dan user.name.
