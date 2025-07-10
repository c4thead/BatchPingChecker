@echo off
echo Starting the Internet Connection Checker...
echo.

:: Starting N
set n=1
:: Max Amount of Checks
set ch=5


set /a ch=%ch%+1
:: Change to InfChecks if you want the script to be working 24/7 or NChecks to check for N times (the var is above)
goto InfCheck





:NChecks
echo ========
echo Check #%n%
echo ========
ping 8.8.8.8
echo.
echo.
echo.
set /a n=%n%+1
if %n%==%ch% (echo Done Checking.) else (goto NChecks)
echo If your internet hasn't been restarted yet, wait another 5s - 2m
echo Maybe, try checking again.
echo.
echo If the pings received packets, you are connected!
pause>NUL
cls
exit

:InfCheck
echo ========
echo Check #%n%
echo ========
ping 8.8.8.8
echo.
echo.
echo.
set /a n=%n%+1
goto InfCheck