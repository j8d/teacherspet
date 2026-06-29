# Backlog

## Current Sprint: First Playable Slice
- [x] Wire `game/scenes/Main.tscn` to load `game/scenes/PetRoom.tscn`.
- [x] Add a visible placeholder Henry node in `PetRoom.tscn`.
- [x] Add `VocabularyPanel.tscn` with one prompt and three large touch buttons.
- [x] Load one question from `game/data/vocab_seed.json`.
- [x] Implement correct/incorrect answer feedback text.
- [x] Trigger one happy reaction and one thinking reaction on Henry.
- [x] Save and reload one progress value using `SaveManager.gd`.
- [ ] Verify scene flow on iPad simulator in landscape mode.
- [ ] Verify scene flow on Selah's iPad in landscape mode.

> Code for the slice is complete but unverified: Godot is not installed yet
> (see Milestone 1). Open the project in Godot 4.x to play-test, then complete
> the two verification items above.

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
- [ ] Verify Xcode 26.6 can connect to iPadOS 16.7.16 device
- [ ] Install Godot 4.x stable
- [ ] Install matching Godot export templates
- [ ] Create Godot project under game/
- [ ] Create minimal 3D scene with placeholder pet
- [ ] Run locally in Godot editor
- [ ] Configure iOS export preset (landscape only)
- [ ] Export and open project in Xcode
- [ ] Sign and install to iPad

## Milestone 2: Local Vocabulary Quiz
- [ ] Add game/data/vocab_seed.json with 5 to 10 words
- [ ] Create VocabQuestion.gd
- [ ] Create VocabSession.gd
- [ ] Create VocabularyPanel.tscn
- [ ] Show one question with three answer buttons
- [ ] Detect correct and incorrect answers
- [ ] Show simple feedback text

## Milestone 3: Pet Reactions
- [ ] Create PetState.gd
- [ ] Create PetController.gd
- [ ] Add simple idle behavior
- [ ] Add happy reaction for correct answers
- [ ] Add thinking reaction for incorrect answers

## Milestone 4: Local Save And Progress
- [ ] Create SaveManager.gd
- [ ] Save and load known words and mastery counts
- [ ] Save pet XP or happiness
- [ ] Add reset function for testing

## Milestone 5: First Playable iPad Build
- [ ] Export and install on iPad
- [ ] Test touch interaction
- [ ] Test save/load after restart
- [ ] Confirm UI readability on iPad
- [ ] Write playtest notes in docs/GODOT_PROJECT_NOTES.md

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
