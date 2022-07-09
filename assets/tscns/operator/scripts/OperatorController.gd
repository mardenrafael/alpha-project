class_name Operator extends KinematicBody2D


var _isSelected : bool = false
var _points : PoolVector2Array = [position]


func _ready() -> void:
	set_process_input(false)
	set_process(false)


func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("left_click"):
		
		_points.append(get_local_mouse_position())


func _process(delta: float) -> void:
	
	_draw_line(_points)


func _draw_line(points : PoolVector2Array) -> void:
	
	var _line : Line2D = Line2D.new()
	
	_line.set_points(points)
	
	_line.begin_cap_mode = Line2D.LINE_CAP_ROUND
	_line.end_cap_mode   = Line2D.LINE_CAP_ROUND
	_line.joint_mode     = Line2D.LINE_JOINT_ROUND
	
	add_child(_line)


func _on_Operator_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	
	if _isSelected == false and event.is_action_pressed("left_click"):
		_isSelected = true
		set_process_input(true)
		set_process(true)
	
	if _isSelected == true and event.is_action_pressed("right_click"):
		_isSelected = false
		set_process_input(false)
		set_process(false)
