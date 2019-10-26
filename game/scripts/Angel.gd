extends Sprite
onready var Grid = get_parent()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func _input(event):
		
func _process(delta):
	if Input.is_action_just_released("move_right"):
		move(1, 0)
	if Input.is_action_just_released("move_left"):
		move(-1, 0)
	if Input.is_action_just_released("move_up"):
		move(0, 1)
	if Input.is_action_just_released("move_down"):
		move(0, -1)
		
func move(x, y):
	position += Vector2(x*16, -y*16)
	
	
	