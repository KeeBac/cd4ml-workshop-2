#!/usr/bin/env bash

#updated model, push to dvc and git  
#cd /app/continuous-intelligence && python src/test_script.py

cd /app/continuous-intelligence && dvc repro model.pkl.dvc && dvc push model.pkl.dvc && git add model.pkl.dvc && git commit -m 'model updated' && git push https://$GIT_USER:$GIT_TOKEN@github.com/KeeBac/cd4ml-workshop-2.git
