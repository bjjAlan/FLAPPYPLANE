extends RigidBody2D


var speed: float = 10


func _physics_process(_delta):
	$AnimatedSprite2D.play("default")
	apply_central_impulse(Vector2(-mass * speed, 0))
	
	if position.x < -32:
		queue_free()
	
	
	
	
	
	
	
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("Enemy"):
		$AnimatedSprite2D.play("Death")
	
	
	
	
	pass 
