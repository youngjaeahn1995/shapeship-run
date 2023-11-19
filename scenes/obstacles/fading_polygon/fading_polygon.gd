extends Node

@export var instance_scene: PackedScene
var instance_num: int = 20
var screen_size: Vector2i

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().get_size()
	spawn_instances()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_instances():	
	for i in range(instance_num):
		var instance = instance_scene.instantiate()
		add_child(instance)
		instance.tween_completed.connect(self._tween_completed)

		var random_x = randf_range(0, screen_size.x)
		var random_y = randf_range(0, screen_size.y)
		instance.position = Vector2(random_x, random_y)

func _tween_completed(instance):
	var random_x = randf_range(0, screen_size.x)
	var random_y = randf_range(0, screen_size.y)
	
	instance.position = Vector2(random_x, random_y)
	instance.restart_tween()
