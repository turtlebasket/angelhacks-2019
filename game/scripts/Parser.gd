extends Control

#func _ready():
#	parse("./example.potion")
#	pass
	
func parse(file):
	var props ={}
	# split each line on ":"
	while !file.eof_reached():
		var line = file.get_line()
		var splitLine
		if (line != ""):
			splitLine = line.split(":", false, 2)
			props[splitLine[0]]=splitLine[1]
	file.close();

	for key in props.keys():
		if key=="HEALTH":
			print(key + ": " + props[key])
		elif key=="DESC":
			print(key + ": " + props[key])
		else:
			print("e: not implemented")
	return props
	