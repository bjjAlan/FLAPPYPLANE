extends Node

var score := 0
var coins := 0
var life := 3


func _ready():
	pass
	
	
	
	
func _process(_delta):
	
	Death()
	
	pass
	
func Death():
	
	if life <= 0:
		get_tree().change_scene_to_file("res://menu.tscn")
	
	pass
