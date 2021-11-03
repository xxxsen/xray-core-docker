#!/bin/sh

tagname=$(curl "https://github.com/$1/releases" 2>&1 | grep "tree" | grep "data-view-component"  | head -n 1 | awk -F"\"" '{print $2}' | awk -F"/" '{print $5}')
echo "::set-output name=LATEST_TAG_NAME::${tagname}"
