extends Sprite2D

func _ready():
	# connects all children signals
	for child in self.get_children():
		child.SendPointInfo.connect(receive_point_info)

func receive_point_info(_name, _position):
	print(str(_name) + " at " + str(_position))
	create_vector_line()

func create_vector_line():
	pass
