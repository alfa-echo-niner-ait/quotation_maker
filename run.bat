@echo off

echo [>>] Activating Virtual Environment
:: Activate virtual environment
call venv\Scripts\activate.bat
echo [>>] Virtual Environment Activated

echo [>>] Starting Flask Application
:: Run app
python app.py