extends Node

@onready var graph = $Graph

var vector_1 : Vector2
var vector_2 : Vector2

var x_min : int = 1
var x_max : int = 5
var y_min : int = 1
var y_max : int = 11

func _ready():
	compute_vectors()

func compute_vectors():
	var x_component : int
	var y_component : int
	
	x_component = random_number_generator(x_min, x_max)
	y_component = random_number_generator(y_min, y_max)
	vector_1.x = x_component
	vector_1.y = y_component
	
	x_component = random_number_generator(x_min, x_max - x_component)
	y_component = random_number_generator(y_min, y_max - y_component)
	vector_2.x = x_component
	vector_2.y = y_component
	
	graph.receive_question()
	
	print(vector_1)
	print(vector_2)

func random_number_generator(_min, _max):
	var rng = RandomNumberGenerator.new()
	var new_random_number = rng.randf_range(_min, _max)
	return new_random_number
