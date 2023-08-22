extends Control

@onready var RTLabel = $Panel/VBoxContainer/HBoxContainer/VBoxContainer/RichTextLabel
@onready var Line = $Panel/VBoxContainer/HBoxContainer/VBoxContainer/Input_HBoxContainer/LineEdit

var _user = '[color=green]You:[/color] '
var _bot = '[color=aqua]Godette:[/color] '

func _on_button_button_up():
	submit_txt(_user + Line.text + '\n')


func _on_line_edit_text_submitted(new_text):
	submit_txt(_user + new_text + '\n')


func submit_txt(txt):
#	RTLabel.append_text(_bot +' test' + '\n')
	if Line.text == '' or Line.text == ' ' or Line.text == null:
		pass
	else:
		RTLabel.append_text(txt)
	Line.clear()


func _on_node_receive_str(txt):
	submit_txt(_bot+ String(txt) + '\n')
