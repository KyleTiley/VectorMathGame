extends Sprite2D

func _ready():
	# connects all children signals
	for child in self.get_children():
		child.SendPointInfo.connect(receive_point_info)
	
	# empties line
	vector_line.clear_points()

func receive_point_info(_name, _position):
	print(str(_name) + " at " + str(_position))
	create_vector_line()

# LINE CODE
@onready var vector_line : Line2D = $"../VectorLine"

func create_vector_line():
	pass
