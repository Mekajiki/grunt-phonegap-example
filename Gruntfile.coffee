module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    phonegap:
      config:
        root: 'www'
        config: 'src/config.xml'
        cordova: '.cordova'
        platforms: ['android', 'ios']

    jade:
      compile:
        expand: true
        cwd: 'src'
        src: ['**/*.jade']
        dest: 'www'
        ext: '.html'

    coffee:
      compile:
        options:
          bare: true
        expand: true
        cwd: 'src/js'
        src: ['**/*.coffee']
        dest: 'www/js'
        ext: '.js'

    sass:
      compile:
        expnad: true
        files: ['www/css/index.css': 'src/css/index.sass']
        #TODO: configure recursive compilation
        #cwd: 'src/css'
        #src: ['**/*.sass']
        #dest: 'www/css/'
        #ext: '.css'

  grunt.loadNpmTasks('grunt-phonegap')
  grunt.loadNpmTasks('grunt-contrib-jade')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-sass')

  grunt.registerTask 'default', ['jade', 'coffee', 'sass', 'phonegap:build']
