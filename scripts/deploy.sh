#!/bin/sh 

## Fetch repositories and tags
cd $(git rev-parse --show-toplevel)
python3 ./get-tags.py

hugo -s $(git rev-parse --show-toplevel)/site -d ../docs
hash=$(git rev-parse HEAD)
git add ./docs
git commit -m "Updating pages $hash"
git push origin main 
