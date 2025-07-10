@echo off
:: Internet Check 2.0
:: 
:: 2023.09.02 02:50



:: ==========================================
:: Arguments:
:: ==========================================


set pinging=8.8.8.8
::set pinging=youtube.com

:: 1 for fast with no latency information, 2 and more for detailed but combined information
set pingingPerLoop=1


:: 1 for making a log file of the connection state
set Logging=0


:: Log File Name with the extension
set LogFileName=ConnectionLog.txt
:: set LogPATH=C:\









:: ==========================================
:: Code:
:: ==========================================

:: Starting N
set n=0




:: Ping Delivered
set Deli=0
:: Ping Not Delivered
set nDeli=0




:: Deliver Percent (Doesn't work, needs to be a float)
set per=0
set DeliPer=0




:: Didn't work as expected. Expected to combine a path and a name of the file, that is the full path
:: set fullLogPATH=%LogPATH%%LogFileName%
set fullLogPATH=%LogFileName%




:: Current Deliver Satus, 0 = Not Delivered, 1 = Delivered
set curStat=0

:: Trend :: _ = Not Delivered, # = Delivered
set s1=_
set s2=_
set s3=_
set s4=_
set s5=_
set s6=_
set s7=_
set s8=_
set s9=_
set s10=_
set s11=_
set s12=_
set s13=_
set s14=_
set s15=_
set s16=_
set s17=_
set s18=_
set s19=_
set s20=_
set s21=_
set s22=_
set s23=_
set s24=_
set s25=_

:loop
	
	if %curStat%==1 (
		set s1=#
	) else (
		set s1=_
	)
	
	set s25=%s24%
	set s24=%s23%
	set s23=%s22%
	set s22=%s21%
	set s21=%s20%
	set s20=%s19%
	set s19=%s18%
	set s18=%s17%
	set s17=%s16%
	set s16=%s15%
	set s15=%s14%
	set s14=%s13%
	set s13=%s12%
	set s12=%s11%
	set s11=%s10%
	set s10=%s9%
	set s9=%s8%
	set s8=%s7%
	set s7=%s6%
	set s6=%s5%
	set s5=%s4%
	set s4=%s3%
	set s3=%s2%
	set s2=%s1%





:startPing
echo Check #%n%  : %s1%%s2%%s3%%s4%%s5%%s6%%s7%%s8%%s9%%s10%%s11%%s12%%s13%%s14%%s15%%s16%%s17%%s18%%s19%%s20%%s21%%s22%%s23%%s24%%s25%
echo.
echo # Succeed : %Deli%
echo _ Failed  : %nDeli%
echo Percent   : %per%%%
echo.
ping %pinging% -n %pingingPerLoop% -w 500
IF %errorlevel%==1 (
	echo.
	if %Logging%==1 (echo %date% %time% - Not Connected >> %fullLogPATH%)
	echo %date% %time% - Not Connected
	echo ___ Failed! ___
	set /a nDeli=%nDeli%+1
	set curStat=0
	
) ELSE (
	echo.
	if %Logging%==1 (echo %date% %time% - Not Connected >> %fullLogPATH%)
	echo %date% %time% - Connected
	echo ### Succsess! ###
	set /a Deli=%Deli%+1
	set curStat=1
)
ping -n 1 -w 500 1.0.0.0>NUL
set /a n=%n%+1
set /a DeliPer=100*%Deli%
set /a per=%DeliPer%/%n%
echo.
echo.
cls
goto loop


pause
cls
exit


