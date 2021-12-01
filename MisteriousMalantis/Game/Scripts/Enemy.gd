class_name Enemy
extends KinematicBody2D

var speed = 500
var push = speed
var level = 0

func _ready():
	pass 

onready var timer = $Frenzy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vector_direction = Vector2() #Normalized Direction Vector
	var player_position = get_parent().get_node("Player").get_global_position()
	

	
	var vectorDirection = get_global_position().direction_to(player_position)
	
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
		
	var movement = vectorDirection * speed
	
	$AnimatedSprite.play()
	
	move_and_slide(movement, Vector2(0,0))

	pass
	
func destroy():
	get_parent().scored()
	self.queue_free()


func _on_Frenzy_timeout():
	level += 1
	if((level%2)==1):
		var increment = 50
		speed += increment
		push += increment
	else:
		var spawner = get_parent().get_node("EnemySpawner")
		spawner.levelUp()
	pass # Replace with function body.
