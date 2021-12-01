extends Sprite

func _ready():

	pass

func _process(delta):
	self.position = get_global_mouse_position() # Changing Position
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN) # Hidding Mouse
	pass
