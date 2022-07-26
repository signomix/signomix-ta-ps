#!/bin/bash
rm -r -f src/main/resources/META-INF/resources/*
mkdir -p src/main/resources/META-INF/resources/blog
cp -r src/main/webapp/home/public/* src/main/resources/META-INF/resources
cp src/main/webapp/home/public/local_resources/* src/main/resources/META-INF/resources
cp -r src/main/webapp/blog/public/* src/main/resources/META-INF/resources/blog
cp src/main/webapp/blog/public/local_resources/* src/main/resources/META-INF/resources/blo  g
