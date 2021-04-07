# Blynk Server Tools
A bundle of files for managing your local Blynk server running on windows. Created in Batch.<br>
We are not affiliated, associated, authorized, endorsed by, or in any way officially connected with Blynk, or any of its subsidiaries or its affiliates. The official Blynk website can be found at https://blynk.io.

## Installation
1. Copy/Move "firewall.bat" and "start.bat" to the directory of your Blynk server files (directory that has the Blynk server jar file).
2. If you don't have a "server.properties" file already, [click here](https://raw.githubusercontent.com/blynkkk/blynk-server/master/server/core/src/main/resources/server.properties) and save it to the directory of your Blynk server files.
3. Right Click "firewall.bat", select Edit.
4. Once open, go to the configuration section in "firewall.bat". Set the "ruleport" to the same port as found in the "https, web sockets and app port" section in your "server.properties" file. I recommend to leave the "rulename" the same for easy identification. Save changes to "firewall.bat".
5. Right Click "start.bat", select Edit.
6. Once open, go to the configuration section in "start.bat". Set the "ruleport" to the same port as you just set in your "firewall.bat" file. Set the "blynkjar" to the name of your Blynk server jar file including the ".jar" file extension. Download latest Blynk server jar file by [clicking here](https://github.com/blynkkk/blynk-server/releases/tag/v0.41.15) (you'll need [JDK](https://www.oracle.com/au/java/technologies/javase-downloads.html) installed). Save changes to "firewall.bat".
7. All done

## Usage
To start your Blynk local server, you must first make sure you have created & enabled the Blynk Firewall rules.<br>
To do this, follow step 1 and 2. If you have already done that, there is usually no need to repeat step 1 - instead skip straight to step 2.<br>
If you are taking your server offline and want to disable the firewall rules, you can skip to step 3.<br>
Make sure there is no server instance already running before trying to start your server.<br>

1. Enabling Blynk Firewall Rule (will create the rule if not found)<br>
    i. Run "firewall.bat" with administrative privileges.<br>
    ii. Type "1" and press "ENTER" to select the "Enable Firewall Rules for Blynk (will create rule if not found)" option.<br>
    iii. Wait for it to finish and close the window.
2. Running the server<br>
    i. Make sure you have configured the server to your liking in your "server.properties" file.<br>
    ii. Run "start.bat"<br>
    iii. Wait until it starts the server. It will output errors if any have occured when trying to start the server.<br>
    iv. If you want to stop the server, press "CTRL" + "C". Wait until it says "Terminate batch job (Y/N)?". Then type "y" and press "ENTER".<br>
3. Disabling Blynk Firewall Rule (will still create the rule if not found)
    i. Run "firewall.bat" with administrative privileges.<br>
    ii. Type "2" and press "ENTER" to select the "Disable Firewall Rules for Blynk (will create rule if not found)" option.<br>
    iii. Wait for it to finish and close the window.
