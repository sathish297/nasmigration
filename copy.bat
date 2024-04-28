
@echo_off
for /F "delims=/ tokens=1,2,3" %a in ('date /t') do set date=%c-%b-%a
for /F "delims=: tokens=1,2" %a in ('time /t') do set time=%a:%b

forfiles /P .\logs /M *.txt /D -7 /C "cmd /c del @file" >nul 2>nul

robocopy c:\scripts\data\source c:\scripts\data\target /XO * /XD @c:\scripts\data\exclusion_list.txt /MIR /R:1 /W:1 /LOG:"c:\scripts\logs\copy_%date%%time%.txt"

