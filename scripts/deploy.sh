#!/bin/sh 

cd $(git rev-parse --show-toplevel)
hugo -s $(git rev-parse --show-toplevel)/site -d ../docs
git checkout gh-pages
hash=$(git rev-parse HEAD)
git add -f ./docs
git commit -m "Updating pages $hash"
git push origin gh-pages
git checkout main
