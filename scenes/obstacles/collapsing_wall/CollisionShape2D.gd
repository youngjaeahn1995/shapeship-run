extends CollisionShape2D

var sprite: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var screen_size_y = get_viewport().get_size().y
	position.y = screen_size_y / 2
	
	sprite = $"../Sprite2D"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (sprite):
		shape.size = sprite.texture.get_size() * sprite.scale
