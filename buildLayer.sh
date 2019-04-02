#!/bin/bash

# layerName useed to map to '*.requirements.txt' file and to name the layer in AWS
if [[ $# -eq 0 ]] ; then
    echo 'Please provide the name of the layer that you want to build'
    echo './buildLayer.sh layerName'
    exit 0
fi

# Make a build/python directory, and download all the py requirments into that directory
mkdir -p build/python
sudo pip install -r $1.requirements.txt -t build/python

# zip everything int he build directory into layer.zip and delete the build directory
cd build
zip -r ../layer.zip .
cd ..
rm -r build

# Publish layer.zip to AWS. Make note of the ARN of your new layer
aws lambda publish-layer-version --layer-name $1 --zip-file fileb://layer.zip

# delete layer.zip
rm layer.zip