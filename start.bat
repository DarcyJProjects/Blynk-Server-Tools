@echo Off
rem Firewall Tool for Blynk Local Server
rem Created by Darcy Johnson
rem https://darcyjprojects.xyz


rem Configuration MUST be the SAME in "firewall.bat" and "start.bat":
rem SET RULEPORT TO YOUR "#secured https, web sockets and app port" AS SET IN YOUR BLYNK "server.properties" FILE
set rulename="Blynk"
set ruleport=9443
rem The file name of your blynk server java file. Must include the .jar extension at the end
set blynkjar=blynk-server-0.41.15-java8.jar


echo Please make sure you have enabled the Blynk firewall rules
echo before you start the server by running the firewall batch file.
echo.
rem Get IP
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
echo Access Admin Panel (LocalNetwork): https://%NetworkIP%:%ruleport%/admin
rem Get Public IP
for /f %%a in ('powershell Invoke-RestMethod api.ipify.org') do set PublicIP=%%a
echo Access Admin Panel (PortForwarded): https://%PublicIP%:%ruleport%/admin 
echo.
echo Note: Use CTRL+C to save and shutdown server
echo Starting Blynk Server... (this can take some time depending on your system)
echo.
rem Start Java Server File
java -jar %blynkjar% -dataFolder /Path
PAUSE
