class_name Event

enum{
	# PlayerController
	on_input_direction_V, # 输入了方向向量[V=输入的方向向量，已单位化]
	on_input_melee_atk,   # 按下了近战攻击
	on_input_jump,        # 按下了跳跃
	on_input_range_atk,   # 按下了远程攻击
	on_input_special_atk, # 按下了特殊攻击
	on_input_interact,    # 按下了交互键
	
	on_input_exit,        # 按下了退出
	on_input_accept,      # 按下了确认
	on_input_num_1,       # 按下了数字1
	on_input_num_2,       # 按下了数字2
	on_input_num_3,       # 按下了数字3
	on_input_num_4,       # 按下了数字4
	on_input_num_5,       # 按下了数字5
	on_input_num_6,       # 按下了数字6
	on_input_num_7,       # 按下了数字7
	on_input_num_8,       # 按下了数字8
	on_input_num_9,       # 按下了数字9
	
	# MoveComp emit
	on_velocity_h_flip_b, # 速度在水平翻转了，[b=目前为x正方向？]
	on_velocity_v_flip_b, # 速度在竖直翻转了，[b=目前为y正方向？]
	on_speed_updata_i,    # 基础速度更新为了[i=新的速度值]（不推荐）
	
	# MoveComp accept
	ask_speed_updata_i,   # 请求更新基础移动速度为[i=期望的速度值]（不推荐）
	ask_speed_default,    # 请求恢复基础移动速度（不推荐）
	
	# StateComp emit
	on_MOVE_updata_S,     # 移动状态更新为[S=STATE_MOVE枚举]
	on_BUFF_add_S,        # Buff状态增加了[S=STATE_BUFF枚举]
	on_BUFF_remove_S,     # Buff状态移除了[S=STATE_BUFF枚举]
	on_state_updata_S_S   # 状态更新了（不推荐）
	# StateComp accept
	ask_state_updata_S_S, # 请求状态更新（不推荐）
	ask_state_add_S_S     # 请求状态增加（不推荐）
	ask_state_remove_S_S, # 请求状态移除（不推荐）
	ask_MOVE_updata_S,    # 请求移动状态更新为指定[S=STATE_MOVE枚举]
	ask_BUFF_add_S,       # 请求增加指定Buff状态[S=STATE_BUFF枚举]
	ask_BUFF_remove_S,    # 请求移除指定Buff状态[S=STATE_BUFF枚举]
	
}
