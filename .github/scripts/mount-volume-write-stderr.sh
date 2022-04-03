#!/bin/bash
docker pull ubuntu:latest
# animals=("capybara" "rhino" "emu")
# for animal in ${animals[@]}; do
#   echo $animal
#   .github/scripts/docker-command.sh $animal &
# done
# wait
# tree -a
# echo "CAPYBARA LOG"
# cat capybara-log.txt
# echo "CAPYBARA ERROR LOG"
# cat capybara-error-log.txt

# echo "rhino LOG"
# cat rhino-log.txt
# echo "rhino ERROR LOG"
# cat rhino-error-log.txt

# echo "emu LOG"
# cat emu-log.txt
# echo "emu ERROR LOG"
# cat emu-error-log.txt

for site in $(jq -rc 'to_entries[] | [.key, .value.path // "."]' manifest.json); do
	SITE_NAME=$(echo $site | jq -r '.[0]')
	SITE_PATH=$(echo $site | jq -r '.[1]')
	# compile site assets in docker and run it in background
	.github/scripts/docker-command.sh $SITE_NAME $SITE_PATH &
done
wait
tree -a
echo "fre LOG"
cat fre-log.txt
echo "fre ERROR LOG"
cat fre-error-log.txt

echo "bringatrailer LOG"
cat bringatrailer-log.txt
echo "bringatrailer ERROR LOG"
cat bringatrailer-error-log.txt

echo "caranddriver LOG"
cat caranddriver-log.txt
echo "caranddriver ERROR LOG"
cat caranddriver-error-log.txt