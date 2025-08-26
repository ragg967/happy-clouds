extends ProgressBar
class_name HappinessBar

var clouds: Array


func _ready() -> void:
	min_value = 0
	max_value = 100


func _process(_delta: float) -> void:
	clouds = get_tree().get_nodes_in_group("clouds")

	if clouds.size() == 0:
		value = 0
		return

	var totalHappiness: float = 0.0
	for cloud: Cloud in clouds:
		totalHappiness += cloud.happiness

	value = totalHappiness / clouds.size()
