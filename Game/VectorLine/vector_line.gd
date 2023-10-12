extends Line2D

func create_arrow():
	var start_point = self.get_point_position(0)
	var end_point = self.get_point_position(1)
	
	var diff = end_point - start_point
	print(diff)
	
	var vector_direction = -rad_to_deg(tanh(diff.y / diff.x)) # times negative to make easier to read
	print(vector_direction)
#	var first_point_to_add
#	var second_point_to_add
#
#
#	# cap off triangle
#	self.add_point(first_point_to_add)
#	self.add_point(second_point_to_add)
#	self.add_point(start_point) # to finalise
