var WEIGHT_CAP = 10
var HP_CAP = 20
var hp
var held_weight
var other
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_other(interactable):
	other = interactable
	return

func use_item(item_name):
	# determine if you're targeting yourself or another 
	# if item_name:
	
	if other == null:
		pass