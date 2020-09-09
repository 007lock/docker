#!/usr/bin/env sh

if [ ! -d node_modules ]; then
    echo "Install nodejs..."
    cp -f package.json /src && npm cache clean --force && cd /src && npm install    
    cp -rf /src/node_modules $@
    echo $@
fi

echo "Console running..." && tail -f /dev/null