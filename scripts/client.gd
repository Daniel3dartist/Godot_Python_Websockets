extends Node

@export var PORT : int = 8080
@export var URL : String = '127.0.0.1'
var _host : String = 'ws://%s:%s' % [URL, PORT]
var _client = WebSocketPeer.new()

signal receive_str(txt)

# Called when the node enters the scene tree for the first time.
func _ready():
	var err = _client.connect_to_url(_host)
	if err != OK:
		print('Erro to connect!')
	else:
		var _port = _client.get_connected_port()
		print('Connected Succefuly on PORT: %s' % _port)
		print('ws://%s:%s' % [_client.get_connected_host(), _port])
#	send_msg('')
#	receive_data()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_client.poll()
	var state = _client.get_ready_state()
	if state == WebSocketPeer.STATE_OPEN:
		var pac = _client.get_packet()
		if pac.size() > 0:
			receive_data(pac)
#		print("Packet: ", _client.get_packet())
	elif state == WebSocketPeer.STATE_CLOSED:
		var code =_client.get_close_code()
		var reason = _client.get_close_reason()
		print("WebSocket closed with code: %d, reason %s. Clean: %s" % [code, reason, code != -1])
		set_process(false)
	else:
		pass

func receive_data(pac):
	var payload = _client.get_packet()
	var txt = pac.get_string_from_ascii()
	print('Got message: %s' % txt)
	$Control/Panel/VBoxContainer/RichTextLabel.append_text(txt+'\n')
#	emit_signal(txt)
#	send_msg('msg')


func send_msg(msg):
	_client.put_packet(msg.to_ascii_buffer())


func _on_button_button_up():
	var line = $Control/Panel/VBoxContainer/HBoxContainer/LineEdit.text
	send_msg(line)


func _on_line_edit_text_submitted(new_text):
	send_msg(new_text)
