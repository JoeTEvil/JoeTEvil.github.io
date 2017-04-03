#global module:false

"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-exec"

  grunt.initConfig ({

    copy: {
        bulma: {
            files: [{
                expand: true
                cwd: 'bower_components/bulma/sass/base/'     
                src: '**/*.sass'           
                dest: '_sass/bulma/base/'          
            },
             {
                expand: true
                cwd: 'bower_components/bulma/sass/components/' 
                src: '**/*.sass'           
                dest: '_sass/bulma/components/'          
            },
            {
                expand: true
                cwd: 'bower_components/bulma/sass/elements/'    
                src: '**/*.sass'           
                dest: '_sass/bulma/elements/'         
            },
            {
                expand: true
                cwd: 'bower_components/bulma/sass/grid/'     
                src: '**/*.sass'           
                dest: '_sass/bulma/grid/'          
              },
            {
                expand: true
                cwd: 'bower_components/bulma/sass/layout/'  
                src: '**/*.sass'       
                dest: '_sass/bulma/layout/'           
            },
            {
                expand: true
                cwd: 'bower_components/bulma/sass/utilities/'
                src: '**/*.sass'           
                dest: '_sass/bulma/utilities/'           
            }]
        }
        fontAwesome: {
            files: [{
                expand: true
                cwd: 'bower_components/font-awesome/scss/' 
                src: '**/*.scss'        
                dest: '_sass/font-awesome/'           
            },
            {
                expand: true
                cwd: 'bower_components/font-awesome/fonts/'   
                src: '**/*.*'        
                dest: 'fonts/'          
            }]
        }
    }
    exec: {
      jekyll:
        cmd: "jekyll build --trace"
      hyde:
        cmd: "JEKYLL_ENV=production jekyll build --trace"
    }
    watch: {
      options:
        livereload: true
      source:
        files: [
          "_drafts/**/*"
          "_includes/**/*"
          "_layouts/**/*"
          "_sass/**/*"
          "assets/**/*"
          "tags/**/*"
          "posts/**/*"
          "posts/_posts/**/*"
          "fonts/**/*"
          "_config.yml"
          "*.html"
          "*.md"
        ]
        tasks: [
          "exec:jekyll"
        ]
    }
    connect: {
      server:
        options:
          port: 4000
          base: '_site'
          livereload: true
    }

  });
  grunt.registerTask "build", [
    "copy"
    "exec:jekyll"
  ]

  grunt.registerTask "serve", [
    "build"
    "connect:server"
    "watch"
  ]

  grunt.registerTask "deploy", [
    "copy"
    "exec:hyde"
  ]

  grunt.registerTask "default", [
    "serve"
  ]