extends Node2D

@onready var speech_bubble = $SpeechBubble
@onready var animation_player = $AnimationPlayer

enum CalculatorState{
	IDLE,
	SPEAKING,
	CELEBRATING,
	WRONG
}

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 2:
		change_state(CalculatorState.IDLE)

var current_state : CalculatorState

func change_state(state : CalculatorState):
	match state:
		CalculatorState.IDLE:
			animation_player.play("idle")
		CalculatorState.SPEAKING:
			pass
		CalculatorState.CELEBRATING:
			animation_player.play("celebrate")
			send_dialogue("WELL DONE!")
			speech_bubble.show()
		CalculatorState.WRONG:
			animation_player.play("wrong_answer")
			

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

func _on_button_new_mouse_entered():
	custom_speech("NEW SUM?")
	speech_bubble.show()

func _on_button_new_mouse_exited():
	speech_bubble.hide()

func _on_button_home_mouse_entered():
	custom_speech("MAIN MENU?")
	speech_bubble.show()

func _on_button_home_mouse_exited():
	speech_bubble.hide()

func _on_animation_player_animation_finished(wrong_answer):
	change_state(CalculatorState.IDLE)
	speech_bubble.hide()
