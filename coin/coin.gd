extends Area2D

var speed = 256



func _process(delta):
	$AnimatedSprite2D.play("default") 
	position.x -= speed * delta
	
	if position.x < -32:
		queue_free()


func _on_body_entered(body):
	if "coins" in body: 
		body.coins += 1
		queue_free()
		
	if body.name == "Player":
		Collected()


func Collected():
	
	
	Global.score += 1
	$AnimatedSprite2D.play("Collected")
	$Area2D/CollisionShape2D.queue_free()
	await get_tree().create_timer(0.8).timeout
	queue_free()
	
	
	pass
