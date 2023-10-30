#!/bin/bash

if [ -f "sample.txt" ]
then
    echo `mv sample.txt sample_old.txt`
fi
if [ -f "demo.txt" ]
then
        echo `mv demo.txt demo_old.txt`
fi
if [ -f "output.json" ]
then
        echo `mv output.json output_old.json`
fi

## Fetch metadata from AWS
echo `curl http://169.254.169.254/latest/meta-data/ > sample.txt`

echo "{" >> demo.txt
while IFS= read -r line; do
        if [[ "$line" != *\/* ]];
        then
                value=`curl http://169.254.169.254/latest/meta-data/$line/` > /dev/null
                echo "\"$line\":\"$value\"," >> demo.txt
        fi
done < sample.txt

total_line=`awk 'END { print NR }' demo.txt`
file_content=`cat demo.txt`
count=0

for i in $file_content;do
        echo $i >> output.json
        count=`expr $count + 1`
        if [ "$count" == "$total_line" ]
        then
                echo $i | sed 's/.$//' >> output.json
                break
        fi
done

echo "}" >> output.json
#echo `cat output.json | jq '.'`
cat output.json | jq '.'
if [ "$?" == 0 ]
then
        echo "AWS instance metadata is retrieved successfully."
else
        echo "There is some problem in json file."
fi
