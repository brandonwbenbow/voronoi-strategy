extends CollisionPolygon2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Not Hitting
func _input_event(viewport, event, shape_idx):
	print("Event: %s", event)
	if event is InputEventMouseButton:
		if event.button_mask == MOUSE_BUTTON_MASK_LEFT:
			print("Clicked: %s", shape_idx)
	pass
