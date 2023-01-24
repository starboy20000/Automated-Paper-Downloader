@echo off 
curl https://api.papermc.io/v2/projects
set /p input= 	What Progect Do You Want: 
curl https://api.papermc.io/v2/projects/%input%
set /p vinput= 	What Versions Do You Want:  
curl https://api.papermc.io/v2/projects/%input%/versions/%vinput%
set /p binput= 	What Build Do You Want: 
md %input%-%vinput%-%binput%-MC-Server
cd %input%-%vinput%-%binput%-MC-Server
curl https://api.papermc.io/v2/projects/%input%/versions/%vinput%/builds/%binput%/downloads/%input%-%vinput%-%binput%.jar --output server.jar
set /P ram="How much ram do you want your server to have? (in gigs) (Recommended 4 Gigs): 
echo java -Xms%ram%G -Xmx%ram%G --add-modules=jdk.incubator.vector -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -jar server.jar>run.bat
echo PAUSE>> run.bat
echo eula=true>eula.txt
if %input%==paper break>run.bat
if %input%==paper echo java -Xms%ram%G -Xmx%ram%G --add-modules=jdk.incubator.vector -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -jar server.jar -nogui>run.bat
if %input% NEQ paper break>run.bat
if %input% NEQ paper echo java -Xms512M -Xmx512M -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15 -jar server.jar>run.bat
start cmd /k run.bat
pause
