extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func InsidePolygon(point: Vector2, polygon: PackedVector2Array):
	return if Geometry2D.is_point_in_polygon(point, polygon)
