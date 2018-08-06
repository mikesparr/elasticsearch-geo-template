# Elasticsearch Geo Template
This is how I created a dynamic mapping template to store both `geo_point` and `geo_shape` types 
in Elasticsearch to support visualizations needing shapes and aggregations needing points for 
latitude and longitude coordinates of records.

## Conclusion
It doesn't seem possible to combine both to a single field so I had to create two fields.

## Background
I had mapped some data originally as `geo_point` and later learned in order to compare layers to 
shape data those records had to also be `geo_shape` type. Some aggregations only work with `geo_point` 
type so I wanted to keep both for each record to support a variety of query types.

# Requirements
You should have Elasticsearch 6.2.4 or later but this may work for older versions that support 
dynamic mapping templates and `geo_shape` and `geo_point` types.

# Testing
There is a script, `commands.sh`, that shows the curl commands to create the mapping template, then 
index test document(s), and confirm expected results.

## Extras
I've included the JSON objects for mappings, test record, etc. so you can execute with any tool 
you choose (if curl and bash not available)

# Resources
 * https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-templates.html
 * https://www.elastic.co/guide/en/elasticsearch/reference/current/dynamic-templates.html
 * https://www.elastic.co/guide/en/elasticsearch/reference/current/geo-point.html
 * https://www.elastic.co/guide/en/elasticsearch/reference/current/geo-shape.html
