extends Node2D

@export var key : PackedScene

var new_key
var direction: Vector2 = Vector2.ZERO
var offset: int = 3

var above_origin: Vector2
var below_origin: Vector2
var left_origin: Vector2
var right_origin: Vector2

func _ready() -> void:
	@warning_ignore("integer_division")
	above_origin = Vector2(get_window().size.x / 2, -30)
	@warning_ignore("integer_division")
	below_origin = Vector2(get_window().size.x / 2, get_window().size.y)
	@warning_ignore("integer_division")
	left_origin = Vector2(0, get_window().size.y / 2)
	@warning_ignore("integer_division")
	right_origin = Vector2(get_window().size.x, get_window().size.y / 2)
	get_viewport()
	
	get_window()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("key_test_down"):
		new_key = key.instantiate()
		if new_key is Key:
			new_key.direction = Vector2(0,1)
			new_key.set_key_position(above_origin + Vector2(20 * randi_range(-offset, offset),0))
		self.add_child(new_key)
	if Input.is_action_just_pressed("key_test_up"):
		new_key = key.instantiate()
		if new_key is Key:
			new_key.direction = Vector2(0,-1)
			new_key.set_key_position(below_origin + Vector2(20 * randi_range(-offset, offset),0))
		self.add_child(new_key)
	if Input.is_action_just_pressed("key_test_left"):
		new_key = key.instantiate()
		if new_key is Key:
			new_key.direction = Vector2(-1,0)
			new_key.set_key_position(right_origin + Vector2(0,20 * randi_range(-offset, offset)))
		self.add_child(new_key)
	if Input.is_action_just_pressed("key_test_right"):
		new_key = key.instantiate()
		if new_key is Key:
			new_key.direction = Vector2(1,0)
			new_key.set_key_position(left_origin + Vector2(0,20 * randi_range(-offset, offset)))
		self.add_child(new_key)
