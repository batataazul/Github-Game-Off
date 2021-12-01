extends Node2D

var score = 0
signal sendScore

func _ready():
	Global.resetScore()
	pass # Replace with function body.

func _process(delta):
	var position = $Player.get_global_position()
	if(position[1] > 780):
		get_tree().change_scene("res://Game/Scenes/Menus/DeathScreen.tscn")
	emit_signal("sendScore")
	pass

func scored():
	score += 1
	Global.scored()
	var format_string = "%s"
	$Label.text = format_string % score
	pass
	
func tree_exiting():
	emit_signal("sendScore")
	pass
