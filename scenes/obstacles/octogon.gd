extends Area2D

var duration = 1.5 : set = set_fade_duration
var tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	start_tween()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start_tween():
	tween = create_tween()
	tween.set_loops()
	tween.tween_callback(func(): $CollisionPolygon2D.disabled = true)
	tween.tween_property($Sprite2D, "modulate", Color(1, 1, 1, 1), duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_callback(func(): $CollisionPolygon2D.disabled = false)
	tween.tween_property($Sprite2D, "modulate", Color(1, 1, 1, 0), 0.5).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN_OUT)

func set_fade_duration(duration):
	duration = duration
