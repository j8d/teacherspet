extends Node3D

# Bootstrap scene. Loads the playable pet room once the tree is ready.
func _ready() -> void:
    call_deferred("_go_to_pet_room")

func _go_to_pet_room() -> void:
    get_tree().change_scene_to_file("res://scenes/PetRoom.tscn")
