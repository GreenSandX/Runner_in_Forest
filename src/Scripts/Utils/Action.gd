class_name Action

# ACtion 中的数据都是字符串
var name := ""
var component := ""
var method := ""

func get_name() -> String: return name


func _init(name: String, component: Component, method: String) -> void:
	self.name = name
	self.component = component.get_name()
	self.method = method 


func do_action_in(root: Node, args):
	var node = root.get_node(component)
	if is_instance_valid(node):
		if args is Array:
			match args.size():
				0: node.call(method)
				1: node.call(method, args[0])
				2: node.call(method, args[0], args[1])
				3: node.call(method, args[0], args[1], args[2])
		
		else: node.call(method, args)

