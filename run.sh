#!/bin/bash

gem install wercker_api --no-rdoc --no-ri

[ -z "$WERCKER_TRIGGER_PIPELINE_PIPELINE_ID" ] && { echo "Step stupidcodefactory/trigger-pipeline requires pipeline-id key to be set"; exit 1 }
[ -z "$WERCKER_TRIGGER_PIPELINE_API_TOKEN" ] && { echo "Step stupidcodefactory/trigger-pipeline requires api-token key to be set"; exit 1 }

ruby main.rb
