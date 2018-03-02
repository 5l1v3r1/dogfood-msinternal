A0=http://officecdn.microsoft.com/pr
A1=ea4a4090-de26-49d7-93c1-91bff9e53fc3
A2=Office/Data
A3=16.0.9127.2004

mkdir ClickToRun && cd ClickToRun
wget -q $A0/$A1/$A2/$A3/i640.cab
wget -q $A0/$A1/$A2/$A3/i641033.cab
cabextract -q *.cab && rm *.cab && cd ..

B1=ProPlusVolume
B2=en-us
B3=x64
B4=access,excel,groove,lync,onedrive,onenote,outlook,publisher

echo '@echo off' > launch.bat
echo 'cd /d %~dp0' >> launch.bat
echo 'move ClickToRun "%ProgramFiles%\Common Files\microsoft shared" >nul' >> launch.bat
echo '"%ProgramFiles%\Common Files\microsoft shared\ClickToRun\OfficeClickToRun.exe" deliverymechanism='$A1' platform='$B3' culture='$B2' productstoadd='$B1'_'$B2'_x-none baseurl='$A0'/'$A1' '$B1'.excludedapps='$B4' updatesenabled=True cdnbaseurl='$A0'/'$A1' version='$A3' mediatype=CDN' >> launch.bat
echo 'cscript //b "%ProgramFiles%\Microsoft Office\Office16\OSPP.VBS" /inpkey:' >> launch.bat
echo 'cscript //b "%ProgramFiles%\Microsoft Office\Office16\OSPP.VBS" /actcid:' >> launch.bat
