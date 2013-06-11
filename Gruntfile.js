var ref$, each, map, filter;
ref$ = require('prelude-ls'), each = ref$.each, map = ref$.map, filter = ref$.filter;
module.exports = function(grunt){
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
          "dist/css/styles.css": "src/styl/styles.styl"
        }
      }
    },
    watch: {
      files: ['<%= livescript.dist.paths %>', '<%= stylus.compile.options.paths %>'],
      tasks: ['livescript', 'stylus']
    }
  });
  each(function(it){
    return grunt.loadNpmTasks("grunt-" + it);
  }, ['livescript', 'shell', 'contrib-clean', 'contrib-watch', 'contrib-stylus']);
  return each(function(it){
    return grunt.registerTask(it[0], it[1]);
  }, [['build', ['livescript', 'stylus', 'watch']], ['default', ['build']]]);
};