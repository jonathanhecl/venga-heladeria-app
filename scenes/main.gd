extends Node2D

@export var appScene: PackedScene
@export var labelLoading: Label

var loading = 2

func _ready():
	Global.reload_list()
	is_loading()

func is_loading():
	if loading == 0:
		get_tree().change_scene_to_packed(appScene)
		return
	labelLoading.text += "."
	loading -= 1
	get_tree().create_timer(1).timeout.connect(is_loading)
