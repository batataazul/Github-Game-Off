extends Control

var game_scene_location = "res://Game/Scenes/Levels/Game.tscn"
onready var global = get_node("/root/Global")
var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene(game_scene_location)
	pass # Replace with function body.

func tree_entered():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	pass
