extends Component
class_name PlayerController

var input_direction := Vector2.ZERO
var past_input_direction := Vector2.ZERO

func _input(event: InputEvent) -> void:
	
	# 尽量在未输入方向时不去触发事件
	input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if input_direction == Vector2.ZERO && past_input_direction == Vector2.ZERO:
		pass
	else:emit(Event.on_input_direction_V, input_direction)
	past_input_direction = input_direction
	
	# 其他用户输入事件
	if event.is_action_pressed("ui_accept"):
		emit(Event.on_input_accept)
	# ...... 更多待实现

