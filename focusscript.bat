REM Create a hosts file that blocks sites that are distracting. (Facebook, reddit, whatevs)
REM
REM And use this to copy corporate hosts file to a safe place, and move "focus" file in it's spot. 
REM
REM Then get to work. 


copy %windir%\System32\drivers\etc\hosts "C:\Users\USERNAME\Documents\Tools\bin\hosts.before"

%windir%\System32\runas.exe /User:DOMAIN\USERNAME "xcopy C:\Users\USERNAME\Documents\Tools\bin\hosts.focus %windir%\System32\drivers\etc\hosts" 


