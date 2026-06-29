extends RefCounted
class_name VocabSession

# Loads vocabulary questions from a local JSON file and tracks the current one.
# Kept off the scene tree (RefCounted) since it is pure data with no node behavior.

var questions: Array[VocabQuestion] = []
var current_index: int = 0

func load_from_file(path: String) -> bool:
    if not FileAccess.file_exists(path):
        push_error("Vocabulary file not found: %s" % path)
        return false
    var file := FileAccess.open(path, FileAccess.READ)
    if file == null:
        return false
    var parsed: Variant = JSON.parse_string(file.get_as_text())
    if not (parsed is Array):
        push_error("Vocabulary file is not a JSON array: %s" % path)
        return false
    questions.clear()
    for entry in parsed:
        if not (entry is Dictionary):
            continue
        var q := VocabQuestion.new()
        q.prompt = String(entry.get("prompt", ""))
        var opts := PackedStringArray()
        for o in entry.get("options", []):
            opts.append(String(o))
        q.options = opts
        q.answer_index = int(entry.get("answer_index", 0))
        questions.append(q)
    current_index = 0
    return not questions.is_empty()

func current() -> VocabQuestion:
    if current_index < 0 or current_index >= questions.size():
        return null
    return questions[current_index]

func advance() -> void:
    current_index += 1
    if current_index >= questions.size():
        current_index = 0

func reset() -> void:
    current_index = 0
