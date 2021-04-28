extends Object

class_name TypeConvertor

## A convertor for converting strings into typed variables 
## You can add your own custom convertion here 
static func convert_type(org_str: String, type_of_var: String):
	type_of_var = type_of_var.to_lower()
	match type_of_var:
		"bool":
			return org_str.to_upper() == "TRUE"
		"int":
			return int(org_str)
		"float":
			return float(org_str)
		"string":
			return org_str
		# Leaving empty is just a string
		"":
			return org_str


