extends StaticBody2D

var sprite: Sprite2D
var collision: CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var screen_size_x = get_viewport().get_size().x
	var collision = $CollisionShape2D
	collision.position.x = screen_size_x / 2
	
	sprite = $Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (sprite and collision):
		collision.shape.size = sprite.texture.get_size() * sprite.scale
