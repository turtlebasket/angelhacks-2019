extends Node

var hp
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
	
func changeHp(num):
	hp += num
	pass
	
func getAttack():
	return attack

func getHp():
	return hp
	
func loadFromFile(file_name):
	var file = File.new()
	file.open(file_name, File.READ)
	var temp = parser.parse(file)
	attack = temp.get("ATTACK")
	hp = temp.get("HEALTH")
	pass