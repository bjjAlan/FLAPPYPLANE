extends Node2D


var shooter: Node 

var direction: Vector2 
var speed: float = 750


func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		body.queue_free()
		Globals.score += 100
		queue_free()
		
