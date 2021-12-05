class_name Enemy
extends KinematicBody2D

onready var global = get_node("/root/Global")
var initial_speed = 300
var push = initial_speed
var speed = initial_speed
# var level = 0


func _ready():
	pass 

onready var timer = $Frenzy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed = global.getEnemySpeed()
	# getting player position
	var vector_direction = Vector2() #Normalized Direction Vector
	var player_position = get_parent().get_node("Player").get_global_position()
	# defining move direction
	var vectorDirection = get_global_position().direction_to(player_position)
	
	#moving player if collides
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		var collider
		if collision.to_string() != 'null':
			collider = collision.collider
		if(collider is Player):
			get_parent().get_node("Player").move_and_slide((vectorDirection * push), Vector2(0,0))
	
	# if(timer.is_stopped()):
	#	speed = 200
	# else:
	#	speed = 1000
	
	# moving enemy	
	var movement = vectorDirection * global.enemy_speed
	$AnimatedSprite.play()
	move_and_slide(movement, Vector2(0,0))

	pass
	
func destroy():
	get_parent().scored()
	self.queue_free()

# Level up on 'Frenzy' timer timeout
# func _on_Frenzy_timeout():
#	global.enemyLevelUp()
#	print('level up to: ', global.enemy_level)
#	var upgradeCode = global.enemy_level % 2
#	if(upgradeCode==1):
#		var increment = 100
#		global.addEnemySpeed(increment)
#		# speed += increment
#		# push += increment
#	else:
#		var spawner = get_parent().get_node("EnemySpawner")
#		spawner.levelUp()
#		print('upgrade code:', upgradeCode)
#	pass # Replace with function body.
