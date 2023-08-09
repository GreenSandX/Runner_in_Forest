extends Component
class_name Performer
"""我在这个类中演示了如何获取事件"""

func _ready() -> void:
	method_link_to("on_h_flip", Event.on_velocity_h_flip_b)
	method_link_to("on_MOVE_updata", Event.on_MOVE_updata_S)

func on_h_flip(flip: bool) -> void:
	if flip: $AnimatedSprite.flip_h = true
	else: $AnimatedSprite.flip_h = false

func on_MOVE_updata(state) -> void:
	match state:
		STATE_MOVE.Idle: pass
		STATE_MOVE.Walk: pass
