#!/usr/bin/env bash

HTML_DIR="../blog-html"

echo "generate public dir"
hugo
echo "generate public dir END"

echo "Copy files to blog-html"
cp -r public/* ${HTML_DIR}
echo "Copy files to blog-html END"

rm -fr public
