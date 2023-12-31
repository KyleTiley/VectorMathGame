extends Node2D

@onready var calculator = $"../Calculator"
@onready var graph = $VectorGraph
@onready var question_rich_label = $RichTextLabel
@onready var x_answer = $Answer/LineEdit1
@onready var y_answer = $Answer/LineEdit2
var vector_1 : Vector2
var vector_2 : Vector2

var x_min : int = 2
var x_max : int = 7
var x_edge : int = 13
var y_min : int = 2
var y_max : int = 4
var y_edge : int = 7

var compute_addition = false
var next_question = false

# move to function for start button
#func _ready():
#	setup_level()

func setup_level():
	question_rich_label.clear()
	if compute_addition:
		compute_vectors_addition()
	else:
		compute_vectors_subtraction()

var x_component : int
var y_component : int

func compute_vectors_addition():
	vector_1 = vector_setting(x_min, x_max, y_min, y_max)
	var end = false
	while !end:
		vector_2 = vector_setting(x_min, x_max, y_min, y_max)
		if !check_vector_parallel(vector_1, vector_2):
			end = true
	graph.receive_question(vector_1, vector_2)
	question_rich_label.add_text("Vector Addition:" + '\n')
	question_rich_label.add_text("What is vector ")
	question_rich_label.push_color(Global.pink)
	question_rich_label.add_text(str(vector_1))
	question_rich_label.push_color(Global.purple)
	question_rich_label.add_text(" plus vector ")
	question_rich_label.push_color(Global.orange)
	question_rich_label.add_text(str(vector_2))
	question_rich_label.push_color(Global.purple)
	question_rich_label.add_text(" ?")

func compute_vectors_subtraction():
	vector_1 = vector_setting(x_max, x_edge, y_max, y_edge)
	var end = false
	while !end:
		vector_2 = vector_setting(x_min, x_max, y_min, y_max)
		if !check_vector_parallel(vector_1, vector_2):
			end = true
	graph.receive_question(vector_1, vector_2)
	
	question_rich_label.add_text("Vector Subtraction:" + '\n')
	question_rich_label.add_text("What is vector ")
	question_rich_label.push_color(Global.pink)
	question_rich_label.add_text(str(vector_1))
	question_rich_label.push_color(Global.purple)
	question_rich_label.add_text(" minus vector ")
	question_rich_label.push_color(Global.orange)
	question_rich_label.add_text(str(vector_2))
	question_rich_label.push_color(Global.purple)
	question_rich_label.add_text(" ?")

func vector_setting(x1, x2, y1, y2):
	var vector : Vector2
	x_component = random_number_generator(x1, x2)
	y_component = random_number_generator(y1, y2)
	vector = Vector2(x_component, y_component)
	return vector

func random_number_generator(_min, _max):
	var rng = RandomNumberGenerator.new()
	var new_random_number = rng.randf_range(_min, _max)
	return new_random_number

func check_vector_parallel(vec1 : Vector2, vec2 : Vector2):
	var x_ratio = vec1.x / vec2.x
	var y_ratio = vec1.y / vec2.y
	if x_ratio == y_ratio:
		print("FAILED with " + str(vec1) + " and " + str(vec2))
		return true
	else:
		return false

func _on_button_reset_pressed():
	graph.reset_vectors()

func _on_answer_button_pressed():
	if next_question:
		_on_button_new_pressed()
		calculator.speech_bubble.hide()
		next_question = false
		return
	var x : int = 0
	var y : int = 0
	if compute_addition:
		x = vector_1.x + vector_2.x
		y = vector_1.y + vector_2.y
	else:	
		x = vector_1.x - vector_2.x
		y = vector_1.y - vector_2.y
	if int(x_answer.text) == x and int(y_answer.text) == y:
		calculator.change_state(calculator.CalculatorState.CELEBRATING)
		$AnswerButton/Label.text = "Next" + '\n' + "Question"
		next_question = true
	else:
		calculator.speech_bubble.show()
		calculator.change_state(calculator.CalculatorState.WRONG)
		calculator.send_dialogue("TRY AGAIN")

func _on_button_new_pressed():
	calculator.change_state(calculator.CalculatorState.IDLE)
	setup_level()
	x_answer.text = ""
	y_answer.text = ""
	$AnswerButton/Label.text = "Check" + '\n' + "Answer"
	graph.reset_vectors()
