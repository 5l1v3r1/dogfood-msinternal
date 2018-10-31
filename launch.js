const https = require('https');

https.get('https://mrodevicemgr.edog.officeapps.live.com/mrodevicemgrsvc/api/v2/C2RReleaseData' + '?' + Math.floor(Date.now() / 1000), (res) => {
    res.on('data', (d) => {
        let obj = JSON.parse(d);
        console.log('mkdir ClickToRun');
        console.log('wget -q http://officecdn.microsoft.com/pr/' + obj[22].FFN + '/Office/Data/' + obj[22].AvailableBuild + '/i640.cab -P ClickToRun');
        console.log('wget -q http://officecdn.microsoft.com/pr/' + obj[22].FFN + '/Office/Data/' + obj[22].AvailableBuild + '/i641033.cab -P ClickToRun');
        console.log('cabextract -q ClickToRun/*.cab -d ClickToRun');
        console.log('rm ClickToRun/*.cab');
        console.log();
        console.log('echo \'@echo off\' > launch.bat');
        console.log('echo \'xcopy %~dp0ClickToRun "%CommonProgramFiles%\\microsoft shared\\ClickToRun\\" >nul 2>&1\' >> launch.bat');
        console.log('echo \'"%CommonProgramFiles%\\microsoft shared\\ClickToRun\\OfficeClickToRun.exe" deliverymechanism=' + obj[22].FFN + ' platform=x64 culture=en-us productstoadd=O365ProPlusRetail.16_en-us_x-none O365ProPlusRetail.excludedapps.16=groove,onenote updatesenabled.16=True cdnbaseurl.16=http://officecdn.microsoft.com/pr/' + obj[22].FFN + ' version.16=' + obj[22].AvailableBuild + ' mediatype.16=CDN baseurl.16=http://officecdn.microsoft.com/pr/' + obj[22].FFN + '\' >> launch.bat');
    });
});
