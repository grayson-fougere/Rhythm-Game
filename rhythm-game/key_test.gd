extends Node2D

@export var key : PackedScene

const SPEED: int = 5

var new_key
var direction: Vector2 = Vector2.ZERO
var offset: int = 100

var above_origin: Vector2 = Vector2(576,-30)
var below_origin: Vector2 = Vector2(576,660)
var left_origin: Vector2 = Vector2(0,324)
var right_origin: Vector2 = Vector2(1200,324)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("key_test_down"):
		new_key = key.instantiate()
		if new_key is Key:
			new_key.direction = Vector2(0,1)
			new_key.set_key_position(above_origin + Vector2(randi_range(-offset, offset),0))
		self.add_child(new_key)
	if Input.is_action_just_pressed("key_test_up"):
		new_key = key.instantiate()
		if new_key is Key:
			new_key.direction = Vector2(0,-1)
			new_key.set_key_position(below_origin + Vector2(randi_range(-offset, offset),0))
		self.add_child(new_key)
	if Input.is_action_just_pressed("key_test_left"):
		new_key = key.instantiate()
		if new_key is Key:
			new_key.direction = Vector2(-1,0)
			new_key.set_key_position(right_origin + Vector2(0,randi_range(-offset, offset)))
		self.add_child(new_key)
	if Input.is_action_just_pressed("key_test_right"):
		new_key = key.instantiate()
		if new_key is Key:
			new_key.direction = Vector2(1,0)
			new_key.set_key_position(left_origin + Vector2(0,randi_range(-offset, offset)))
		self.add_child(new_key)
