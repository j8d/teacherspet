# Backlog

## Current Sprint: Verified Godot 3 iPad Slice
- [x] Wire `game3/scenes/Main.tscn` to load `game3/scenes/PetRoom.tscn`.
- [x] Add a visible Henry placeholder node in `game3/scenes/PetRoom.tscn`.
- [x] Add `game3/scenes/ui/VocabularyPanel.tscn` with one prompt and three large touch buttons.
- [x] Load real questions from `game3/data/vocab_seed.json`.
- [x] Implement correct/incorrect answer feedback text.
- [x] Trigger one happy reaction and one thinking reaction on Henry.
- [x] Save and reload happiness plus known words using `game3/scripts/save/SaveManager.gd`.
- [x] Build, sign, install, and launch on Selah's iPad (arm64).
- [x] Fix landscape orientation and real-question packaging regressions on device.

> Code for the slice is complete and validated with Godot 3.6.2, runs in the
> Godot editor, and now builds/installs/launches on the physical iPad
> (iPad6,12, iPadOS 16.7.16) via the verified CLI workflow in
> `docs/IOS_BUILD_RUNBOOK.md`.

## Milestone 0: Repo Setup
- [x] Initialize git
- [x] Create .gitignore
- [x] Create README.md
- [x] Create PROJECT_PLAN.md
- [x] Create docs/AGENT_RULES.md
- [x] Create docs/IOS_BUILD_RUNBOOK.md
- [x] Create docs/BACKLOG.md
- [x] Create future-api/README.md

## Milestone 1: Godot Toolchain Proof
- [x] Verify Xcode 26.6 can connect to iPadOS 16.7.16 device
- [x] Install Godot 4.x stable
- [x] Install matching Godot export templates
- [x] Create Godot project under game/
- [x] Create minimal 3D scene with placeholder pet
- [x] Run locally in Godot editor
- [x] Configure iOS export preset (landscape only)
- [x] Export and open project in Xcode
- [x] Sign and install to iPad

## Milestone 2: Local Vocabulary Slice
- [x] Add `game3/data/vocab_seed.json` with 5 words
- [x] Create `VocabQuestion.gd`
- [x] Create `VocabSession.gd`
- [x] Create `VocabularyPanel.tscn`
- [x] Show one question with three answer buttons
- [x] Detect correct and incorrect answers
- [x] Show simple feedback text

## Milestone 3: Pet Reactions
- [x] Create `PetState.gd`
- [x] Create `PetController.gd`
- [x] Add simple idle behavior
- [x] Add happy reaction for correct answers
- [x] Add thinking reaction for incorrect answers

## Milestone 4: Local Save And Progress
- [x] Create `SaveManager.gd`
- [x] Save and load known words and mastery counts
- [x] Save pet XP or happiness
- [ ] Add reset function for testing

## Milestone 5: First Playable iPad Build
- [x] Export and install on iPad
- [ ] Test touch interaction
- [ ] Test save/load after restart
- [ ] Confirm UI readability on iPad
- [x] Write playtest notes in `docs/GODOT_PROJECT_NOTES.md`

## Milestone 6: Polish Pass
- [ ] Improve placeholder pet model
- [ ] Add basic pet name display
- [ ] Add simple reward moments
- [ ] Add sound effects if appropriate
- [ ] Expand vocabulary to 10 to 20 words

## Milestone 7: Future Backend Planning Only
- [ ] Define future API endpoints in future-api/README.md
- [ ] Choose FastAPI or Node/Fastify
- [ ] Define progress sync shape
- [ ] Define approved vocabulary pack shape
- [ ] Define AI content safety rules
