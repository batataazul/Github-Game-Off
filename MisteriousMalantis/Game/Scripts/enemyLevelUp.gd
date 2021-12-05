extends Timer

var level = 0
onready var global = get_node("/root/Global")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LevelUpTimer_timeout():
	#Increasing difficulty
	global.enemyLevelUp()
	# print('level up to: ', global.enemy_level)
	var upgradeCode = global.enemy_level % 3
	
	if(upgradeCode==2):
		var spawner = get_parent().get_node("EnemySpawner")
		spawner.levelUp()
		# print('upgrade code:', upgradeCode)
	else:
		var increment = 25
		global.addEnemySpeed(increment)
		# print('upgrade code:', upgradeCode)
		# speed += increment
		# push += increment
		
	pass # Replace with function body.
