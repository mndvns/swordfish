
{each, map, filter, flatten} = require 'prelude-ls'
require! _: underscore

module.exports = (grunt)->

  build-tasks = []=
    \clean:pre
    \livescript
    \stylus
    \copy
    \concat:lib
    \concat:scripts
    ...

  each (-> grunt.load-npm-tasks "grunt-" + it ), []=
    \livescript
    \shell
    \contrib-watch
    \contrib-stylus
    \contrib-copy
    \contrib-concat
    \contrib-clean
    ...

  each (-> grunt.register-task it[0], _.flatten it[1] ), []=
    * 'build'
      * build-tasks
        \watch
        ...
    * 'default'
      * \build
        ...

  grunt.init-config {}=
    pkg: grunt.file.readJSON 'package.json'

    clean:
      pre   : <[ dist/*/ ]>
      post  : <[
        dist/client/scripts
        dist/client/lib
      ]>

    livescript:
      options:
        bare: true
        prelude: true
      dist:
        paths : <[ src/**/*.ls ]>
        files : []=
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
        files: "dist/public/css/styles.css" : "src/**/styles.styl"

    copy:
      main:
        paths: <[ src/**/*.jade ]>
        files: []=
          expand: true
          cwd : "src"
          src : "**/*.jade"
          dest: "dist"
          ext : ".jade"
          ...

    concat:
      scripts:
        src: <[
          dist/common/**/*.js
          dist/client/scripts/**/*.js
        ]>
        dest: 'dist/public/js/scripts-build.js'
      lib:
        src: <[ dist/client/lib/active/**/*.js ]>
        dest: 'dist/public/js/lib-build.js'

    watch:
      files: []=
        '<%= livescript.dist.paths %>'
        '<%= stylus.compile.options.paths %>'
        '<%= copy.main.paths %>'
        ...
      tasks: build-tasks

