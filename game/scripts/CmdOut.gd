extends RichTextLabel

func _ready():
	pass

# signal connection for to read from InputBox
func _on_InputBox_text_entered(new_text):
	self.add_text("\n" + new_text)
	pass # Replace with function body.