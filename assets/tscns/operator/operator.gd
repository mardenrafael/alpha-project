extends KinematicBody2D
class_name Operator


# [X] Capacidade de selecionar o Operator
# [] Mover o Operator para onde for selecionado 
#
#
#
#
#
#

var is_select : bool = false


func _input(event: InputEvent) -> void:
	
	if is_select and event.is_action_pressed("click"):
		
		is_select = false


func _on_operator_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	
	if event.is_action_pressed("click") and not is_select:
		is_select = true
