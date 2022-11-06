extends Node2D

@onready var  ammo = preload("res://sence/Enemy_ammo.tscn")
@onready var explosion = $Path2D/PathFollow2D/Explosion


func _process(delta):
	#セッターを使ってセット
	explosion.set_emitting(false)
	if $Path2D/PathFollow2D.progress >= 1200.0:
		$Path2D/PathFollow2D.progress = 0.0
	$Path2D/PathFollow2D.progress += 5

func _ready():
	$ShootTimer.start()
	await $ShootTimer.timeout
	shoot()

func shoot():
	$effect.play()
	var ammo_instance = ammo.instantiate()
	get_parent().get_parent().add_child(ammo_instance)
	ammo_instance.position = $Path2D/PathFollow2D/Enemy/Marker2D.global_position



func _on_shoot_timer_timeout():
	$ShootTimer.start()
	await $ShootTimer.timeout
	shoot()
	$ShootTimer.start()



func _on_area_2d_body_entered(body):
	explosion.set_emitting(true)
	var timer = self.get_tree().create_timer(1.5)
  # SceneTreeTimer オブジェクトの timeout シグナルを待つ
	set_process(!is_processing())
	await timer.timeout
	queue_free()
