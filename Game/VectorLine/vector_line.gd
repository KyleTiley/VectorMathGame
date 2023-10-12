extends Line2D

@onready var collision = CollisionShape2D.new()

func create_arrow():
	var start_point = self.get_point_position(0)
	var end_point = self.get_point_position(1)
	
	# set up collision
	collision.shape = SegmentShape2D.new()
	collision.shape.a = start_point
	collision.shape.b = end_point
	$Area2D.add_child(collision)
	
	var diff = end_point - start_point
	print(diff)
	
	
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
