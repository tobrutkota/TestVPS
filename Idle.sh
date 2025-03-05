import time
import requests
import subprocess

SLEEP_TIME = 180  # 3 menit

def press_shift():
    """Pura-pura pencet tombol Shift (kalau xdotool tersedia)."""
    try:
        subprocess.run(["xdotool", "key", "Shift_L"], check=True)
    except FileNotFoundError:
        pass  # Lewati kalau xdotool tidak tersedia

def check_server():
    """Cek apakah server localhost:8888 bisa diakses."""
    try:
        response = requests.get("http://localhost:8888", timeout=5)
        if response.status_code != 200:
            print("❌ Server localhost tidak merespons dengan baik!", flush=True)
    except requests.exceptions.RequestException:
        print("❌ Gagal mengakses server localhost!", flush=True)

def main():
    while True:
        press_shift()   # Pencet shift
        check_server()  # Cek server
        time.sleep(SLEEP_TIME)  # Tunggu 3 menit

if __name__ == "__main__":
    main()
