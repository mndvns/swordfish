var ref$, each, map, filter, flatten, _;
ref$ = require('prelude-ls'), each = ref$.each, map = ref$.map, filter = ref$.filter, flatten = ref$.flatten;
_ = require('underscore');
module.exports = function(grunt){
  var buildTasks;
  buildTasks = ['livescript', 'stylus', 'copy', 'concat'];
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    livescript: {
      options: {
        bare: true
      },
      dist: {
        paths: ['src/**/*.ls'],
        files: [{
          expand: true,
          cwd: "src/",
          src: "**/*.ls",
          dest: "dist/",
          ext: ".js"
        }]
      }
    },
    stylus: {
      compile: {
        options: {
          paths: ['src/styl/**/*.styl']
        },
        files: {
          "dist/public/css/styles.css": "src/styl/styles.styl"
        }
      }
    },
    copy: {
      main: {
        paths: ['src/client/**/*.jade'],
        files: [{
          expand: true,
          cwd: "src/client/views",
          src: "**/*.jade",
          dest: "dist/client/views",
          ext: ".jade"
        }]
      }
    },
    concat: {
      dist: {
        src: ['dist/lib/active/**/*.js'],
        dest: 'dist/public/lib/build.js'
      }
    },
    watch: {
      files: ['<%= livescript.dist.paths %>', '<%= stylus.compile.options.paths %>', '<%= copy.main.paths %>'],
      tasks: buildTasks
    }
  });
  each(function(it){
    return grunt.loadNpmTasks("grunt-" + it);
  }, ['livescript', 'shell', 'contrib-clean', 'contrib-watch', 'contrib-stylus', 'contrib-copy', 'contrib-concat']);
  return each(function(it){
    return grunt.registerTask(it[0], _.flatten(it[1]));
  }, [['build', [buildTasks, 'watch']], ['default', ['build']]]);
};