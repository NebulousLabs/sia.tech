#!/usr/bin/env bash

LANGS=( "ha" "de" "fr" "ru" "zh-hans" "zh-hant" )

for oldfile in $(find ./content -name '*.*.html')
do
	rm -f $oldfile
done

rm -f ./content/download.html
rm -f ./content/downloads.html

for file in $(find ./content -name '*.html')
do
	if [ "$(basename "${file}")" = "apps.html" ];
	then
		cp $file $(dirname ${file})/download.html
		cp $file $(dirname ${file})/downloads.html
	fi
done

for file in $(find ./content -name '*.html')
do
	for lang in ${LANGS[@]}
	do
		cp $file ${file%.html}.$lang.html
	done
done

hugo

