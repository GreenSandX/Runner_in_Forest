extends KinematicBody2D
class_name Entity
"""
	该类兼具有组件容器和组件管理功能（暂定）
	!!!
	!!!这个类中的方法仍在调试中，请勿调用
	!!!
"""

var comp_list := []

func _ready() -> void:
	# 建立一个组件列表，方便查找
	for child in get_children():
		if child is Component: add_comp(child.get_class())


# 增加组件（通常不需要手动调用该方法）
func add_comp(name: String) -> void:
	comp_list.append(name) 


# 获取组件或其子类
func get_comp(name: String):
	if comp_list.has(name): return get_node(name)
	else:
		for subclass in ClassDB.get_inheriters_from_class(name):
			if comp_list.has(subclass): return get_node(subclass)
