# Lambda Layer Generator

A bash script to build layers

## Usage


```bash
$ buildLayer.sh main
```

The script takes one argument that maps to a requirments.txt file. So the above command with look for a 'main.requirements.txt' file and uses that to create a layer in AWS named 'main'. The result of the script will echo back an "arn" of that layer that you can use in your SAM template like this:


```yaml
AWSTemplateFormatVersion: 2010-09-09
Transform: AWS::Serverless-2016-10-31

Globals:
  Function:
    Runtime: python3.7
    Layers:
      - arn:aws:lambda:us-east-1:xxxxxxxxxxx:layer:main:x
```