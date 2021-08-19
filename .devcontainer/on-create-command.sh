#!/bin/bash

playground_dir=$(pwd)

hash apptokit 2>/dev/null || {
  cd /workspaces

  git clone https://github.com/jakewilkins/apptokit

  cd apptokit

  bash install.sh install --i-have-read-this-script

  cd $playground_dir
}

app_name="Playground App $HOSTNAME"

sed -i "s/%APP_NAME%/$app_name/g" ./.apptokit.yml
sed -i "s/%CODESPACES_NAME%/$CODESPACE_NAME/g" ./.apptokit.yml
sed -i "s/default_env: test/default_env: playground/g" ~/.config/apptokit.yml

nohup script/hook-receiver &
