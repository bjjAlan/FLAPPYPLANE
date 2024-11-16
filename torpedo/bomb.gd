extends Node2D


var bomb: Node # who is the shooter of this bullet, so we increase its score

var direction: Vector2 # in which direction should bullet move
var speed: float = 1024


func _process(delta):
	position += direction * speed * delta
	
	
func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D and body != bomb:
		body.queue_free()
		if "kills" in bomb:
			bomb.kills += 1
	self.queue_free()
