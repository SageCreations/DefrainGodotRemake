extends Node2D


var horizontal = 0
var vertical = 0

export(int) var move_speed = 300

var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	 screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)
	
	if (Input.is_action_pressed("shoot")):
		shoot()




func move(delta):
	if (Input.is_action_pressed("move_up")):
		vertical = -1
	elif (Input.is_action_pressed("move_down")):
		vertical = 1
	else:
		vertical = 0
	
	if (Input.is_action_pressed("move_left")):
		horizontal = -1
	elif (Input.is_action_pressed("move_right")):
		horizontal = 1
	else:
		horizontal = 0
		
	position += Vector2(horizontal, vertical) * move_speed * delta
	position.x = clamp(position.x, 20, screen_size.x-20)
	position.y = clamp(position.y, 20, screen_size.y-20)


func shoot():
	pass # do shoot stuff
