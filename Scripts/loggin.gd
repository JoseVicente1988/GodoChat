extends Node

signal SendDataTo(message)
var connection := Net
@onready var chatload : ItemList = get_node("Chatpanel/Chat")
@onready var user : LineEdit = get_node("logginpanel/VBoxContainer/name")
@onready var message : LineEdit = get_node("Chatpanel/HBoxContainer/message")


func _ready() -> void:
	var args = OS.get_cmdline_args()
	if "--Server" in args:
		connection.ServerConnect()
	Functions.Fade($logginpanel,1,1)
	multiplayer.connected_to_server.connect(connectesucces)


func ExitPress() -> void:
	get_tree().quit()

func _press_connect_to() -> void:
	connection.ClientConnect()


func connectesucces() ->void:

	Functions.Fade($logginpanel,0,1)
	await(get_tree().create_timer(1.0).timeout)
	$logginpanel.hide()
	$Chatpanel.show()
	Functions.Fade($Chatpanel,1,1)


@rpc("any_peer","call_local")
func _on_send_data_to(message) -> void:
	chatload.add_item(message, null,false)

#region SendMessage
func SendMessage() -> void:
	if message.text.length() >= 1:
		_on_send_data_to.rpc(message.text,null)
		message.clear()


func MensajeLanzado(new_text: String) -> void:
	if message.text.length() >= 1:
		_on_send_data_to.rpc(str(user.text) + ': ' + message.text)
		message.clear()
#endregion
