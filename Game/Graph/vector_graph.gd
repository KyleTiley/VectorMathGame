extends Node2D

@onready var vector1_line = $Vector1
@onready var vector2_line = $Vector2

var x_spacing = 16 * 2 # doubled as we double the rez
var y_spacing = -16 * 2

func receive_question(_vector_1 : Vector2, _vector_2 : Vector2):
#	print(_vector_1)
	create_question_line(vector1_line, _vector_1)
#	print(_vector_2)
	create_question_line(vector2_line, _vector_2)

func create_question_line(line : Line2D, vector: Vector2):
	line.clear_points()
	line.add_point(Vector2.ZERO)
	var x = vector.x * x_spacing
	var y = vector.y * y_spacing
	var line_end = Vector2(x, y)
	line.add_point(line_end)
	line.create_arrow()
