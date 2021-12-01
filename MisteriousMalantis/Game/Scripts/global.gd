extends Node

# Sound Control
var sound_on = true
var sound_level = 100

#score
var score = 0

# Screen Control
var fullscreen_on = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func scored():
	score += 1

func resetScore():
	score = 0

func getScore():
	return score
