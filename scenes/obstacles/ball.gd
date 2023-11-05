extends RigidBody2D

var ball_height: float : get = get_ball_height
var screen_size: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	ball_height = $Sprite2D.texture.get_height() * $Sprite2D.scale.y
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if position.y - ball_height > screen_size.y:
		queue_free()

func get_ball_height():
	return ball_height
