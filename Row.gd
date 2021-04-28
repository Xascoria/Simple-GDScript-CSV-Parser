extends Control

onready var label_arr = [$"Label1", $"Label2", $"Label3", $"Label4"]

func set_label_text(index: int, text):
	label_arr[index].text = str(text)
