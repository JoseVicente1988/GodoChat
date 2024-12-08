extends Control

signal AddData(message)
@onready var Chat : ItemList = get_node("ItemList")

func _on_add_data(message: Variant) -> void:
	Chat.add_item(message,null,false)
