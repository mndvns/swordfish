// Karma configuration

basePath = '../';


preprocessors = {
  '**/*.ls': 'live'
};

// list of files / patterns to load in the browser
files = [
  JASMINE,
  JASMINE_ADAPTER,
  'test/unit/*.ls'
];


exclude = [
];


// possible values: 'dots', 'progress', 'junit'
reporters = ['progress'];

port = 9876;
runnerPort = 9100;

colors = true;


// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_INFO;


autoWatch = true;


/* browsers = ['ChromeCanary']; */


// If browser does not capture in given timeout [ms], kill it
captureTimeout = 60000;


// Continuous Integration mode
// if true, it capture browsers, run tests and exit
singleRun = false;
