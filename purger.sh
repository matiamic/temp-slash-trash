#!/bin/bash

# gc Remove the history from 
rm -rf .git

# recreate the repos from the current content only
git init
git add .
git commit -m "in the morning everythin's clearer"

# push to the github remote repos ensuring you overwrite history
git remote add origin git@github.com:matiamic/temp-slash-trash.git
git push -u --force origin master
