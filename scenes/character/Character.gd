extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = event.position
		position = mouse_pos

func _on_body_entered(body):
	queue_free()

func _on_area_entered(area):
	queue_free()
