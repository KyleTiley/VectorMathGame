extends Control

@onready var main_menu = $MainMenu
@onready var game_level = $"../Levels/VectorAddition"

var lerp_menu = false
var lerp_game = false

var lerp_speed = 5
var bottom_pos = Vector2(0, 360)

func _ready():
	main_menu.position = Vector2.ZERO
	game_level.position.x = 640

func _physics_process(delta):
	if lerp_menu:
		move_menu_out(delta)
	if lerp_game:
		move_game_in(delta)
		move_menu_out(delta)

func move_menu_out(_delta):
	main_menu.position = main_menu.position.lerp(bottom_pos, _delta * lerp_speed)

func move_game_in(_delta):
	game_level.position = game_level.position.lerp(Vector2.ZERO, _delta * lerp_speed)

func _on_button_addition_pressed():
	lerp_game = true

func _on_button_subtraction_pressed():
	pass # Replace with function body.
