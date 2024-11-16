extends RigidBody2D 

@export var bullet_scene: PackedScene  # Adiciona esta linha para declarar a cena do projétil
var speed: float = 64 * 0.4
var animated_sprite
var coins = 0    

func _ready():
	animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	global_position.x = 159
	animated_sprite.play("default")
	
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

	# Atirar projétil
	if Input.is_action_just_pressed("shoot"):  # qualquer botão pode ser usado
		var bullet = bullet_scene.instantiate() 
		bullet.shooter = self  # eu atirei
		bullet.position = self.position + Vector2(64, 0)  # posição inicial
		bullet.direction = Vector2(1, 0)  # direção para a direita
		get_parent().add_child(bullet)  # adicionar como filho de Level
		
	# Atirar bomba
	if Input.is_action_just_pressed("bomb"):  # qualquer botão pode ser usado
		var bomb = Bomb_scene.instantiate() 
		bomb.shooter = self  # eu atirei
		bomb.position = self.position + Vector2(64, 0)  # posição inicial
		bomb.direction = Vector2(1, 0)  # direção para a direita
		get_parent().add_child(bomb)
