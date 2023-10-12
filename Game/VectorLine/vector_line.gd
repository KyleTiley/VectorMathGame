extends Line2D

@onready var area = $Area2D
@onready var collision = CollisionShape2D.new()

func create_arrow():
	var start_point = self.get_point_position(0)
	var end_point = self.get_point_position(1)
	
	var diff = end_point - start_point
	print(diff)
	
	# set up collision
	collision.shape = RectangleShape2D.new()
	collision.position = diff/2
	area.add_child(collision)
	collision.rotation = tanh(diff.y / diff.x) # angle a bit off?
	collision.scale.x = (sqrt(pow(diff.x, 2) + pow(diff.y, 2)))/100
	
	var theta = atan2(diff.y, diff.x)
	var rad = deg_to_rad(35)
	var arrow_length = 15
	var x = end_point.x - arrow_length * cos(theta + rad)
	var y = end_point.y - arrow_length * sin(theta + rad)
	var phi = deg_to_rad(-35)
	var x2 = end_point.x - arrow_length * cos(theta + phi)
	var y2 = end_point.y - arrow_length * sin(theta + phi)
	
	var first_point_to_add = Vector2(x, y)
	var second_point_to_add = Vector2(x2, y2)
	
	# cap off triangle
	self.add_point(first_point_to_add)
	self.add_point(second_point_to_add)
	self.add_point(end_point) # to finalise


func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		print(name)
