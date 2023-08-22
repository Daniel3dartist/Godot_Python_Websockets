extends HBoxContainer

@onready var line = self.get_node("LineEdit")


func _on_line_edit_focus_entered():
	self.get_node('Send_Button').visible = true
	self.get_node('Mic_Button').visible = false


func _on_line_edit_focus_exited():
	if line.text == null or line.text == '':
		self.get_node('Send_Button').visible = false
		self.get_node('Mic_Button').visible = true


func _on_rich_text_label_gui_input(event):
	if event.is_pressed() == true:
		line.release_focus()
