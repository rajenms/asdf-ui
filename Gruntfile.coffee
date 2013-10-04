reverseProxyApiRequest = (host, port) ->
  httpProxy = require('http-proxy')
  # Create a new instance of HttProxy to use in your server
  proxy = new httpProxy.RoutingProxy()
  (req, res, next) ->
    if(/^\/api\//.test(req._parsedUrl.pathname))
      proxy.proxyRequest(req, res,
        host: host
        port: port
      )
    else
      next()

module.exports = (grunt) ->

  # Load Grunt tasks declared in the package.json file
  require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks

  # Project configuration.
  grunt.initConfig

    # Grunt-express will serve the files from the folders listed in 'bases'
    # on specified /port' and 'hostname'.
    express:
      all:
        options:
          port: 9000
          hostname: "0.0.0.0"
          bases: ['app']
          livereload: true


    # Grunt-open will open your browser at the project's URL.
    open:
      all:
        path: 'http://localhost:<%= express.all.options.port%>'

    # Grunt-watch will monitor the projects files.
    watch:
      all:
        files: [
          'app/index.html'
          'app/scripts/*.coffee'
          'app/scripts/**/*.coffee'
          'app/styles/*.sass'
        ]
        tasks: ['coffee', 'compass']
        options:
          livereload: true

    # Compile sass files to css files.
    compass:
      options:
        sassDir: 'app/styles'
        cssDir: 'app/dist/styles'
        relativeAssets: false
      server:
        options:
          debugInfo: true

    # Compile coffeescript files to javascript.
    coffee:
      compile:
        files: 'app/dist/scripts/app.js' : [
          'app/scripts/*.coffee'
          'app/scripts/**/*.coffee'
        ]

    # Creates the 'server' task.
    grunt.registerTask 'server', [
      'express'
      'open'
      'coffee'
      'compass'
      'watch'
    ]