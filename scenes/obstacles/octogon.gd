extends StaticBody2D

var tween = get_tree().create_tween()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fade_in(duration):
	tween.interpolate_property($Sprite2D, "modulate:a", modulate.a, 1, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func fade_out(duration):
	tween.interpolate_property($Sprite2D, "modulate:a", modulate.a, 0, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
