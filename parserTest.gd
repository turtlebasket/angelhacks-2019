func _ready():
	return

func parse(fileName):
	var file = File.new()
	file.open(fileName, file.READ)
	var props = Dictionary.new()
	//split each line on :
	while !file.eof_reached():
		var splitLine = file.get_line().split(":", False)
		props[splitLine[0]]=splitLine[1]
	file.close();

	for key in keys:
		if key=="HEALTH":
			print(key + ": " + props[key])
		elif key=="DESC":
			print(key + ": " + props[key])
		else:
			print("e: not implemented")
	return null

