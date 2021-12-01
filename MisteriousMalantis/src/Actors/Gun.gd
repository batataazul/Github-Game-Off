class_name Gun
extends Position2D
# Represents a weapon that spawns and shoots bullets.
# The Cooldown timer controls the cooldown duration between shots.


const BULLET_VELOCITY = 3000.0
const Bullet = preload("res://src/Objects/Bullet.tscn")

onready var sound_shoot = $Shoot
onready var timer = $Cooldown


# This method is only called by Player.gd.
func shoot(direction = 1, mouse_position = 0):
	if not timer.is_stopped():
		return false
	var bullet = Bullet.instance()
	bullet.global_position = global_position
	# var bulletAngle = bullet.global_position.angle_to(mouse_position)
	var vectorDirection = bullet.global_position.direction_to(mouse_position)
	# print(vectorDirection[0])
	bullet.linear_velocity = Vector2(vectorDirection[0] * BULLET_VELOCITY, vectorDirection[1] * BULLET_VELOCITY)

	bullet.set_as_toplevel(true)
	add_child(bullet)
	sound_shoot.play()
	return true
