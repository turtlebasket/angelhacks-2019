var hp
var attack
var parser
var manager
# Called when the node enters the scene tree for the first time.
func _ready():
	parser = load("./Parser.gd")
	#var parser = Parser.new()
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
	
func load_from_file(file_name):
	var file = File.new()
	file.open(file_name, File.READ)
	var temp = parser.parse(file)
	attack = temp["ATTACK"]
	hp = temp["HEALTH"]
	pass