extends Node

@export var instance_scene: PackedScene
var instance_num = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_instances()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_instances():
	var screen_size = get_viewport().get_size()
	for i in range(instance_num):
		var instance = instance_scene.instantiate()
		var random_x = randf_range(0, screen_size.x)
		
		# instance.position = Vector2(random_x, -instance.get_ball_height())
		instance.position = Vector2(random_x, 10)
		add_child(instance)
