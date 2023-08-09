extends Component
class_name StateComp
"""
	限定了只管理在STATE枚举中的状态
	需要其他状态请跟该类的管理员说
"""
var move_state_index := 0
var move_state_list := []
var buff_state_list := []

func _ready() -> void:
	method_link_to("updata_MOVE_state", Event.ask_MOVE_updata_S)
	method_link_to("add_BUFF_state", Event.ask_BUFF_add_S)
	method_link_to("remove_BUFF_state", Event.ask_BUFF_remove_S)
	
# 更新 MOVE 状态索引（用于单选状态）
func updata_MOVE_state(state) -> void:
	match move_state_list.find(state):
		# 没有找到
		-1: 
			move_state_list.append(state)
			move_state_index = move_state_list.size() -1
			emit(Event.on_MOVE_updata_S, state)
		# 找到了而且已经是当前状态了
		move_state_index: return
		# 找到了但不是当前状态
		var other_index:
			move_state_index = other_index
			emit(Event.on_MOVE_updata_S, state)

# 增加 BUFF 状态
func add_BUFF_state(new_buff) -> void:
	if buff_state_list.has(new_buff): return
	else:
		buff_state_list.append(new_buff)
		emit(Event.on_BUFF_add_S, new_buff)

# 移除 BUFF 状态
func remove_BUFF_state(_buff) -> void:
	if buff_state_list.has(_buff):
		buff_state_list.erase(_buff)
		emit(Event.on_BUFF_remove_S, _buff)
	else: return

