module.exports = (grunt)->
  grunt.initConfig

    pkg: grunt.file.readJSON('package.json')

    livescript:
      options:
        bare: true
      dist:
        src: [
          'src/public/js/*.ls'
        ]
        dest: 'src/public/js/__compiled.js'

    watch:
      files: [
        '<%= livescript.dist.src %>'
      ]


  grunt.loadNpmTasks('grunt-livescript')
  grunt.loadNpmTasks('grunt-contrib-watch')

  grunt.registerTask('default', [
    'livescript'
  ])



