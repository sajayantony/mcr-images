#!/bin/sh 

## Fetch repositories and tags
cd $(git rev-parse --show-toplevel)
python3 ./get-tags.py


git push origin :gh-pages
git banch -D gh-pages
git checkout -b gh-pages
hugo -s $(git rev-parse --show-toplevel)/site -d ../docs
hash=$(git rev-parse HEAD)
git add -f ./docs
git commit -m "Updating pages $hash"
git push origin gh-pages
git checkout main
