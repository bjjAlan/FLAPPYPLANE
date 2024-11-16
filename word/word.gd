extends Node2D
@export var enemy_scene: PackedScene
@export var spawn_offset: float = 64 


func _on_enemy_spawn_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	enemy.position.x = get_viewport().size.x + spawn_offset
	enemy.position.y = randf_range(28, get_viewport().size.y - 28)
	pass 
