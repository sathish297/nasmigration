
@echo_off
for /f "delims=/tokens=1,2" %%a in ('date /t') do set date=%%a_%%b
for /f "delims=/tokens=1,2,3" %%a in ('time /t') do set time=%%H_%%M

forfiles /P .\logs /M *.txt /D -7 /C "cmd /c del @file" >nul 2>nul

robocopy c:\scripts\data\source c:\scripts\data\target /XO * /MIR /R:1 /W:1 /LOG:"c:\scripts\logs\copy_%date%.txt"

