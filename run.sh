#!/bin/bash

gem install wercker_api

[ -z "$WERCKER_TRIGGER_PIPELINE_PIPELINE_ID" ] && { echo "Step stupidcodefactory/trigger-pipeline requires pipeline-id key to be set"; exit 1;}
[ -z "$WERCKER_TRIGGER_PIPELINE_API_TOKEN" ] && { echo "Step stupidcodefactory/trigger-pipeline requires api-token key to be set"; exit 1;}
pwd
ls -la
ruby ./main.rb
