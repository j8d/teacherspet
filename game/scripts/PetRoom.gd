extends Node3D

# First playable slice orchestrator. Loads one set of vocabulary questions,
# shows them through the VocabularyPanel, reacts with Henry, and persists a
# single progress value (happiness) across launches.

const VOCAB_PATH := "res://data/vocab_seed.json"
const REACTION_PAUSE := 1.4

@onready var _pet: PetController = $Henry
@onready var _panel: VocabularyPanel = $UI/VocabularyPanel

var _session := VocabSession.new()
var _save := SaveManager.new()
var _happiness: int = 0

func _ready() -> void:
    add_child(_save)

    var data := _save.load_json()
    _happiness = int(data.get("happiness", 0))

    if not _session.load_from_file(VOCAB_PATH):
        push_error("Could not load vocabulary data; pet room cannot start.")
        return

    _panel.answer_selected.connect(_on_answer_selected)
    _show_current()

func _show_current() -> void:
    var q := _session.current()
    if q == null:
        return
    _panel.set_question(q.prompt, q.options)
    _pet.set_idle_state()

func _on_answer_selected(index: int) -> void:
    var q := _session.current()
    if q == null:
        return

    if index == q.answer_index:
        _happiness += 1
        _save.save_json({"happiness": _happiness})
        _panel.show_correct()
        _pet.play_happy()
        await get_tree().create_timer(REACTION_PAUSE).timeout
        _session.advance()
        _show_current()
    else:
        _panel.show_try_again()
        _pet.play_thinking()
