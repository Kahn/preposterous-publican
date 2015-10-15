#!/bin/bash
set -e

rm -rf tmp || exit 0;

publican build --langs=en-US --formats=html

cd tmp/en-US/html
git init
git config user.name "Travis CI"
git config user.email "noreply@example.org"
git add .
git commit -m "Deploy to GitHub Pages"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
exit 0
