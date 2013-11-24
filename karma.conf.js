// Karma configuration
// http://karma-runner.github.io/0.10/config/configuration-file.html

module.exports = function(config) {
  config.set({
    // base path, that will be used to resolve files and exclude
    basePath: '',

    // testing framework to use (jasmine/mocha/qunit/...)
    frameworks: ['jasmine'],

    preprocessors: {
      '**/*.coffee': ['coffee']
    },

    coffeePreprocessor: {
      options: {
        bare: true,
        sourceMap: false
      },
      transformPath: function(path) {
        return path.replace(/\.js$/, '.coffee');
      }
    },

    // list of files / patterns to load in the browser
    files: [
      'app/bower_components/jquery/jquery.js',
      'app/bower_components/angular/angular.js',
      'app/bower_components/angular-mocks/angular-mocks.js',
      'app/bower_components/angular-ui-router/release/angular-ui-router.min.js',
      'app/bower_components/angular-cookies/angular-cookies.min.js',
      'app/bower_components/bootstrap-sass/js/bootstrap-affix.js',
      'app/bower_components/bootstrap-sass/js/bootstrap-alert.js',
      'app/bower_components/bootstrap-sass/js/bootstrap-dropdown.js',
      'app/bower_components/bootstrap-sass/js/bootstrap-tooltip.js',
      'app/bower_components/bootstrap-sass/js/bootstrap-modal.js',
      'app/bower_components/bootstrap-sass/js/bootstrap-transition.js',
      'app/bower_components/bootstrap-sass/js/bootstrap-button.js',
      'app/bower_components/bootstrap-sass/js/bootstrap-popover.js',
      'app/bower_components/bootstrap-sass/js/bootstrap-typeahead.js',
      'app/bower_components/bootstrap-sass/js/bootstrap-carousel.js',
      'app/bower_components/bootstrap-sass/js/bootstrap-scrollspy.js',
      'app/bower_components/bootstrap-sass/js/bootstrap-collapse.js',
      'app/bower_components/bootstrap-sass/js/bootstrap-tab.js',
      'app/bower_components/angular-resource/angular-resource.js',
      'app/bower_components/angular-cookies/angular-cookies.js',
      'app/bower_components/angular-sanitize/angular-sanitize.js',
      '.tmp/scripts/app.js',
      'test/mock/**/*.coffee',
      'test/spec/**/*.coffee',
    ],

    // list of files / patterns to exclude
    exclude: [],

    // web server port
    port: 8080,

    // level of logging
    // possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: false,


    // Start these browsers, currently available:
    // - Chrome
    // - ChromeCanary
    // - Firefox
    // - Opera
    // - Safari (only Mac)
    // - PhantomJS
    // - IE (only Windows)
    browsers: ['Chrome'],


    // Continuous Integration mode
    // if true, it capture browsers, run tests and exit
    singleRun: false
  });
};
