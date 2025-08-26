extends Node2D
class_name Cloud

signal updateHappiness(newHappiness: float)

@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D
@onready var area2D: Area2D = $Area2D

var happiness: float = 50.0
var mouseLeft: MouseButton = MOUSE_BUTTON_LEFT
var mouseInArea: bool = false
var lastMousePosition: Vector2
var isDragging: bool = false


func _ready() -> void:
	add_to_group("clouds")
	animatedSprite2D.play("default")
	lastMousePosition = get_global_mouse_position()


func _process(_delta: float) -> void:
	var oldHappiness: float = happiness
	happiness -= 0.0005
	happiness = clamp(happiness, 0, 100)

	if mouseInArea and Input.is_mouse_button_pressed(mouseLeft):
		var currentMousePosition: Vector2 = get_global_mouse_position()

		if currentMousePosition != lastMousePosition:
			if not isDragging:
				isDragging = true
			happiness += 0.5

		lastMousePosition = currentMousePosition
	else:
		isDragging = false

	if happiness != oldHappiness:
		updateHappiness.emit(happiness)


func _on_area_2d_mouse_entered() -> void:
	mouseInArea = true
	lastMousePosition = get_global_mouse_position()


func _on_area_2d_mouse_exited() -> void:
	mouseInArea = false
	isDragging = false
