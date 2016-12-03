#!/usr/bin/env bash

LANGS=( "de" "fr" "ru" "zh-hans" "zh-hant" )

for oldfile in $(find ./content -name '*.*.html')
do
	rm $oldfile
done

for file in $(find ./content -name '*.html')
do
	for lang in ${LANGS[@]}
	do
		cp $file ${file%.html}.$lang.html
	done
done

hugo

