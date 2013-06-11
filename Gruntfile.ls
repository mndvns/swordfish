
{each, map, filter, flatten} = require 'prelude-ls'
require! _: underscore

module.exports = (grunt)->

  build-tasks = []=
    \livescript
    \stylus
    \copy
    \concat
    ...
  grunt.initConfig {}=
    pkg: grunt.file.readJSON 'package.json'

    livescript:
      options: bare: true
      dist:
        paths : <[ src/**/*.ls ]>
        files : []=
          * expand: true
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
        expand: true
        cwd : "src/client/views"
        src : "**/*.jade"
        dest: "dist/client/views"
        ext : ".jade"
        ...

    concat: dist:
      src: <[
        dist/lib/active/**/*.js
        ]>
      dest: 'dist/public/lib/build.js'

    watch:
      files: []=
        '<%= livescript.dist.paths %>'
        '<%= stylus.compile.options.paths %>'
        '<%= copy.main.paths %>'
        ...
      tasks: build-tasks

  each (-> grunt.load-npm-tasks "grunt-" + it ), []=
    \livescript
    \shell
    \contrib-clean
    \contrib-watch
    \contrib-stylus
    \contrib-copy
    \contrib-concat
    ...

  each (-> grunt.register-task it[0], _.flatten it[1] ), []=
    * 'build'
      * build-tasks
        \watch
        ...
    * 'default'
      * \build
        ...





