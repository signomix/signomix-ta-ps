#!/bin/bash
cd src/main/webapp/home
npm run build
cd ../blog
npm run build
cd ../../../../
rm -r -f src/main/resources/META-INF/resources/*
mkdir -p src/main/resources/META-INF/resources/blog
cp -r src/main/webapp/home/public/* src/main/resources/META-INF/resources
cp src/main/webapp/home/public/local_resources/* src/main/resources/META-INF/resources/resources
cp -r src/main/webapp/blog/public/* src/main/resources/META-INF/resources/blog
cp src/main/webapp/blog/public/local_resources/* src/main/resources/META-INF/resources/blog/resources
