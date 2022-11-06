extends CharacterBody2D


const SPEED = 250.0

@onready var  ammo = preload("res://sence/Friend_ammo.tscn")


func _physics_process(delta):
	position.y = 506
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		spawn_ammo()

func spawn_ammo():
	$AudioStreamPlayer2D.play()
	var ammo_instance = ammo.instantiate()
	get_parent().get_parent().add_child(ammo_instance)
	ammo_instance.position = $Marker2D.global_position

func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.stop()
