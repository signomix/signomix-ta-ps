#!/bin/bash
rm -r src/main/resources/META-INF/resources/*
mkdir src/main/resources/META-INF/resources/blog
cp -r src/main/webapp/home/public/* src/main/resources/META-INF/resources
cp -r src/main/webapp/blog/public/* src/main/resources/META-INF/resources/blog
