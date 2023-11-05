extends Node

@export var instance_scene: PackedScene
var instance_num: int = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_instances():
	var screen_size = get_viewport().get_size()
	var instance = instance_scene.instantiate()
	var random_x = randf_range(0, screen_size.x)
	
	instance.position = Vector2(random_x, -instance.get_ball_height())

	add_child(instance)


func _on_timer_timeout():
	spawn_instances() # Replace with function body.
