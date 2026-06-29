# Godot Project Notes

## Purpose

Track manual editor actions, iOS export notes, and short troubleshooting entries while building the local iPad-first MVP.

## Manual Steps Log

- Date: 2026-06-29
  - Action: Installed Godot 4.7 stable via `brew install --cask godot` (binary at
    `/opt/homebrew/bin/godot`, app at `/Applications/Godot.app`).
  - Result: `godot --headless --path game` imports and runs the first playable
    slice with no script or scene errors. Fixed one scaffold issue where
    `SaveManager.load_json` inferred a variable from a `Variant` (this project
    treats that warning as an error).

## Pending Verification: First Playable Slice

The slice is coded but not yet run (Godot 4.x not installed on this machine).
To verify:

1. Install Godot 4.x stable and open `game/project.godot`.
2. Press Play. `Main` should auto-load `PetRoom`.
3. Confirm: Henry (blue capsule) is visible on the left; the question card on
   the right shows a prompt and three large buttons.
4. Tap the correct option: feedback reads "Yes! Great job!", Henry bounces green,
   and the next question appears after a short pause.
5. Tap a wrong option: feedback reads "Hmm, let's try again.", Henry does a soft
   amber wobble, and the buttons stay tappable.
6. Answer a few correctly, quit, relaunch: progress (`happiness`) persists via
   `user://teacherspet_save.json`.
7. Confirm the window is landscape.

## iOS Export Notes

- Keep orientation landscape only.
- Keep touch input only.
- Keep scope to one room, one pet, one vocabulary activity.

## Troubleshooting

- Symptom:
- Root cause:
- Fix:
