extends RichTextLabel
var player
var enemy

func _ready():
	var Player = load("./Enemy.gd")
	var Enemy = load("./Player.gd")
	player = Player.new()
	enemy = Enemy.new()
	player.setManager(self)
	enemy.setManager(self)
	
	pass

func changeEnemyHp(num):
	enemy.changeHp(num)
	pass
	
func changePlayerHp(num):
	player.changeHp(num)
	pass
	
func display_text(new_text):
	self.add_text("\n" + new_text)
	pass


# signal connection for to read from InputBox
func _on_InputBox_text_entered(new_text):
	self.add_text("\n" + new_text)
	pass # Replace with function body.