class_name Key extends Node2D

var direction: Vector2 = Vector2.ZERO
var start: Vector2
var speed: int

func _ready() -> void:
	speed = randi_range(1,4)

func _process(delta: float) -> void:
	self.position += direction * speed
	if abs(self.position.x - start.x) > 1500 or abs(self.position.y - start.y) > 1500:
		self.free()

func set_key_position(pos: Vector2) -> void:
	self.position = pos
	start = pos
