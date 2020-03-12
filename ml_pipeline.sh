#!/usr/bin/env bash

#configure aws; will be used for dvc
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID && aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY && aws configure set default.region $AWS_REGION
  
#updated model, push to dvc and git  
cd /app/continuous-intelligence && dvc repro model.pkl.dvc && dvc push model.pkl.dvc && git add model.pkl.dvc && git commit -m 'model updated' && git push https://$GIT_USER:$GIT_TOKEN@github.com/KeeBac/cd4ml-workshop-2.git