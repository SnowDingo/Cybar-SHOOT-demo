extends ParallaxBackground


func _ready():
	scroll_offset = Vector2(0,0)

func _process(delta):
	scroll_offset += Vector2(0,30)
