extends Node2D
class_name Cloud

@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	animatedSprite2D.play("default")
