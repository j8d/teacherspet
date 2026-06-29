# Godot Project Notes

## Purpose

Track manual editor actions, iOS export notes, and short troubleshooting entries while building the local iPad-first MVP.

## Manual Steps Log

- Date: 2026-06-29
  - Action: Installed Godot 3.6.2 stable via Homebrew cask, with the verified
    slice living under `game3/`.
  - Result: `godot --headless --path game3` imports and runs the verified
    iPad slice with no script or scene errors. Fixed one scaffold issue where
    `SaveManager.load_json` inferred a variable from a `Variant` (this project
    treats that warning as an error).

- Date: 2026-06-29
  - Action: Exported iOS Xcode project, built arm64, signed (team `2ZBRNRSJC4`,
    bundle `com.j8d.teacherspet.g3`), and installed/launched on Selah's iPad
    (iPad6,12, iPadOS 16.7.16) via `ios-deploy`.
  - Result: App launched on device (`run` / `success`). Full verified command
    sequence is in `docs/IOS_BUILD_RUNBOOK.md` (Verified CLI Workflow).
  - Gotcha 1: The iOS **simulator** is not a usable target on this Apple Silicon
    Mac. Godot 4.7's simulator `libgodot.a` is x86_64-only and the iPadOS 26.5
    simulator only runs arm64, so it's rejected ("Failed to find matching arch").
    Use the physical iPad.
  - Gotcha 2: The Godot iOS export dropped `res://data/vocab_seed.json` until
    the export preset include filter was widened to include `*.json`.
  - Gotcha 3: `xcrun devicectl` reports this iOS 16 iPad as "unavailable";
    `ios-deploy` (brew) installs and launches reliably instead.

## Pending Verification: First Playable Slice

The verified Godot 3 slice is coded and now runs on Selah's iPad. Interactive play-test checklist:

1. Launch TeachersPet on the iPad (landscape).
2. Confirm: `Main` auto-loads `PetRoom`.
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
