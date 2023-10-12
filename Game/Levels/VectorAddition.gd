extends Node

@onready var graph = $VectorGraph

var vector_1 : Vector2
var vector_2 : Vector2

var x_min : int = 1
var x_max : int = 7
var y_min : int = 1
var y_max : int = 4

func _ready():
	compute_vectors()

var x_component : int
var y_component : int

func compute_vectors():
	vector_1 = vector_setting()
	
	var end = false
	while !end:
		vector_2 = vector_setting()
		
		if vector_1 != vector_2:
			end = true
	
	graph.receive_question(vector_1, vector_2)

func vector_setting():
	var vector : Vector2
	x_component = random_number_generator(x_min, x_max)
	y_component = random_number_generator(y_min, y_max)
	vector = Vector2(x_component, y_component)
	return vector

func random_number_generator(_min, _max):
	var rng = RandomNumberGenerator.new()
	var new_random_number = rng.randf_range(_min, _max)
	return new_random_number

func check_vector_parallel(vec1 : Vector2, vec2 : Vector2):
	if int(vec1.x) % int(vec2.x) == 0 or int(vec2.x) % int(vec1.x) == 0:
		if int(vec1.y) % int(vec2.y) == 0 or int(vec2.y) % int(vec1.y) == 0:
			return true
	else:
		return false
