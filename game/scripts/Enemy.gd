extends Node

var hp = 0
var attack
#var parser
var manager 
const parser = preload("res://scripts/Parser.gd")

func _init():
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	print(parser)
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func setManager(man):
	manager = man
	pass
	
func changeHp(num: int):
	hp += num
	
	if (hp <= 0):
		get_tree().change_scene("res://scenes/Map.tscn")
	
	pass
	
func getAttack():
	return attack
	
func takeTurn(text):
	text.add_text("\nSlime attacks!")
	manager.changePlayerHp(-attack)

func getHp():
	return hp
	
func loadFromFile(file_name):
	var file = File.new()
	file.open(file_name, File.READ)
	var temp = parser.parse(file)
	attack = int(temp.get("ATTACK"))
	hp = int(temp.get("HEALTH"))
	pass