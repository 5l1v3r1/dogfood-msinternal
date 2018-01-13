# Start of Microsoft Configuration
URL=officecdn.microsoft.com.edgesuite.net/pr
ID=F3260CF1-A92C-4C75-B02E-D64C0A86A968
VERSION=16.0.9001.2066
# End of Microsoft Configuration

# Creates the 'Office' directory, enters 'Office' directory & downloads all of the required files
mkdir Office && cd Office
wget $URL/wsus/setup.exe

# Creates the 'Office/Data' directory, enters the 'Office/Data' directory & downloads all of the required files
mkdir Data && cd Data
wget $URL/$ID/Data/v64.cab
wget $URL/$ID/Data/v64_$VERSION.cab
wget $URL/wsus/setup.exe

# Creates the 'Office/Data/$VERSION' directory, enters the 'Office/Data/$VERSION' directory & downloads all of the required files
mkdir $VERSION && cd $VERSION
wget $URL/$ID/Data/$VERSION/1320.cab
wget $URL/$ID/Data/$VERSION/1640.cab
wget $URL/$ID/Data/$VERSION/i321033.cab
wget $URL/$ID/Data/$VERSION/i641033.cab
wget $URL/$ID/Data/$VERSION/s320.cab
wget $URL/$ID/Data/$VERSION/s640.cab
wget $URL/$ID/Data/$VERSION/s321033.cab
wget $URL/$ID/Data/$VERSION/s641033.cab
wget $URL/$ID/Data/$VERSION/stream.x64.en-US.dat
wget $URL/$ID/Data/$VERSION/stream.x64.en-US.dat.cobra
wget $URL/$ID/Data/$VERSION/stream.x64.x-none.dat
wget $URL/$ID/Data/$VERSION/stream.x64.x-none.dat.cobra
wget $URL/$ID/Data/$VERSION/s641033.cab
