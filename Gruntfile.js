var shell = require('shelljs')

module.exports = function(grunt) {

  grunt.initConfig({
    watch: {
      gruntfile: {
        files: 'Gruntfile.js',
        tasks: ['clean:build'],
      },
      src: {
        files: ['./**/*.xml'],
        tasks: ['build'],
      },
    },
  })

  grunt.registerTask('default', [ 'clean', 'build', 'watch' ])

  grunt.registerTask('clean', 'Clean out index.html', function() {
    shell.rm('index.html')
  })

  grunt.registerTask('build', 'Build the XEP', function() {
    shell.exec('make')
  })

  grunt.loadNpmTasks('grunt-contrib-watch')

}
