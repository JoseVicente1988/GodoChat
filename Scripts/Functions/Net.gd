extends Node
class_name Network

var eNet := ENetMultiplayerPeer.new()

const PORT = 8080
const ADRESS = "localhost"
const MAXCLIENTS = 100

var DataUsers : Array = []


func ServerConnect() -> void:
	var error = eNet.create_server(PORT,MAXCLIENTS)
	if error == OK:
		print("Server created at port: ", PORT)
		multiplayer.multiplayer_peer = eNet
	else:
		printerr("Error, can't create server: ", error)


func ClientConnect() -> void:
	var error = eNet.create_client(ADRESS,PORT)
	if error != OK:
		printerr("Can't connect to server, retry.")
	else:
		print("Connected to Server: ", ADRESS)
		multiplayer.multiplayer_peer = eNet
		
