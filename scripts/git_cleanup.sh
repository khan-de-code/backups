TEMP_VAR=`git rev-parse --abbrev-ref HEAD`;

git checkout main;

git pull;
git fetch --tags;
git fetch --prune;

git checkout $TEMP_VAR;

git branch --merged main | egrep -v -e '^\s\smain$' -e '^\* main$' | xargs -n 1 -r git branch -d;
