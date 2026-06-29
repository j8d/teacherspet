extends Reference
class_name VocabSession

# Loads vocabulary questions from a local JSON file and tracks the current one.

const VocabQuestionScript = preload("res://scripts/vocab/VocabQuestion.gd")

var questions = []
var current_index = 0

func load_from_file(path: String) -> bool:
    var file = File.new()
    if not file.file_exists(path):
        push_error("Vocabulary file not found: %s" % path)
        return false

    var err = file.open(path, File.READ)
    if err != OK:
        return false

    var parsed = JSON.parse(file.get_as_text())
    file.close()

    if parsed.error != OK or typeof(parsed.result) != TYPE_ARRAY:
        push_error("Vocabulary file is not a JSON array: %s" % path)
        return false

    questions.clear()
    var index = 0
    for entry in parsed.result:
        if typeof(entry) != TYPE_DICTIONARY:
            index += 1
            continue

        var q = VocabQuestionScript.new()
        var raw_key = str(entry.get("id", "")).strip_edges()
        if raw_key == "":
            # Keep save keys deterministic even when vocab entries don't have IDs yet.
            raw_key = str(entry.get("prompt", "question_%d" % index)).strip_edges()
        q.key = raw_key
        q.prompt = str(entry.get("prompt", entry.get("question", ""))).strip_edges()

        var opts = PoolStringArray()
        var answer_index = 0
        if entry.has("options") and typeof(entry.get("options")) == TYPE_ARRAY:
            for option in entry.get("options", []):
                opts.append(str(option))
            answer_index = int(entry.get("answer_index", 0))
        elif entry.has("correct_answer") and entry.has("wrong_answers") and typeof(entry.get("wrong_answers")) == TYPE_ARRAY:
            # Support the alternate schema used in planning docs.
            opts.append(str(entry.get("correct_answer", "")))
            for wrong in entry.get("wrong_answers", []):
                opts.append(str(wrong))
            answer_index = 0

        q.options = opts
        q.answer_index = answer_index

        if q.prompt != "" and q.options.size() >= 2:
            questions.append(q)
        index += 1

    current_index = 0
    return questions.size() > 0

func current():
    if current_index < 0 or current_index >= questions.size():
        return null
    return questions[current_index]

func advance() -> void:
    current_index += 1
    if current_index >= questions.size():
        current_index = 0

func reset() -> void:
    current_index = 0
