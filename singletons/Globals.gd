extends Node

var score := 0
var coins := 0
var life := 4


func _ready():
	pass
	
	
	
	
func _process(delta):
	
	Death()
	
	pass
	
func Death():
	
	if life <= 0:
		get_tree().change_scene_to_file("res://menu.tscn")
	
	pass
