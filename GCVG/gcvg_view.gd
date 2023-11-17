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
	var newPoly = Polygon2D.new();
	var newPolyPoints = PackedVector2Array();
	for point in polygon:
		newPolyPoints.append(point + offset);
	newPoly.polygon = newPolyPoints;
	var randGen = RandomNumberGenerator.new()
	randGen.seed = randSeed;
	newPoly.color = Color(randGen.randf(), randGen.randf(), randGen.randf(), 1);
	randSeed = randGen.randi();
	
	var poly = CollisionPolygon2D.new()
	poly.polygon = newPolyPoints
	
#	var area = Area2D.new()
#	var owner_id = create_shape_owner(poly)
#	area.shape_owner_add_shape(owner_id, poly)
#	area.set_pickable(true)
	
#	newPoly.add_child(poly);
	add_child(newPoly);
#	add_child(area);
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
