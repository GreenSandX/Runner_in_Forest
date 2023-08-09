extends Node
class_name Component

# 启用组件
func enable() -> void: self.set_pause_mode(PAUSE_MODE_INHERIT)

# 禁用组件
func disable() -> void: self.set_pause_mode(PAUSE_MODE_STOP)

# 返回组件名称
func get_name() -> String: return self.name

# 触发事件（超过一个参数需要用数组）
func emit(event, args = []):
	CompMgr.event_trigger(event, self.owner, args)

# 连接方法到事件
func method_link_to(method: String, event):
	CompMgr.register_action_to(method,event,self)

# 更新状态（如果拥有 StateComp 兄弟节点的话）
func updata_MOVE_state(state) -> void: emit(Event.ask_MOVE_updata_S,state)
func add_BUFF_state(state) -> void: emit(Event.ask_BUFF_add_S,state)
func remove_BUFF_state(state) -> void: emit(Event.ask_BUFF_remove_S,state)
