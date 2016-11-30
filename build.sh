#!/usr/bin/env bash

LANGS=( "de" "fr" "ru" "zh-hans" "zh-hant" )

for file in $(find ./content -name '*.html')
do
	echo $file
	for lang in ${LANGS[@]}
	do
		echo $lang
		cp $file ${file%.html}.$lang.html
	done
done

hugo

