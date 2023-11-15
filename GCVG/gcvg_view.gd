extends Node2D

@export var randSeed: int = randi()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func displayPoints(offset: Vector2, points: PackedVector2Array, color: Color = Color(1,1,1,1)):
	for point in points:
		var newPointPoly = Polygon2D.new();
		newPointPoly.position = point + offset;
		newPointPoly.polygon = PackedVector2Array([Vector2(-2,-2), Vector2(-2,2), Vector2(2,2), Vector2(2,-2)]);
		newPointPoly.color = color;
		add_child(newPointPoly)
	pass

func displayPolygon(offset: Vector2, polygon: PackedVector2Array):
	var area = CollisionPolygon2D.new();
	area.set_script(load("res://Scripts/AreaClick.gd"))
	area.set_process_input(true)
	
	var newPoly = Polygon2D.new();
	var newPolyPoints = PackedVector2Array();
	for point in polygon:
		newPolyPoints.append(point + offset);
	newPoly.polygon = newPolyPoints;
	var randGen = RandomNumberGenerator.new()
	randGen.seed = randSeed;
	newPoly.color = Color(randGen.randf(), randGen.randf(), randGen.randf(), 1);
	randSeed = randGen.randi();
	
	area.add_child(newPoly);
#	newPoly.add_child(area);
	add_child(area);
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
