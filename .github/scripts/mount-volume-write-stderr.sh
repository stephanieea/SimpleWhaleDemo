#!/bin/bash
docker pull ubuntu:latest
animals=("capybara", "rhino", "emu")
for animal in ${animals[@]}; do
  echo $animal
  .github/scripts/docker-command.sh $animal
done
tree -a
echo "CAPYBARA LOG"
cat capybara-log.txt
echo "CAPYBARA ERROR LOG"
cat capybara-error-log.txt

echo "rhino LOG"
cat rhino-log.txt
echo "rhino ERROR LOG"
cat rhino-error-log.txt

echo "emu LOG"
cat emu-log.txt
echo "emu ERROR LOG"
cat emu-error-log.txt