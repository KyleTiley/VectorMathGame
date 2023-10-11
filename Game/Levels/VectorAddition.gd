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

func compute_vectors():
	var x_component : int
	var y_component : int
	
	x_component = random_number_generator(x_min, x_max)
	y_component = random_number_generator(y_min, y_max)
	vector_1.x = x_component
	vector_1.y = y_component
	
	x_component = random_number_generator(x_min, x_max)
	y_component = random_number_generator(y_min, y_max)
	vector_2.x = x_component
	vector_2.y = y_component
	
	graph.receive_question(vector_1, vector_2)

func random_number_generator(_min, _max):
	var rng = RandomNumberGenerator.new()
	var new_random_number = rng.randf_range(_min, _max)
	return new_random_number
