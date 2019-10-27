extends RichTextLabel
var player
var enemy
const Player = preload("res://scripts/Enemy.gd")
const Enemy = preload("res://scripts/Player.gd")

func _ready():
	OS.execute("cd ./PlayerHome", [], true, [])
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

func _on_InputBox_text_entered(cmd):
	print(cmd)
	var cmd_full = cmd.split(" ", true, 0)
	var cmd_bin = cmd_full[0]
	var args = []
	var i = 1
	while i < len(cmd_full):
		args.append(cmd[i])
		i += 1
		
	if cmd_bin in ["ls", "cd", "pwd"]:
		var out = []
		OS.execute(cmd, args, true, out)
		print(out)
		for line in out:
			self.add_text("\n" + line)
	
	elif cmd_bin == "cp":
		self.add_text("\nUnfortunately, the Law of Conservation of Mass prevents such actions.")
	
	# custom commands
	
	# elif cmd[0] == "use":
