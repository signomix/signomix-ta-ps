#!/bin/bash
cd src/main/webapp/home
npm run build
cd ../blog
npm run build
cd ../../../..
rm -v -r -f src/main/resources/META-INF/resources/*
mkdir -v -p src/main/resources/META-INF/resources/blog
cp -v -r src/main/webapp/home/public/* src/main/resources/META-INF/resources
cp -v src/main/webapp/home/public/local_resources/* src/main/resources/META-INF/resources/resources
cp -v -r src/main/webapp/blog/public/* src/main/resources/META-INF/resources/blog
cp -v src/main/webapp/blog/public/local_resources/* src/main/resources/META-INF/resources/blog/resources
