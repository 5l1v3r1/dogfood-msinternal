# Start of Microsoft Office Configuration
URL=officecdn.microsoft.com.edgesuite.net/pr
ID=ea4a4090-de26-49d7-93c1-91bff9e53fc3 # Channel : Dogfood_DevMain
DIR=Office/Data
VER=$(curl tools.thecollectionbook.info/latest/?guid=$ID)
# End of Microsoft Office Configuration

# Start of Initialising configuration files

#
# launch.bat
#

echo '@echo off' > launch.bat
echo 'reg add HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration /v CDNBaseUrl /d http://officecdn.microsoft.com/pr/'$ID' >nul' >> launch.bat
echo 'cd /d %~dp0' >> launch.bat
echo 'setup.exe /configure configure.xml' >> launch.bat

#
# configure.xml
#

echo '<Configuration>' > configure.xml
echo '  <Add OfficeClientEdition="64">' >> configure.xml
echo '    <Product ID="ProPlus2019Retail">' >> configure.xml
echo '      <Language ID="en-us" />' >> configure.xml
echo '      <ExcludeApp ID="Access" />' >> configure.xml
echo '      <ExcludeApp ID="Excel" />' >> configure.xml
echo '      <ExcludeApp ID="Groove" />' >> configure.xml
echo '      <ExcludeApp ID="Lync" />' >> configure.xml
echo '      <ExcludeApp ID="OneDrive" />' >> configure.xml
echo '      <ExcludeApp ID="OneNote" />' >> configure.xml
echo '      <ExcludeApp ID="Outlook" />' >> configure.xml
echo '      <ExcludeApp ID="Publisher" />' >> configure.xml
echo '    </Product>' >> configure.xml
echo '  </Add>' >> configure.xml
echo '</Configuration>' >> configure.xml

# End of Initialising configuration files

# Downloads the file at the root directory
wget $URL/wsus/setup.exe

# Creates the '$DIR' directory, enters the '$DIR' directory & downloads all of the required files
mkdir -p $DIR && cd $DIR
wget $URL/$ID/$DIR/v64.cab
wget $URL/$ID/$DIR/v64_$VER.cab

# Creates the '$DIR/$VER' directory, enters the '$DIR/$VER' directory & downloads all of the required files
mkdir $VER && cd $VER
wget $URL/$ID/$DIR/$VER/stream.x64.x-none.dat
wget $URL/$ID/$DIR/$VER/stream.x64.en-us.dat
wget $URL/$ID/$DIR/$VER/i640.cab
wget $URL/$ID/$DIR/$VER/s640.cab
wget $URL/$ID/$DIR/$VER/i641033.cab
wget $URL/$ID/$DIR/$VER/s641033.cab
