#!/bin/sh
cd /home/llz/dev/blog
npx hexo generate
rsync -r public/ /home/llz/dev/blog.dep/
cd /home/llz/dev/blog.dep/
git add .
git commit -m 'update'
git push
