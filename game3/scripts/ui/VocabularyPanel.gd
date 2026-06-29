extends Control
class_name VocabularyPanel

# Recognition-stage activity surface: prompt plus large touch choices.

signal answer_selected(index)

onready var _prompt: Label = $Card/Layout/PromptLabel
onready var _feedback: Label = $Card/Layout/FeedbackLabel
onready var _progress: Label = $Card/Layout/ProgressLabel
onready var _options: VBoxContainer = $Card/Layout/Options

var _buttons = []
var _locked = false

func _ready() -> void:
    for child in _options.get_children():
        if child is Button:
            _buttons.append(child)

    for i in range(_buttons.size()):
        _buttons[i].connect("pressed", self, "_on_button_pressed", [i])

func set_question(prompt_text: String, options: PoolStringArray) -> void:
    _locked = false
    _feedback.text = ""
    _prompt.text = prompt_text

    for i in range(_buttons.size()):
        var has_option = i < options.size()
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
    _feedback.text = "Hmm, let's try again."

func set_progress(happiness: int, known_words_count: int) -> void:
    _progress.text = "Henry happiness: %d  |  Words learned: %d" % [happiness, known_words_count]

func _on_button_pressed(index: int) -> void:
    if _locked:
        return
    emit_signal("answer_selected", index)
