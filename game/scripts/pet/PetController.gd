extends Node3D
class_name PetController

# Placeholder "Henry". Reactions are gentle and never punishing:
# happy = warm bounce, thinking = soft curious wobble. No red / failure cues.

const COLOR_CALM := Color(0.62, 0.74, 1.0)
const COLOR_HAPPY := Color(0.55, 0.88, 0.55)
const COLOR_THINKING := Color(1.0, 0.85, 0.55)

@onready var _mesh: MeshInstance3D = $Mesh

var _base_scale: Vector3 = Vector3.ONE
var _tween: Tween

func _ready() -> void:
    _base_scale = scale
    set_idle_state()

func set_idle_state() -> void:
    _kill_tween()
    scale = _base_scale
    rotation.z = 0.0
    _set_color(COLOR_CALM)

func play_happy() -> void:
    _kill_tween()
    _set_color(COLOR_HAPPY)
    _tween = create_tween()
    _tween.tween_property(self, "scale", _base_scale * 1.25, 0.12) \
        .set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
    _tween.tween_property(self, "scale", _base_scale, 0.18) \
        .set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
    _tween.tween_callback(set_idle_state)

func play_thinking() -> void:
    _kill_tween()
    _set_color(COLOR_THINKING)
    _tween = create_tween()
    _tween.tween_property(self, "rotation:z", deg_to_rad(8.0), 0.18)
    _tween.tween_property(self, "rotation:z", deg_to_rad(-8.0), 0.3)
    _tween.tween_property(self, "rotation:z", 0.0, 0.18)
    _tween.tween_callback(set_idle_state)

func _set_color(c: Color) -> void:
    if _mesh and _mesh.material_override is StandardMaterial3D:
        (_mesh.material_override as StandardMaterial3D).albedo_color = c

func _kill_tween() -> void:
    if _tween and _tween.is_valid():
        _tween.kill()
