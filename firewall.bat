@echo Off
rem Firewall Tool for Blynk Local Server
rem Created by Darcy Johnson
rem https://darcyjprojects.xyz


rem Configuration:
rem SET RULENAME TO THE NAME OF THE FIREWALL RULE TO BE CREATED
rem SET RULEPORT TO YOUR "#secured https, web sockets and app port" AS SET IN YOUR BLYNK "server.properties" FILE
set rulename="Blynk"
set ruleport=9443


rem Check for admin privileges
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo Administrator Privileges Detected!
    goto menu
) ELSE (
    cls
    echo Error! You must run this file with administrative privileges. Press any key to close.
    PAUSE
    exit 0
)


rem Menu
:menu
echo.
echo ---------------------------------------------------
echo PRESS 1, OR 2 to select your task, or 3 to EXIT.
echo ---------------------------------------------------
echo.
echo 1 - Enable Firewall Rules for Blynk (will create rule if not found)
echo 2 - Disable Firewall Rules for Blynk (will create rule if not found)
echo 3 - EXIT
echo.
SET /P M=Type 1, 2, or 3 then press ENTER:
IF %M%==1 goto enable
IF %M%==2 goto disable
IF %M%==3 goto end


rem Enable (and create if needed) Firewall Rules
:enable
echo Checking for %rulename% firewall rule...

netsh advfirewall firewall show rule name=%rulename% >nul
if errorlevel 1 (
    echo Cannot find Firewall Rule %rulename%
    echo.
    echo Creating Inbound and Outbound TCP Firewall Rule %rulename% for port "%ruleport%"
    
    Netsh.exe advfirewall firewall add rule name="%rulename%" protocol=tcp dir=in localport="%ruleport%" enable=yes action=allow profile=private,domain,public
    Netsh.exe advfirewall firewall add rule name="%rulename%" protocol=tcp dir=out localport="%ruleport%" enable=yes action=allow profile=private,domain,public
    echo Created Firewall Rule %rulename% for port "%ruleport%"
    echo Enabled Firewall Rule %rulename%
    echo.
    echo.
    echo.
) else (
    echo Found Firewall Rule %rulename%
    echo Enabling Firewall Rule %rulename%...
    netsh advfirewall firewall set rule name="%rulename%" new enable=yes
    echo Enabled Firewall Rule %rulename%
    echo.
    echo.
    echo.
)
echo Success. Press any key to close.
PAUSE
exit 0


rem Disable (and create if needed) Firewall Rules
:disable
echo Checking for %rulename% firewall rule...

netsh advfirewall firewall show rule name=%rulename% >nul
if errorlevel 1 (
    echo Cannot find Firewall Rule %rulename%
    echo.
    echo Creating Inbound and Outbound TCP Firewall Rule %rulename% for port "%ruleport%"
    
    Netsh.exe advfirewall firewall add rule name="%rulename%" protocol=tcp dir=in localport="%ruleport%" enable=no action=allow profile=private,domain,public
    Netsh.exe advfirewall firewall add rule name="%rulename%" protocol=tcp dir=out localport="%ruleport%" enable=no action=allow profile=private,domain,public
    echo Created Firewall Rule %rulename%  for port "%ruleport%"
    echo Disabled Firewall Rule %rulename%
    echo.
    echo.
    echo.
) else (
    echo Found Firewall Rule %rulename%
    echo Disabling Firewall Rule %rulename%...
    netsh advfirewall firewall set rule name="%rulename%" new enable=no
    echo Disabled Firewall Rule %rulename%
    echo.
    echo.
    echo.
)
echo Success. Press any key to close.
PAUSE
exit 0


rem Exit
:end
exit 0