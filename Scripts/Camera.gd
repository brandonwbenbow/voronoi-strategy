extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	zoom = _target_zoom * Vector2.ONE
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

const ZOOM_RATE: float = 8.0
const MIN_ZOOM: float = 0.1
const MAX_ZOOM: float = 1.0
const ZOOM_INCREMENT: float = 0.1
var _target_zoom: float = 0.5

const MOVE_RATE: float = 10.0
var _target_position: Vector2 = Vector2.ZERO

func _physics_process(delta):
	zoom = lerp(zoom, _target_zoom * Vector2.ONE, ZOOM_RATE * delta)
	position = lerp(position, _target_position * Vector2.ONE, MOVE_RATE * delta)
	var zoom_done = not is_equal_approx(zoom.x, _target_zoom)
	var move_x_done = not is_equal_approx(position.x, _target_position.x)
	var move_y_done = not is_equal_approx(position.y, _target_position.y)
	set_physics_process(zoom_done or move_x_done or move_y_done)

func get_mouse_offset() -> Vector2:
	var middle = get_viewport_rect().get_center()
	return get_viewport().get_mouse_position() - middle

func zoom_in() -> void:
	var new_zoom = min(_target_zoom + ZOOM_INCREMENT, MAX_ZOOM)
	var changed = _target_zoom != new_zoom
	_target_zoom = new_zoom
#	Keep Mouse In Same Spot on Zoom - This is too exponential
#	if changed:
#		_target_position += get_mouse_offset() * zoom / 2
	set_physics_process(true)
	
func zoom_out() -> void:
	_target_zoom = max(_target_zoom - ZOOM_INCREMENT, MIN_ZOOM)
	set_physics_process(true)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_MASK_LEFT:
			_target_position -= event.relative / zoom
			set_physics_process(true)
	
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom_in()
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom_out()

