extends ColorRect
class_name PetController

# Placeholder Henry for Godot 3 port.

const COLOR_CALM := Color(0.62, 0.74, 1.0)
const COLOR_HAPPY := Color(0.55, 0.88, 0.55)
const COLOR_THINKING := Color(1.0, 0.85, 0.55)

var _base_scale = Vector2.ONE
onready var _tween = Tween.new()

func _ready() -> void:
    add_child(_tween)
    _base_scale = rect_scale
    rect_pivot_offset = rect_size * 0.5
    set_idle_state()

func set_idle_state() -> void:
    _kill_tween()
    rect_scale = _base_scale
    rect_rotation = 0.0
    color = COLOR_CALM

func play_happy() -> void:
    _kill_tween()
    color = COLOR_HAPPY

    var up_scale = _base_scale * Vector2(1.12, 1.12)
    _tween.interpolate_property(self, "rect_scale", _base_scale, up_scale, 0.12, Tween.TRANS_BACK, Tween.EASE_OUT, 0.0)
    _tween.interpolate_property(self, "rect_scale", up_scale, _base_scale, 0.18, Tween.TRANS_BACK, Tween.EASE_IN, 0.12)
    _tween.interpolate_callback(self, 0.34, "set_idle_state")
    _tween.start()

func play_thinking() -> void:
    _kill_tween()
    color = COLOR_THINKING

    _tween.interpolate_property(self, "rect_rotation", 0.0, 8.0, 0.12, Tween.TRANS_SINE, Tween.EASE_OUT, 0.0)
    _tween.interpolate_property(self, "rect_rotation", 8.0, -8.0, 0.24, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.12)
    _tween.interpolate_property(self, "rect_rotation", -8.0, 0.0, 0.12, Tween.TRANS_SINE, Tween.EASE_IN, 0.36)
    _tween.interpolate_callback(self, 0.5, "set_idle_state")
    _tween.start()

func _kill_tween() -> void:
    if _tween.is_active():
        _tween.stop_all()
