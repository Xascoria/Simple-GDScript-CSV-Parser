extends Object

class_name CSV_Parser

## Read a csv file and create a table of custom objects
## If has_type is true, the second line must specify each variable's type (int, float)
static func read_CSV(filepath: String, has_type: bool = false):
	var f = File.new()
	f.open(filepath, File.READ)
	
	var table = Table.new()
	table.table_header = f.get_csv_line()
	var types = []
	if has_type:
		types = f.get_csv_line()
		table.table_types = types
		
	while not f.eof_reached():
		var row = f.get_csv_line()
		var new_obj = CustomObject.new()
		for i in range(len(row)):
			var new_val = row[i]
			if has_type:
				new_val = TypeConvertor.convert_type(row[i], table.table_types[i])
			new_obj.custom_properties[table.table_header[i]] = new_val
		table.table_content.append(new_obj)
	table.table_content.pop_back()
	return table


