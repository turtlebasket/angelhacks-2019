extends RichTextLabel
var player
var enemy
const Player = preload("res://scripts/Enemy.gd")
const Enemy = preload("res://scripts/Player.gd")

func _ready():
	player = Player.new()
	enemy = Enemy.new()
	player.setManager(self)
	enemy.setManager(self)
	player.loadFromFile("res://PlayerHome/me.txt")
	print("loaded Player")
	enemy.loadFromFile("res://assets/bug.txt")
	print("loaded Player")
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