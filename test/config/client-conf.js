var basePath, preprocessors, files, reporters, port, runnerPort, colors, logLevel, autoWatch, browsers, captureTimeout, singleRun;
basePath = "../../";
preprocessors = {
  '**/*.ls': 'live'
};
files = [JASMINE, JASMINE_ADAPTER, "test/lib/angular/angular.js", "test/lib/angular/angular-*.js", "test/lib/angular/angular-mocks.js", "test/unit/*.ls"];
reporters = ["progress"];
port = 9876;
runnerPort = 9100;
colors = true;
logLevel = LOG_INFO;
autoWatch = true;
browsers = ['Chrome'];
captureTimeout = 60000;
singleRun = false;