#! /usr/bin/env bash

echo 'Creating geo mapping template...'
curl -XPUT -H "Content-type: application/json" localhost:9200/_template/test_1 -d @mapping-template.json

sleep 1.5

echo 'Creating test record with geo-point location...'
curl -XPOST -H "Content-type: application/json" localhost:9200/test1/_doc -d @doc-test.json

sleep 2

echo 'Confirming record exists in test1 index...'
DOC_TEST=$(curl -s 'localhost:9200/test1/_search?pretty=true' 2>/dev/null)
echo "$DOC_TEST"
#echo $2

sleep .5

echo 'Cleaning up ...'
curl -XDELETE localhost:9200/test1
curl -XDELETE localhost:9200/_template/test_1

echo 'All done...'
exit 0
