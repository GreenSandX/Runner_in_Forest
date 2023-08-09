extends Node
"""
	
"""
var events := []
var actions := []
var logics :={}

# 用于动态注册事件（动态注册的事件不会在编辑器中提示）
func register_event(event: String) -> void:
	pass

# 用于动态注册动作
func register_action(action: String, component: Node, method := "") -> void:
	if method == "" : method = action
	# 动作将作为一个 Action 实例保存在 actions 数组中
	var new_action = Action.new(action, component, method)
	for action in actions:
		if action.name == new_action.name && action.component == new_action.component && action.method == new_action.method:
			return
	actions.append(new_action)


# 注册新的逻辑连线
func register_logic(event, action) -> void:
	# 已有事件对应的逻辑连线
	if logics.has(event):
		# 该事件没有连接到该动作
		if !(logics[event] as Array).has(action):
			(logics[event] as Array).append(action)
		# 该事件已连接到该动作，则忽略
	# 不存在事件对应的逻辑连线，则新建一个键值对（值为 Action 类的实例数组）
	else:
		logics[event] = [action]


# 直接注册连接到指定事件的动作
func register_action_to(action: String, event, component: Node, method := ""):
	register_action(action, component, method)
	register_logic(event, action)


# 事件触发，进行逻辑连线，并执行动作
func event_trigger(event, root, args = []):
	if not is_instance_valid(root): return
	if logics.has(event):
		for action_name in logics[event]:
			# 以下语句已弃用，用于从枚举中获取字符串
			#if action_name is int: action_name = GameAction.keys()[action_name]
			do_action(action_name, root, args)


# 执行动作（具体的执行 call 函数放在了 Action 类中）
func do_action(action_name: String, root: Node, args):
	for action in actions:
		# 找到对应的 Action 实例
		if (action as Action).get_name() == action_name:
			var result = (action as Action).do_action_in(root, args)
			if result != null: return result
