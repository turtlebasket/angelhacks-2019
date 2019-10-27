extends RichTextLabel
var player
var enemy
const Player = preload("res://scripts/Player.gd")
const Enemy = preload("res://scripts/Enemy.gd")
const parser = preload("res://scripts/Parser.gd")

func _ready():
	OS.execute("cd ./PlayerHome", [], true, [])
	player = Player.new()
	enemy = Enemy.new()
	player.setManager(self)
	enemy.setManager(self)
	player.loadFromFile("res://PlayerHome/me.txt")
	print("loaded Player")
	enemy.loadFromFile("res://assets/bug.txt")
	print("loaded enemy")
	pass

func changeEnemyHp(num):
	self.add_text("\n" + "You used Sword!")
	self.add_text("\n" + "Sinister Slime took " + str(num) + " damage")
	enemy.changeHp(-int(num))
	pass
	
func changePlayerHp(num):
	if (int(num) > 0):
		self.add_text("\n" + "You healed " + str(num) + " health!")
	elif (int(num) < 0):
		self.add_text("\n" + "You were damaged " + str(num) + " health...")
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
		
	self.add_text("\n>> " + cmd)
		
	if cmd_bin in ["ls", "cd", "pwd"]:
		var out = []
		OS.execute(cmd, args, true, out)
		print(out)
		for line in out:
			self.add_text("\n" + line)
	
	elif cmd_bin == "cp":
		self.add_text("\nUnfortunately, the Law of Conservation of Mass prevents such actions.")
	
	# custom commands
	
	elif cmd_full[0] == "use":
#		if (cmd_full[1] != "potion.txt" or cmd_full[1] != "sword.txt"):
#			return
			
		print("use")
		var object = cmd_full[1]
		var objectFile = File.new()
		var workingdir = []
		OS.execute("pwd", [], true, workingdir)
		print("boutta make fullphat")
		var fullpath = str(workingdir[0]).trim_suffix("\n") + "/" + object
		print(fullpath)
		objectFile.open(fullpath, File.READ)
		print("*******"+workingdir[0])
		var objectProps = parser.parse(objectFile)
		print(objectProps)
		if objectProps.get("ATTACK") != null:
			changeEnemyHp(objectProps.get("ATTACK"))
		if objectProps.get("HEALTH") != null:
			changePlayerHp(objectProps.get("HEALTH"))
	self.add_text("\nPlayer HP: " + str(player.getHp()))
	self.add_text("\nEnemy HP: " + str(enemy.getHp()))
	
	enemy.takeTurn(self)
	self.add_text("\n")
	
	pass
		
		
