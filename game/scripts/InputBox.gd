extends LineEdit

func _ready():
	grab_focus()
	set_process_input(true)
	
func _on_InputBox_text_entered(new_text):
	self.clear()
