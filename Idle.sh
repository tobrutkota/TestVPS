#!/bin/bash

while true; do
    # Pura-pura pencet tombol shift (kalau xdotool tersedia)
    if command -v xdotool &> /dev/null; then
        xdotool key Shift_L
    fi

    # Pura-pura akses server, cek apakah curl sukses
    if ! curl -s --max-time 5 http://localhost:8888 > /dev/null; then
        echo "❌ Gagal mengakses server localhost!" >&2
    fi

    # Tunggu 3 menit sebelum ulangi
    sleep 180
done
