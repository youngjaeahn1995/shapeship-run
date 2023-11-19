extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var sprite = $Sprite2D
	var screen_size = get_viewport().get_size()
	var scale_ratio = screen_size.y / sprite.texture.get_size().y
	sprite.scale = Vector2(sprite.scale.x, scale_ratio)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
