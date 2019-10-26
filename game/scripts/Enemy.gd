extends Node

var HP
var parser

# Called when the node enters the scene tree for the first time.
func _ready():
	parser = load("./ParserTest.gd")
	#var parser = Parser.new()
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func load_from_file(file_name):
	var file = File.new()
	file.open(file_name, File.READ)
	var temp = parser.parse(file)
	pass