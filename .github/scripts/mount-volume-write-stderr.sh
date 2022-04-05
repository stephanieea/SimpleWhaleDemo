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


for site in $(jq -rc 'to_entries[] | [.key, .value.path // "."]' testing.json); do
	SCOPE_NAME=$(echo $site | jq -r '.[0]')
	SITE_PATH=$(echo $site | jq -r '.[1]')
	# compile site assets in docker and run it in background
	.github/scripts/docker-command.sh $SCOPE_NAME $SITE_PATH &
done

for SCOPE_NAME in $(jq -rc 'keys[]' testing.json); do
	echo $SCOPE_NAME
	echo "::group::Compile Asset for Scope $SCOPE_NAME"
	echo $(cat "$SCOPE_NAME-log.txt")
	echo "::endgroup::"
done

if [ ! -s site-errors.txt ]; then
	echo "HAS_BUILD_ERRORS=false" >> $GITHUB_ENV
else
	echo "HAS_BUILD_ERRORS=true" >> $GITHUB_ENV
	echo 'BUILD_ERRORS<<EOF' >> $GITHUB_ENV
	cat site-errors.txt >> $GITHUB_ENV
	echo 'EOF' >> $GITHUB_ENV
fi


