extends Node

var WEIGHT_CAP = 10
var HP_CAP = 20
var hp
var held_weight

var regen
var poison 
var armor

var other
var manager
const parser = preload("res://scripts/Parser.gd")

func _init():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func use_item(item_name):
	# determine if you're targeting yourself or another 
	# if item_name:
	if other == null:
		pass

func setManager(man):
	manager = man
	pass

func changeHp(num):
	if num < 0:
		num += armor
		min (num, 0)
	hp += num
	pass;

func loadFromFile(file_name):
	var file = File.new()
	file.open(file_name, File.READ)
	var temp = parser.parse(file)
	hp = temp.get("HEALTH")
	print("Player hp: " + hp)
	pass

#func applyEffects():
#	pass