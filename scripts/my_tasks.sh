#!/usr/bin/env bash

for d in */; do
  cd $d
  pwd
  git fetch &&
  git log --since=2021-02-01 --until=2021-02-28 --author advortsov | grep Issue:
  cd ..
done