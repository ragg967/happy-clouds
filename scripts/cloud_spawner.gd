extends Area2D
class_name CloudSpawner

const CLOUD: PackedScene = preload("res://scenes/cloud.tscn")
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var bounds_half_x: float
var bounds_half_y: float


func _ready() -> void:
	var size: Vector2 = collision_shape_2d.shape.get_rect().size
	bounds_half_x = size.x / 2
	bounds_half_y = size.y / 2

	if OS.is_debug_build():
		print("Inital cloud spawned")

	var cloud_instance: Node2D = CLOUD.instantiate()
	add_child(cloud_instance)
	cloud_instance.global_position = Vector2(
		randf_range(-bounds_half_x, bounds_half_x),
		randf_range(-bounds_half_y, bounds_half_y),
	)


func _spawn_cloud() -> void:
	if OS.is_debug_build():
		print("Cloud spawned")

	var cloud_instance: Node2D = CLOUD.instantiate()
	add_child(cloud_instance)
	cloud_instance.global_position = Vector2(
		randf_range(-bounds_half_x, bounds_half_x),
		randf_range(-bounds_half_y, bounds_half_y),
	)
