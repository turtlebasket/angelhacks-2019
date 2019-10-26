extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func speaketh(text):
	for x in text:
		print(x)
		yield(get_tree().create_timer(0.1), "timeout")
		
func _ready():
	speaketh("Hello World")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
