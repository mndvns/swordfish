{each, map, filter} = require 'prelude-ls'

module.exports = (grunt)->

  grunt.initConfig {}=

    pkg: grunt.file.readJSON 'package.json'

    livescript:
      options: bare: true
      dist:
        paths : <[ src/**/*.ls ]>
        files :
          expand: true
          cwd   : "src/"
          src   : "**/*.ls"
          dest  : "dist/"
          ext   : ".js"
          ...

    stylus:
      compile:
        options:
          paths: <[ src/styl/**/*.styl ]>
        files: "dist/public/css/styles.css" : "src/styl/styles.styl"

    copy: main:
      paths: <[ src/client/**/*.jade ]>
      files: []=
        * expand: true
          cwd : "src/client/views"
          src : "**/*.jade"
          dest: "dist/client/views"
          ext : ".jade"
        ...

    watch:
      files: []=
        '<%= livescript.dist.paths %>'
        '<%= stylus.compile.options.paths %>'
        '<%= copy.main.paths %>'
        ...
      tasks: []=
        \livescript
        \stylus
        \copy
        ...

  each (-> grunt.load-npm-tasks "grunt-" + it ), []=
    \livescript
    \shell
    \contrib-clean
    \contrib-watch
    \contrib-stylus
    \contrib-copy
    ...

  each (-> grunt.register-task it[0], it[1]), []=
    * 'build'
      * \livescript
        \stylus
        \copy
        \watch
        ...
    * 'default'
      * \build
        ...





