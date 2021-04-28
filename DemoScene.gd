extends Panel

onready var demo_table = [$DemoTable/Row1, $DemoTable/Row2, $DemoTable/Row3, $DemoTable/Row4, $DemoTable/Row5, $DemoTable/Row6, $DemoTable/Row7]
onready var demo_table_2 = [$TypedTable/Row1, $TypedTable/Row2, $TypedTable/Row3, $TypedTable/Row4]

func _ready():
	var table: Table = CSV_Parser.read_CSV("res://itemlist.csv")
	for i in range(len(table.table_header)):
		demo_table[0].set_label_text(i, table.table_header[i])
	for i in range(len(table.table_content)):
		for j in range(4):
			demo_table[i+1].set_label_text(j, table.table_content[i].custom_properties[table.table_header[j]])
			
	var typed_table: Table = CSV_Parser.read_CSV("res://typeitemlist.csv", true)
	for i in range(len(typed_table.table_header)):
		demo_table_2[0].set_label_text(i, typed_table.table_header[i])
	for i in range(len(typed_table.table_content)):
		for j in range(4):
			demo_table_2[i+1].set_label_text(j, typed_table.table_content[i].custom_properties[typed_table.table_header[j]])

	var query_res = typed_table.query_unique("ID", 2)
	var result_row = $Row1
	for j in range(4):
		result_row.set_label_text(j, query_res.custom_properties[typed_table.table_header[j]])
