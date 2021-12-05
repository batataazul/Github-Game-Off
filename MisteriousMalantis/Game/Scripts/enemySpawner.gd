extends YSort

onready var global = get_node("/root/Global")
var initial_enemies = 4
var max_enemies = initial_enemies
var enemyNode = preload("res://Game/Scenes/Actors/Enemy.tscn")
var RNG = RandomNumberGenerator.new()

func _ready():
	set_sort_enabled(true)
	pass # Replace with function body.


func _process(delta):
	#getting number of enemies
	var i = 0
	for enemy in get_tree().get_nodes_in_group("Enemies"):
		i += 1
	
	#spawning enemies till max_enemies number
	if(i<max_enemies):
		for j in range(max_enemies-i):
			spawnEnemy()
	pass

func spawnEnemy():
	# randomizing location
	var spawnLocation = RNG.randi_range(0,8)
	var i = 1
	for spawner in get_tree().get_nodes_in_group("Spawner"):
		if(i==spawnLocation):
			#spawning enemy
			var enemy = enemyNode.instance()
			enemy.position = spawner.position
			enemy.add_to_group("Enemies")
			get_parent().add_child(enemy)
			return
		i += 1

func levelUp():
	max_enemies = initial_enemies + global.enemy_level
	pass
