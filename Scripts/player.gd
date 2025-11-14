extends CharacterBody2D

@export
var move_speed: float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_player()
	player_animation()
	
func move_player():
	var move: Vector2 = Input.get_vector("input_left", "input_right", "input_up", "input_down")
	
	velocity = move * move_speed
	
	move_and_slide()
	
func player_animation():
	var player_animation: String =$AnimatedSprite2D.animation
	
	if velocity.x > 0:
		#scale = Vector2(1, 1)
		$AnimatedSprite2D.scale.x = 1
	elif velocity.x < 0:
		#scale = Vector2(-1, 1)
		$AnimatedSprite2D.scale.x = -1
	#elif velocity.y > 0:
		#$AnimatedSprite2D.play("Walk Down")
	#elif velocity.y < 0:
		#$AnimatedSprite2D.play("Walk Up")
	if velocity != Vector2(0, 0):
		$AnimatedSprite2D.play("Walk Right")
	if velocity == Vector2(0, 0):
		$AnimatedSprite2D.play("Idle Down")
