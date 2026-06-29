extends Control
class_name VocabularyPanel

# Recognition-stage activity surface: a spoken/written prompt plus large touch
# choices. Feedback is gentle and lets the player try again on a miss.

signal answer_selected(index: int)

@onready var _prompt: Label = %PromptLabel
@onready var _feedback: Label = %FeedbackLabel
@onready var _options: VBoxContainer = %Options

var _buttons: Array[Button] = []
var _locked: bool = false

func _ready() -> void:
    for child in _options.get_children():
        if child is Button:
            _buttons.append(child)
    for i in _buttons.size():
        _buttons[i].pressed.connect(_on_button_pressed.bind(i))

func set_question(prompt_text: String, options: PackedStringArray) -> void:
    _locked = false
    _feedback.text = ""
    _prompt.text = prompt_text
    for i in _buttons.size():
        var has_option := i < options.size()
        _buttons[i].visible = has_option
        _buttons[i].disabled = false
        if has_option:
            _buttons[i].text = options[i]

func show_correct() -> void:
    _locked = true
    _feedback.text = "Yes! Great job!"
    for b in _buttons:
        b.disabled = true

func show_try_again() -> void:
    # Encouraging, never punishing. Buttons stay active so she can try again.
    _feedback.text = "Hmm, let's try again."

func _on_button_pressed(index: int) -> void:
    if _locked:
        return
    answer_selected.emit(index)
