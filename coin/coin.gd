extends Area2D

var coins := 1
var speed = 256



func _process(_delta):
	$AnimatedSprite2D.play("default") 
	position.x -= speed * _delta
	
	if position.x < -32:
		queue_free()


func _on_body_entered(body):
	if "coins" in body: 
		body.coins += 1
		queue_free()
		
	if body.name == "Player":
		Collected()


func Collected():
	
	Globals.coins += coins
	
	queue_free()
	
	
	pass
