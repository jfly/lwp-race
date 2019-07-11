#!/usr/bin/env bash

mkdir -p src
python3 memory.py ./src &

npm run-script build && node dist/main.js
