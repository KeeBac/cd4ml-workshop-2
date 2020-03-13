#!/usr/bin/env bash

#updated model, push to dvc and git
#cd /app/continuous-intelligence && dvc repro model.pkl.dvc && dvc push model.pkl.dvc && git add model.pkl.dvc \
#&& git commit -m 'model updated' && git push https://$GIT_USER:$GIT_TOKEN@github.com/KeeBac/cd4ml-workshop-2.git

#change working directory
cd /app/continuous-intelligence

#rerun ml pipeline
dvc repro model.pkl.dvc

#push updated model to s3
dvc push model.pkl.dvc

#check git status; might happen that there are no changes made to the model.pkl.dvc; if so no commit to be done
if [ `git status | grep -c "model.pkl.dvc"` -gt 0 ]
then
    #add tracking file to git
    git add model.pkl.dvc
    git commit -m 'model has been updated'
    git push https://$GIT_USER:$GIT_TOKEN@github.com/KeeBac/cd4ml-workshop-2.git
else
    #'nothing to do; exit silently'
    :
fi

