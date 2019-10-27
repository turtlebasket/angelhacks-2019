extends "pawn.gd"

onready var Grid = get_parent()

func _ready():
	pass

func _process(delta):
	var direction = null
	if Input.is_action_just_released("move_right"):
		direction = Vector2(1, 0)
	if Input.is_action_just_released("move_left"):
		direction = Vector2(-1, 0)
	if Input.is_action_just_released("move_up"):
		direction = Vector2(0, -1)
	if Input.is_action_just_released("move_down"):
		direction = Vector2(0, 1)
	
	if not direction:
		return

	var target_position = Grid.request_move(self, direction)
	if target_position:
		move_to(target_position)

func move_to(target_position):
	set_process(false) 
	
	var move_direction = (target_position - position).normalized()
	position = target_position
	set_process(true)
