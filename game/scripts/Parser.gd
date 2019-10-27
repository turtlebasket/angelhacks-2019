extends Node 
func _init():
	pass
static func parse(file):
	var props = {}
	# split each line on ":"
	var line
	var splitLine
	while !file.eof_reached():
		line = file.get_line()
		if (line != ""):
			splitLine = line.split(": ", false, 2)
			props[splitLine[0]]=splitLine[1]
	print(props)
	file.close();
	return props
	