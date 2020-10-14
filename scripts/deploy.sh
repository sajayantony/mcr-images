#!/bin/sh 

cd $(git rev-parse --show-toplevel)
hugo -s $(git rev-parse --show-toplevel) -d ../docs
git checkout gh-pages
hash=$(git rev-parse HEAD)
git add .
git commit -m "Updating pages $hash"
git push origin gh-pages
git checkout main
