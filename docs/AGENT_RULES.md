# Agent Rules

This project is a Godot 4 iPad game called TeachersPet.

## Hard Rules

- Use Godot 4 and GDScript.
- Do not use C#.
- Do not add backend code until the local iPad prototype milestone is complete.
- Do not put API keys, secrets, tokens, or model credentials in this repository.
- Do not call OpenAI or any model provider from the Godot app.
- Keep the first playable version to one room, one pet, and one vocabulary activity.
- Prefer small focused changes over large rewrites.
- Add comments for non-obvious logic.
- Keep game state and save logic simple.
- Do not introduce external Godot plugins unless explicitly approved.
- Do not introduce paid assets unless explicitly approved.
- Do not make the project depend on a home server for the app to open.

## Code Organization Rules

- Keep pet behavior under `game/scripts/pet/`.
- Keep vocabulary logic under `game/scripts/vocab/`.
- Keep save/load logic under `game/scripts/save/`.
- Keep reusable UI scenes under `game/scenes/ui/`.
- Keep local vocabulary seed data under `game/data/`.
- Use typed GDScript where practical.
- Keep network/API code out of the MVP unless Ryan explicitly starts a backend milestone.

## Input and Display Rules

- Touch input only. Do not use `InputEventMouse`.
- Use `InputEventScreenTouch` and `InputEventScreenDrag` where custom input handling is needed.
- Standard Button nodes handle touch automatically. Prefer them.
- Landscape orientation only.
- Set `display/window/handheld/orientation` to `landscape` in Godot project settings.
- Confirm the iOS export preset matches landscape orientation.
- UI must be designed for large touch targets.
- Minimum button size is 80x80 px.
- No hover states.

## Development Behavior

- Before making broad changes, update or create a task in `docs/BACKLOG.md`.
- Every completed task should leave the game runnable in the Godot editor.
- Do not break iPad export intentionally.
- If a task requires manual work in Godot Editor or Xcode, document exact steps in `docs/GODOT_PROJECT_NOTES.md` or `docs/IOS_BUILD_RUNBOOK.md`.
- Prefer Xcode command-line workflows (`xcodebuild`, `xcrun`, `xcode-select`, `plutil`) over asking Ryan to click through Xcode UI.
- Ask Ryan for manual UI actions only when they are truly unavoidable (for example: trusting a developer certificate, enabling Developer Mode, or granting on-device permissions).
