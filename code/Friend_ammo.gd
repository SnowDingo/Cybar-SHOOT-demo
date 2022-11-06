extends CharacterBody2D

const SPEED = 300.0

func _ready():
	show()
	velocity = Vector2(0,-1)


func _physics_process(delta):
	var collision = move_and_collide(velocity.normalized() * delta * SPEED)
	

func _on_area_2d_body_entered(body):
	queue_free()


func _on_area_2d_area_entered(area):
	queue_free()
