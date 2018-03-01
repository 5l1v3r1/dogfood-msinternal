# Start of Microsoft Office Configuration
URL=officecdn.microsoft.com.edgesuite.net/pr
ID=ea4a4090-de26-49d7-93c1-91bff9e53fc3
DIR=Office/Data
# End of Microsoft Office Configuration

wget -q $URL/$ID/$DIR/MRO.cab && cabextract -qF MRO.xml MRO.cab && rm MRO.cab
VER=$(grep 'Available' MRO.xml | awk -F">" '{print $2}' | awk -F"<" '{print $1}' && rm MRO.xml)

# Creates the 'ClickToRun' directory, enters the 'ClickToRun' directory & downloads all of the required files
mkdir ClickToRun && cd ClickToRun
wget -q $URL/$ID/$DIR/$VER/i640.cab
wget -q $URL/$ID/$DIR/$VER/i641033.cab

# Extracts all the files from 'i640' & 'i6401033' cabinet (.cab) files
cabextract -q *.cab && rm *.cab && cd ..

#
# launch.bat
#

echo '@echo off' > launch.bat
echo 'OfficeClickToRun.exe deliverymechanism=ea4a4090-de26-49d7-93c1-91bff9e53fc3 platform=x64 culture=en-us productstoadd=ProPlusVolume_en-us_x-none baseurl=http://officecdn.microsoft.com/pr/ea4a4090-de26-49d7-93c1-91bff9e53fc3 ProPlusVolume.excludedapps=access,excel,groove,lync,onedrive,onenote,outlook,publisher updatesenabled=True cdnbaseurl=http://officecdn.microsoft.com/pr/ea4a4090-de26-49d7-93c1-91bff9e53fc3 version=16.0.9127.2004 mediatype=CDN' >> launch.bat

# Packages all the downloaded contents into '$VER.zip'
zip -9lr $VER.zip *
