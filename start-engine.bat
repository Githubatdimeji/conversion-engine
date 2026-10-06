@echo off
setlocal
title Python Conversion Engine
echo ========================================================
echo Starting Python Document & File Conversion Engine...
echo ========================================================

python -m uvicorn main:app --host 127.0.0.1 --port 8000 --reload
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Failed to start Python conversion engine.
    echo Please verify that dependencies are installed: pip install -r requirements.txt
    pause
)

endlocal
