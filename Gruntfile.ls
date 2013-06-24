
{concat, each, map, filter, flatten} = require 'prelude-ls'
require! _: underscore

module.exports = (grunt)->

  build-tasks = []=
    \clean:pre
    \livescript
    \concat:libs
    \requirejs
    \stylus
    \jade
    ...

  grunt-contrib-libs = map (-> "contrib-" + it), []=
    \jade
    \watch
    \stylus
    \copy
    \clean
    \requirejs
    \concat
    ...

  grunt-vendor-libs = []=
    \livescript
    ...

  app-libs = map (-> "dist/lib/#it/#it.min.js"), []=
    \angular
    \jquery
    ...

  each (-> grunt.load-npm-tasks "grunt-" + it ), concat []=
    grunt-contrib-libs
    grunt-vendor-libs
    ...

  each (-> grunt.register-task it[0], _.flatten it[1] ), []=
    * \build
      * build-tasks
        \watch
        ...
    * \default
      * \build
        ...

  grunt.init-config {}=
    pkg: grunt.file.readJSON 'package.json'

    requirejs:
      compile:
        options:
          name: "app"
          base-url: "dist/lib"
          main-config-file: "dist/scripts/app.js"
          out: "dist/scripts/out.js"
          paths:
            app: "../scripts/app"
            main: "../scripts"


    clean:
      pre   : <[
        dist/scripts/*
        dist/*.css
        dist/*js
        ]>
      post  : <[
        dist/client/scripts
        dist/client/lib
      ]>

    livescript:
      options:
        bare: true
        prelude: true
      dist:
        files : []=
          expand : true
          cwd    : "src/"
          src    : "**/*.ls"
          dest   : "dist/"
          ext    : ".js"
          ...

    stylus:
      compile:
        options:
          paths: [ "src/**/styl/**/*.styl" ]
        files: "dist/css/styles.css" : "src/**/styles.styl"

    jade:
      options:
        pretty: true
      compile: 
        files: []=
          expand : true
          cwd    : "src/views"
          src    : "**/*.jade"
          dest   : "dist"
          ext    : ".html"
          ...


    copy:
      libs:
        files: []=
          expand : true
          cwd    : "dist/lib"
          src    : "*/*.min.js"
          dest   : "dist"
          ext    : ".min.js"
          ...

    concat:
      libs:
        src: app-libs
        dest: 'dist/lib-build.js'

    watch:
      files: []=
        "src/**/*.ls"
        "src/**/*.jade"
        "src/**/*.styl"
      tasks: build-tasks

