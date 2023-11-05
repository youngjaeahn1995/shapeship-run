extends Area2D

var tween: Tween;

# Called when the node enters the scene tree for the first time.
func _ready():
	start_tween()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!$CollisionPolygon2D.disabled && $Sprite2D.modulate.a < 0.95):
		print("Disabled collision")
		$CollisionPolygon2D.disabled = true
	elif ($CollisionPolygon2D.disabled):
		print("Enabled collision")
		$CollisionPolygon2D.disabled = false

func start_tween():
	tween = create_tween()
	tween.set_loops()
	tween.tween_property($Sprite2D, "modulate", Color(1, 1, 1, 1), 1)
	tween.tween_property($Sprite2D, "modulate", Color(1, 1, 1, 0), 1)
