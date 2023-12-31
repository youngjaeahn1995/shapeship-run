extends Node

@export var instance_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_timer_timeout():
	spawn_instances() # Replace with function body.

func spawn_instances():
	var screen_size = get_viewport().get_size()
	var instance = instance_scene.instantiate()
	add_child(instance) # Have to add the instance as a child to call _ready()
	
	var random_x = randf_range(0, screen_size.x)
	instance.position = Vector2(random_x, -instance.get_ball_height())
