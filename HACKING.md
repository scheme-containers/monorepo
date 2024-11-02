# Hacking

## ./build

The image builder ./build is a script that reads data from data/ directory,
applies it to template from templates/ directory and builds the resulting
dockerfile.

## ./generate-jenkinsfile

Similar to the build script, reads data from data folder but produces usable
Jenkinsfile. The stages are split so that it's clear which build fails and
if one stage fails then the jobs after that should still be built.

