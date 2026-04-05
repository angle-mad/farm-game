extends NonPlayableCharacter

@export var egg_scene = preload("res://scenes/objects/egg.tscn")

func _ready() -> void:
	walk_cycles = randi_range(min_walk_cycle, max_walk_cycle)
	
	DayAndNightCycleManager.time_tick.connect(_on_time_tick)

func _on_time_tick(day: int, hour: int, minute: int):
	if randf() < 0.001:
		lay_egg()
		
func lay_egg() -> void:
	var egg = egg_scene.instantiate()
	get_tree().current_scene.add_child(egg)
	egg.global_position = global_position
