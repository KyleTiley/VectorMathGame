extends Sprite2D

func _ready():
	for child in self.get_children():
		child.SendPointInfo.connect(receive_point_info)

func receive_point_info():
	print("Received")
