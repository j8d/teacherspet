extends Control

# First playable slice orchestrator for the Godot 3 scaffold.

const VOCAB_PATH = "res://data/vocab_seed.json"
const REACTION_PAUSE = 1.4

const VocabSessionScript = preload("res://scripts/vocab/VocabSession.gd")
const SaveManagerScript = preload("res://scripts/save/SaveManager.gd")
const PetStateScript = preload("res://scripts/pet/PetState.gd")

onready var _pet = $Henry
onready var _panel = $VocabularyPanel

var _session = VocabSessionScript.new()
var _save = SaveManagerScript.new()
var _state = PetStateScript.new()

func _ready() -> void:
    add_child(_save)

    var data = _save.load_json()
    _state.happiness = int(data.get("happiness", 0))
    var stored_known_words = data.get("known_words", [])
    if typeof(stored_known_words) == TYPE_ARRAY:
        var known = PoolStringArray()
        for word_key in stored_known_words:
            known.append(str(word_key))
        _state.known_words = known

    if not _session.load_from_file(VOCAB_PATH):
        push_error("Could not load vocabulary data; pet room cannot start.")
        return

    _panel.connect("answer_selected", self, "_on_answer_selected")
    _show_current()

func _show_current() -> void:
    var q = _session.current()
    if q == null:
        push_error("No vocabulary questions are available.")
        return
    _panel.set_question(q.prompt, q.options)
    _panel.set_progress(_state.happiness, _state.known_words.size())
    _pet.set_idle_state()

func _on_answer_selected(index: int) -> void:
    var q = _session.current()
    if q == null:
        return

    if index == q.answer_index:
        _state.happiness += 1
        if _state.known_words.find(q.key) == -1:
            _state.known_words.append(q.key)
        _save.save_json({
            "happiness": _state.happiness,
            "known_words": _state.known_words
        })
        _panel.show_correct()
        _panel.set_progress(_state.happiness, _state.known_words.size())
        _pet.play_happy()
        yield(get_tree().create_timer(REACTION_PAUSE), "timeout")
        _session.advance()
        _show_current()
    else:
        _panel.show_try_again()
        _pet.play_thinking()
