@echo off
setlocal EnableExtensions DisableDelayedExpansion
pushd "%~dp0" || exit /b 1
set "ENV_PY=.venv\Scripts\python.exe"
set "BOOK=deal_ya_doglapan_full_pipeline.ipynb"
set "PATH=%CD%\.venv\Scripts;%PATH%"
set "PYTHONPATH="
set "PYTHONHOME="
set "PYTHONNOUSERSITE=1"
if /i "%~1"=="--open" goto open
if /i "%~1"=="--check" goto verify
echo Preparing Deal ya Doglapan. Run setup before class with internet access.
if exist "%ENV_PY%" goto packages
echo [1/3] Finding 64-bit Python 3.11, 3.12 or 3.13...
for %%V in (3.13 3.12 3.11) do (
    py -%%V -c "import struct; assert struct.calcsize('P') == 8" >nul 2>&1
    if not errorlevel 1 (
        py -%%V -m venv ".venv"
        if errorlevel 1 goto failed
        goto packages
    )
)
python -c "import sys, struct; assert (3,11) <= sys.version_info[:2] <= (3,13) and struct.calcsize('P') == 8" >nul 2>&1
if not errorlevel 1 (
    python -m venv ".venv"
    if errorlevel 1 goto failed
    goto packages
)
where winget >nul 2>&1
if errorlevel 1 goto needpython
echo Installing Python 3.13 for this Windows user...
winget install --exact --id Python.Python.3.13 --source winget --scope user --architecture x64 --accept-package-agreements --accept-source-agreements
if errorlevel 1 goto needpython
set "NEWPY=%LocalAppData%\Programs\Python\Python313\python.exe"
if not exist "%NEWPY%" goto needpython
"%NEWPY%" -m venv ".venv"
if errorlevel 1 goto failed

:packages
echo [2/3] Installing the notebook libraries and the local Jupyter interface...
"%ENV_PY%" -m pip install --disable-pip-version-check "numpy>=1.26,<3" "pandas>=2.2,<4" "matplotlib>=3.8,<4" "scikit-learn>=1.4,<2" "jupyterlab>=4,<5" "ipykernel>=6,<8"
if errorlevel 1 goto failed
where code.cmd >nul 2>&1
if errorlevel 1 goto verify
echo Preparing VS Code notebook support...
call code.cmd --install-extension ms-python.python
if errorlevel 1 goto extensionwarn
call code.cmd --install-extension ms-toolsai.jupyter
if not errorlevel 1 goto verify
:extensionwarn
echo VS Code extension setup was incomplete. The --open browser option works independently.

:verify
if not exist "%ENV_PY%" goto needsetup
echo [3/3] Checking packages and starting a real notebook kernel...
"%ENV_PY%" -m pip check
if errorlevel 1 goto failed
"%ENV_PY%" -c "from jupyter_client.manager import run_kernel; from pathlib import Path; import sys; code='import sys, numpy, pandas, matplotlib.pyplot, sklearn, IPython, ipykernel, jupyterlab; from sklearn.preprocessing import OneHotEncoder; OneHotEncoder(sparse_output=False); assert sys.prefix == '+repr(sys.prefix); ctx=run_kernel(kernel_name='python3', startup_timeout=60); kc=ctx.__enter__(); reply=kc.execute_interactive(code, timeout=60); ctx.__exit__(None,None,None); sys.exit(0 if reply['content']['status']=='ok' else 1)"
if errorlevel 1 goto failed
if not exist "%BOOK%" goto needbook
echo WORKSHOP READY - notebook found and kernel verified.
echo During class, run: setup_workshop.bat --open
if "%~1"=="" pause
popd
exit /b 0

:open
if not exist "%ENV_PY%" goto needsetup
if not exist "%BOOK%" goto needbook
"%ENV_PY%" -m jupyterlab "%BOOK%"
if errorlevel 1 goto failed
popd
exit /b 0

:needbook
echo Place "%BOOK%" in the same folder as this BAT file, then run --check.
goto failed
:needpython
echo Install 64-bit Python 3.13 from python.org, reopen the terminal, and rerun this file.
goto failed
:needsetup
echo Run setup_workshop.bat once with internet access before using this option.
:failed
echo Workshop setup or launch did not finish. Check the message above.
if "%~1"=="" pause
popd
exit /b 1
