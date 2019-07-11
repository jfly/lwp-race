#!/usr/bin/env bash

mkdir -p src
python3 memory.py ./src &

mkdir -p /tmp/read-delays/

echo
echo "Compiling (with no delay for accessing 'a.js')"
echo 0 > /tmp/read-delays/a.js
npm run-script build &>/dev/null
cp dist/main.js dist/main.nodelay.js
echo "Running dist/main.nodelay.js (this will print an empty object)"
node dist/main.nodelay.js

echo 
echo "Compiling (with 1 second delay for accessing 'a.js')"
echo 1 > /tmp/read-delays/a.js
npm run-script build &>/dev/null
cp dist/main.js dist/main.withdelay.js
echo "Running dist/main.withdelay.js (this will print a non-empty object)"
node dist/main.withdelay.js
