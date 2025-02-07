#!/bin/sh

set -x # verbose mode
set -e # stop executing after error

####################################################
# Set workspace permissions
####################################################

chmod -R a+w /github/workspace

####################################################
# Change work directory
####################################################

if [ -z "$1" ]
then
    cd "/github/workspace"
else
    cd "/github/workspace/$1"
fi

####################################################
# Build the Jekyll site
####################################################

echo "Starting Jekyll build"
gem update --system
bundle install
bundle exec jekyll --version
bundle exec jekyll build --trace

####################################################
# Build completed
####################################################

echo "Completed Jekyll build"
