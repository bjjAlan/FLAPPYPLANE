extends RigidBody2D 

@export var bullet_scene: PackedScene
  
var speed: float = 64 * 0.4
var animated_sprite

func _ready():
	animated_sprite = $AnimatedSprite2D

func _physics_process(_delta):
	global_position.x = 159
	animated_sprite.play("")
	
	if global_position.y >= 28:
		if Input.is_action_pressed("ui_up"):
			apply_central_impulse(Vector2(0, -mass * speed))
			animated_sprite.rotation = lerp_angle(animated_sprite.rotation, deg_to_rad(-30), 0.1)
		elif animated_sprite.rotation < 0:
			animated_sprite.rotation = lerp_angle(animated_sprite.rotation, deg_to_rad(0), 0.1)
	else:
		global_position.y = 28
	
	if global_position.y <= get_viewport().size.y - 28:
		if Input.is_action_pressed("ui_down"):
			apply_central_impulse(Vector2(0, mass * speed))
			animated_sprite.rotation = lerp_angle(animated_sprite.rotation, deg_to_rad(30), 0.1)
		elif animated_sprite.rotation > 0:
			animated_sprite.rotation = lerp_angle(animated_sprite.rotation, deg_to_rad(0), 0.1)
	else:
		global_position.y = get_viewport().size.y - 28

	# Atirar projétil com a ação "shoot"
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_scene.instantiate()
		bullet.shooter = self
		bullet.position = self.position + Vector2(64, 0)
		bullet.direction = Vector2(1, 0)
		get_parent().add_child(bullet)


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("Enemy"):
		$AnimatedSprite2D.play("Death")
		$AnimatedSprite2D.scale = Vector2 (0.30, 0.30)
		await get_tree().create_timer(0.7).timeout
		get_tree().reload_current_scene()
		
		
		Globals.life -= 1
		Globals.score = 0
		Globals.coins = 0
		
	pass 
