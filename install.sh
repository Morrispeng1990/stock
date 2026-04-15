#!/usr/bin/env bash
set -e

echo "更新 pip..."
python3 -m pip install --upgrade pip

echo "安裝套件（系統/全域）..."
pip install -r requirements.txt

echo "驗證套件能否匯入..."
python3 - <<'PY'
import importlib
pkgs = ["yfinance","pandas","pandas_ta","requests","bs4","openpyxl"]
failed = False
for p in pkgs:
    try:
        importlib.import_module(p)
    except Exception as e:
        print(f"IMPORT FAIL: {p} -> {e}")
        failed = True
if failed:
    raise SystemExit(1)
print('OK')
PY

echo "完成：若顯示 OK 則安裝成功。若失敗請檢查錯誤訊息並回報。"