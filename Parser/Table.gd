extends Object

class_name Table

## The keys/properties of the table
var table_header: Array = []
## Types, can be empty
var table_types: Array = []
## A list of custom objects, from the content of the table
var table_content: Array = []

## Query a property with a value and get a list of all objects with that value in return
func query(property_name: String, value) -> Array:
	var output = []
	if not property_name in table_types:
		return output
	for i in range(len(table_content)):
		if table_content[i].custom_properties[property_name] == value:
			output.append(table_content[i])
	return output

## Query an object with a property using a unique ID, if there's more than one it will
## Just return the first one
func query_unique(property_name: String, value) -> CustomObject:
	for i in range(len(table_content)):
		if table_content[i].custom_properties[property_name] == value:
			return table_content[i]
	return null
