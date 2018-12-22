const https = require('https');

https.get('https://mrodevicemgr.edog.officeapps.live.com/mrodevicemgrsvc/api/v2/C2RReleaseData' + '?' + Math.floor(Date.now() / 1000), (res) => {
    res.on('data', (d) => {
        let obj = JSON.parse(d);

        let url = 'http://officecdn.microsoft.com/pr';
        let cdn = obj[22].FFN;
        let ver = obj[22].AvailableBuild;

        console.log('mkdir ClickToRun');
        console.log('wget ' + url + '/' + cdn + '/Office/Data/' + ver + '/i640.cab -P ClickToRun > /dev/null 2>&1');
        console.log('wget ' + url + '/' + cdn + '/Office/Data/' + ver + '/i641033.cab -P ClickToRun > /dev/null 2>&1');
        console.log('cabextract ClickToRun/*.cab -d ClickToRun > /dev/null 2>&1');
        console.log('rm ClickToRun/*.cab');
        console.log();
        console.log('echo \'@echo off\' > launch.bat');
        console.log('echo \'xcopy "%~dp0"ClickToRun "%CommonProgramFiles%\\microsoft shared\\ClickToRun\\" > nul 2>&1\' >> launch.bat');
        console.log('echo \'start "" "%CommonProgramFiles%\\microsoft shared\\ClickToRun\\OfficeClickToRun.exe" deliverymechanism=' + cdn + ' platform=x64 culture=en-us productstoadd=O365ProPlusRetail.16_en-us_x-none O365ProPlusRetail.excludedapps.16=groove,onenote updatesenabled.16=True cdnbaseurl.16=' + url + '/' + cdn + ' version.16=' + ver + ' mediatype.16=CDN baseurl.16=' + url + '/' + cdn + '\' >> launch.bat');
    });
});
