extends Control

@onready var RTLabel = $Panel/VBoxContainer/RichTextLabel
@onready var Line = $Panel/VBoxContainer/HBoxContainer/LineEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_up():
	submit_txt('You: \n' + Line.text + '\n')


func _on_line_edit_text_submitted(new_text):
	submit_txt('You: ' + new_text + '\n')


func submit_txt(txt):
	RTLabel.append_text(txt)


func _on_node_receive_str(txt):
	submit_txt('Godet: '+ String(txt) + '\n')
