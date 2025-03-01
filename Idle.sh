#!/bin/bash
while true; do
    xdotool key Shift_L  # Pura-pura pencet tombol shift
    curl -s http://localhost:8888 > /dev/null  # Pura-pura akses server
    sleep 180  # Tiap 3 menit jalan
done
