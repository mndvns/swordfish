module.exports = (grunt)->
  grunt.initConfig

    pkg: grunt.file.readJSON('package.json')

    # livescript:
    #   options:
    #     bare: true
    #   dist:
    #     src: [
    #       'src/public/js/*.ls'
    #     ]
    #     dest: 'src/public/js/__compiled.js'

    stylus:
      compile:
        options:
          paths: ['src/styl']
        files:
          'src/public/css/style.css': [
            'src/styl/index.styl',
          ]

    watch:
      files: [
        '<%= stylus.compile.options.paths %>'
      ]

  # grunt.loadNpmTasks('grunt-livescript')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-stylus')

  grunt.registerTask('default', [
    'stylus'
    # 'livescript'
  ])



