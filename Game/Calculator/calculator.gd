extends Node2D

enum CalculatorState{
	IDLE,
	SPEAKING,
	CELEBRATING,
}

var current_state : CalculatorState

func change_state(state : CalculatorState):
	match state:
		CalculatorState.IDLE:
			pass
		CalculatorState.SPEAKING:
			pass
		CalculatorState.CELEBRATING:
			pass
