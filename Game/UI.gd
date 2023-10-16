extends Control

@onready var main_menu = $MainMenu
@onready var game_level = $"../VectorAddition"

var lerp_menu = false
var lerp_game = false

var lerp_speed = 5
var bottom_pos = Vector2(0, 360)
var right_pos = Vector2(640, 0)

func _ready():
	main_menu.position = Vector2.ZERO
	game_level.position = right_pos

func _physics_process(delta):
	if lerp_menu:
		move_game_out(delta)
		move_menu_in(delta)
	if lerp_game:
		move_game_in(delta)
		move_menu_out(delta)

func move_menu_out(_delta):
	main_menu.global_position = main_menu.global_position.lerp(bottom_pos, _delta * lerp_speed)

func move_game_in(_delta):
	game_level.global_position = game_level.global_position.lerp(Vector2.ZERO, _delta * lerp_speed)

func move_game_out(_delta):
	game_level.global_position = game_level.position.lerp(right_pos, _delta * lerp_speed)
	
func move_menu_in(_delta):
	main_menu.global_position = main_menu.global_position.lerp(Vector2.ZERO, _delta * lerp_speed)

func _on_button_addition_pressed():
	game_level.compute_addition = true
	game_level.setup_level()
	lerp_game = true

func _on_button_subtraction_pressed():
	game_level.compute_addition = false
	game_level.setup_level()
	lerp_game = true

func _on_button_home_pressed():
	lerp_menu = true
	lerp_game = false
