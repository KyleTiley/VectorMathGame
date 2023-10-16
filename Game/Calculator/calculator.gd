extends Node2D

@onready var speech_bubble = $SpeechBubble
@onready var animation_player = $AnimationPlayer

enum CalculatorState{
	IDLE,
	SPEAKING,
	CELEBRATING,
}

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 2:
		change_state(CalculatorState.IDLE)

var current_state : CalculatorState

func change_state(state : CalculatorState):
	match state:
		CalculatorState.IDLE:
			animation_player.play("idle")
			send_dialogue("HELLO")
		CalculatorState.SPEAKING:
			pass
		CalculatorState.CELEBRATING:
			animation_player.play("celebrate")
			send_dialogue("WELL DONE!")
			speech_bubble.show()

func send_dialogue(dialogue_text : String):
	speech_bubble.change_text(dialogue_text)

func custom_speech(_string : String):
	change_state(CalculatorState.IDLE)
	send_dialogue(_string)

func _on_button_reset_mouse_entered():
	custom_speech("RESET SUM?")
	speech_bubble.show()

func _on_button_reset_mouse_exited():
	speech_bubble.hide()
