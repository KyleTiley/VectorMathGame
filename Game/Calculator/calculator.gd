extends Node2D

@onready var animation_player = $AnimationPlayer

enum CalculatorState{
	IDLE,
	SPEAKING,
	CELEBRATING,
}

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 2:
		change_state(CalculatorState.CELEBRATING)

var current_state : CalculatorState

func change_state(state : CalculatorState):
	match state:
		CalculatorState.IDLE:
			animation_player.play("idle")
		CalculatorState.SPEAKING:
			pass
		CalculatorState.CELEBRATING:
			animation_player.play("celebrate")
			send_dialogue("WELL DONE")

@onready var speech_bubble = $SpeechBubble

func send_dialogue(dialogue_text : String):
	speech_bubble.change_text(dialogue_text)
