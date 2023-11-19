extends Node

@export var character_scene: PackedScene 

var top_wall: StaticBody2D
var right_wall: StaticBody2D
var bottom_wall: StaticBody2D
var left_wall: StaticBody2D

var left_min: float
var left_max: float

var right_min: float
var right_max: float

var top_min: float
var top_max: float

var bottom_min: float
var bottom_max: float

var point: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	top_wall = $TopWall
	right_wall = $RightWall
	bottom_wall = $BottomWall
	left_wall = $LeftWall
	
	var character: Area2D = character_scene.instantiate()
	var screen_size = get_viewport().get_size()
	
	left_min = left_wall.texture.get_size().x
	left_max = (screen_size.x/2) - character.texture.get_size().x
	
	right_min = (screen_size.x/2) + character.texture.get_size().x
	right_max = screen_size.x - right_wall.texture.get_size().x
	
	top_min = top_wall.texture.get_size().y
	top_max = (screen_size.y/2) - character.texture.get_size().y
	
	bottom_min = (screen_size.y/2) + character.texture.get_size().y
	bottom_max = screen_size.y - bottom_wall.texture.get_size().y
	
	point = Vector2(randf_range(left_min, right_min), randf_range(top_min, bottom_max))
	# Should I make it so it moves in and then moves out or it just moves in a small square all around?

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
