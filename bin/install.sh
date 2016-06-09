REPO_DIR=$1

# make sure a directory has been specified
if [ "$1" == "" ]; then
  echo "You must specify a git repo to add emoji-hook to";
  exit 1;
fi

# remove trailing slash if there is one
if [ "${REPO_DIR: -1}" == "/" ]; then
  REPO_DIR="${REPO_DIR%?}";
fi

# check the specified directory is a git repo
if [ ! -d "${REPO_DIR}/.git" ]; then
  echo "It looks like the directory you specified isn't a git repo";
  exit 1;
fi

# link the commit-msg hook
if [ ! -f $REPO_DIR/.git/hooks/commit-msg ]; then
  cp $(pwd)/commit-msg $REPO_DIR/.git/hooks/commit-msg
fi

if [ ! -f $REPO_DIR/.git/hooks/emojis ]; then
  cp $(pwd)/emojis $REPO_DIR/.git/hooks/emojis
fi
