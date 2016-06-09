#!/usr/bin/env bash

for e in `curl -s https://api.github.com/emojis | awk -F '"' '{print $2}'`; do
  [ $e != ' ' ] && echo ":$e:";
done > emojis
