extends RigidBody2D

var ball_height: float : get = get_ball_height
var screen_size: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	var ball_sprite = get_node("Sprite2D")
	screen_size = get_viewport_rect().size
	ball_height = ball_sprite.texture.get_height() * ball_sprite.scale.y
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if position.y - ball_height > screen_size.y:
		queue_free()

func get_ball_height():
	return ball_height
