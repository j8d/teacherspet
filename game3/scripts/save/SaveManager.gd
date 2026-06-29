extends Node
class_name SaveManager

const SAVE_PATH := "user://teacherspet_save.json"

func save_json(payload: Dictionary) -> void:
    var file := File.new()
    var err := file.open(SAVE_PATH, File.WRITE)
    if err == OK:
        file.store_string(JSON.print(payload))
        file.close()

func load_json() -> Dictionary:
    var file := File.new()
    if not file.file_exists(SAVE_PATH):
        return {}

    var err := file.open(SAVE_PATH, File.READ)
    if err != OK:
        return {}

    var parsed := JSON.parse(file.get_as_text())
    file.close()

    if parsed.error != OK or typeof(parsed.result) != TYPE_DICTIONARY:
        return {}

    return parsed.result
