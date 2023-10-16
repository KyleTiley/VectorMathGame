extends Node2D

@onready var middle_button = $Middle
@onready var middle_button_target = $Middle/target
@onready var right_bubble = $Right
@onready var label = $Label

var middle_bubble_scale_default = 2
var label_size_default = 54
var ratio_difference = 16
var speech_text : String

func _ready():
	label.text = "WELCOME!"

func _process(_delta):
	ChangeSpeechBubbleSize()
	right_bubble.global_position = middle_button_target.global_position

func change_text(new_text : String):
	label.text = new_text

func ChangeSpeechBubbleSize():
	if label.size.x > label_size_default:
		var new_size_diff = label.size.x - label_size_default
		var ratio = new_size_diff / ratio_difference
		var new_scale = middle_bubble_scale_default + ratio
		middle_button.scale.x = new_scale
	else:
		middle_button.scale.x = 2
