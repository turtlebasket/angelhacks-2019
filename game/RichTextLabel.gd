extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	pass # Replace with function body.

func _on_InputBox_text_entered(input):
	self.add_text("\n" + input)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass