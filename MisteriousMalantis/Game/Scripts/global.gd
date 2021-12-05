extends Node

# Sound Control
var sound_on = true
var sound_level = 100
var enemy_level = 0
var enemy_speed = 300
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

func enemyLevelUp():
	enemy_level += 1

func setEnemySpeed(speed):
	enemy_speed = speed
	
func addEnemySpeed(speed):
	enemy_speed += speed

func getEnemySpeed():
	return enemy_speed

func resetEnemy():
	enemy_level = 0
	enemy_speed = 300
