extends Node

@export var character_scene: PackedScene 
@export var size_inc: float = 0.025

var top_wall: Sprite2D
var right_wall: Sprite2D
var bottom_wall: Sprite2D
var left_wall: Sprite2D
var top_wall_size: Vector2
var right_wall_size: Vector2
var bottom_wall_size: Vector2
var left_wall_size: Vector2

var left_min: float
var left_max: float

var right_min: float
var right_max: float

var top_min: float
var top_max: float

var bottom_min: float
var bottom_max: float

var point: Vector2
var isExpanding: bool
var character_size

# Called when the node enters the scene tree for the first time.
func _ready():
	top_wall = $TopWall/Sprite2D
	right_wall = $RightWall/Sprite2D
	bottom_wall = $BottomWall/Sprite2D
	left_wall = $LeftWall/Sprite2D
	top_wall_size = calculate_size(top_wall)
	right_wall_size = calculate_size(right_wall)
	bottom_wall_size = calculate_size(bottom_wall)
	left_wall_size = calculate_size(left_wall)
	isExpanding = true
	
	var character: Sprite2D = character_scene.instantiate().get_node("Sprite2D")
	character_size = character.texture.get_size() * character.scale
	var screen_size = get_viewport().get_size()
	
	left_min = left_wall_size.x
	left_max = (screen_size.x/2) - character_size.x
	
	right_min = (screen_size.x/2) + character_size.x
	right_max = screen_size.x - right_wall_size.x
	
	top_min = top_wall_size.y
	top_max = (screen_size.y/2) - character_size.y
	
	bottom_min = (screen_size.y/2) + character_size.y
	bottom_max = screen_size.y - bottom_wall_size.y
	
	point = Vector2(randf_range(left_min, right_max), randf_range(top_min, bottom_max))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	var screen_size = get_viewport().get_size()
	var top_wall_size = calculate_size(top_wall)
	var top_wall_end = top_wall.global_position.y + top_wall_size.y / 2
	var right_wall_size = calculate_size(right_wall)
	var right_wall_begin = right_wall.global_position.x + right_wall_size.x / 2
	var bottom_wall_size = calculate_size(bottom_wall)
	var bottom_wall_begin = bottom_wall.global_position.y + bottom_wall_size.y / 2
	var left_wall_size = calculate_size(left_wall)
	var left_wall_end = left_wall.global_position.x + left_wall_size.x / 2
	
	print("top_wall_end: ", top_wall_end)
	print("right_wall_begin: ", right_wall_begin)
	print("bottom_wall_begin: ", bottom_wall_begin)
	print("left_wall_end: ", left_wall_end)
	
	if (isExpanding):
		if (left_wall_end < point.x-character_size.x):
			left_wall.scale.x += size_inc 
		if (right_wall_begin >= point.x+character_size.x):
			right_wall.scale.x -= size_inc
		if (top_wall_end < point.y-character_size.y):
			top_wall.scale.y += size_inc
		if (bottom_wall_begin >= point.y+character_size.y):
			bottom_wall.scale.y -= size_inc
		if (left_wall_end >= point.x-character_size.x && right_wall_begin < point.x+character_size.x && top_wall_end >= point.y-character_size.y && bottom_wall_begin < point.y+character_size.y):
			isExpanding = false
	else:
		if (left_wall_end >= left_min):
			left_wall.scale.x -= size_inc 
		if (right_wall_begin < right_max):
			right_wall.scale.x += size_inc
		if (top_wall_end >= top_min):
			top_wall.scale.y -= size_inc
		if (bottom_wall_begin < bottom_max):
			bottom_wall.scale.y += size_inc
		if (left_wall_end < left_min && right_wall_begin >= right_max && top_wall_end < top_min && bottom_wall_begin >= bottom_max):
			isExpanding = true

func calculate_size(wall: Sprite2D):
	return wall.texture.get_size() * wall.scale
