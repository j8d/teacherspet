# TeachersPet Project Plan

## Purpose

TeachersPet is a private, unpublished iPad game for my daughter Selah. The first version will be a small Godot 4 virtual pet vocabulary game. The project starts local-only, installs directly to an iPad through Xcode, and only adds backend and AI-generated content after the iPad prototype is proven to work.

The immediate working folder is:

```text
/Users/ryan/j8d/teacherspet/
```

Ryan has already installed Xcode and opened this folder in VS Code. Assume the folder may be empty unless files already exist.

He also created an empty repo at https://github.com/j8d/teacherspet

## Product Vision

Build a cozy 3D educational virtual pet app where Selah teaches vocabulary words to a pet. As Selah answers vocabulary activities correctly, the pet learns words, reacts emotionally, unlocks phrases, and earns room decorations or toys.

The game should feel like helping a pet grow, not like a worksheet. The learning loop must be simple, warm, and rewarding.

## Target User

Primary player: Selah, age 8.

Primary parent/developer: Ryan.

Pet: A gray and white cat named Henry. Pictures of the actual cat to model will be provided

The app is not intended for public release at first. It will be installed directly onto Selah's iPad from Ryan's M4 MacBook Pro using Xcode.

## Non-Negotiable Constraints

- Use Godot 4. Recommended version: latest 4.x stable from godotengine.org (likely 4.4.x as of mid-2026). Export templates must match the installed version exactly.
- Use GDScript, not C#.
- Target iPad first. Her iPad is on iPadOS 16.7.16.
- Use direct Xcode install first, not App Store, TestFlight, or web export.
- Landscape orientation only. Configure this in the Godot export preset and project settings.
- Touch input only. Do not implement mouse fallback. Design all interactions for finger tap on iPad.
- Keep the first version local-only.
- Do not add backend, OpenAI, authentication, Tailscale, or home-server sync until the local iPad prototype works.
- Do not put API keys, secrets, or model credentials in the Godot project.
- Keep the first playable scope small: one room, one pet, one vocabulary activity.
- Use simple readable code with comments for non-obvious logic.
- Prefer boring, reliable implementation over clever abstractions.
- Keep AI agent changes small and reviewable.

## Apple Developer Account

Ryan currently uses a free Apple ID for direct device installs via Xcode. Free accounts work but have one important constraint: apps expire 7 days after installation and must be reinstalled from Xcode. This is fine for development. If re-installs become disruptive, upgrade to a paid Apple Developer Program account ($99/yr) which removes the 7-day expiry.

A paid account is not required for Milestone 1 through Milestone 5.

## Xcode Version

Ryan has Xcode 26.6 installed. This is Apple's 2026 release (formerly called Xcode 18.x before Apple adopted version-matching with iOS).

**Important compatibility concern**: Xcode 26 ships device support files for modern iOS versions. Deploying to an iPadOS 16.7.16 device may fail because Xcode 26 may not include device support files for iOS 16. This must be verified in Milestone 1 before any other work proceeds.

If Xcode 26 cannot connect to the iPadOS 16 device, options are:
- Update the iPad to a newer iPadOS version (preferred if the device supports it).
- Install an older Xcode alongside Xcode 26 using xcodes or by downloading from developer.apple.com.
- Escalate to the paid Apple Developer account for additional device compatibility options.

Document the actual outcome in `docs/IOS_BUILD_RUNBOOK.md` once tested.

## Technical Stack

### Game Client

- Godot 4.x stable.
- GDScript.
- Native iOS/iPad export through Godot's iOS export preset.
- Xcode for signing, building, and installing onto the iPad.
- Local JSON vocabulary content for the first milestone.
- Local save file for progress.

### Development Tools

- VS Code as the main repo editor.
- Godot Editor for scenes, nodes, assets, and local game testing.
- Xcode only for iPad build/sign/run at first.
- GitHub Copilot / Copilot Agent for implementation assistance.

### Future Backend, Not For MVP

The backend should not be built until after the local iPad prototype works.

Future stack:

- FastAPI or Node/Fastify.
- PostgreSQL.
- Docker Compose on Ubuntu home server.
- Caddy reverse proxy.
- Optional Tailscale connectivity.
- AI-generated content only through backend services, never from the iPad app directly.

## Current Starting Point

Only assume this exists:

```text
/Users/ryan/j8d/teacherspet/
```

Xcode is installed.

The next goal is to create the repo structure, install Godot, create a minimal Godot project, and prove that a blank app can run on the iPad through Xcode.

## Desired Repository Structure

Create this structure gradually. Do not create placeholder complexity unless a milestone needs it.

```text
teacherspet/
  README.md
  PROJECT_PLAN.md
  .gitignore

  game/
    project.godot
    export_presets.cfg
    scenes/
      Main.tscn
      PetRoom.tscn
      ui/
        VocabularyPanel.tscn
    scripts/
      Main.gd
      pet/
        PetController.gd
        PetState.gd
      vocab/
        VocabQuestion.gd
        VocabSession.gd
      save/
        SaveManager.gd
    data/
      vocab_seed.json
    assets/
      models/
      textures/
      audio/
      icons/

  docs/
    AGENT_RULES.md
    IOS_BUILD_RUNBOOK.md
    GODOT_PROJECT_NOTES.md
    BACKLOG.md

  future-api/
    README.md
```

Important: the Godot project should live under `game/`, not directly at the repository root. This keeps future backend and deployment files cleanly separated from the game.

## Initial Files To Create

Create these files first:

```text
README.md
PROJECT_PLAN.md
.gitignore
docs/AGENT_RULES.md
docs/IOS_BUILD_RUNBOOK.md
docs/BACKLOG.md
future-api/README.md
```

After Godot is installed, create the Godot project inside:

```text
game/
```

## .gitignore Requirements

Create a `.gitignore` that is safe for a Godot + Xcode workflow.

It should ignore at least:

```gitignore
# macOS
.DS_Store
.AppleDouble
.LSOverride

# VS Code local settings
.vscode/

# Godot imports and generated data
.godot/
.import/
*.translation

# Godot export output
build/
exports/

# Xcode generated output
DerivedData/
*.xcworkspace/xcuserdata/
*.xcodeproj/xcuserdata/
*.xcodeproj/project.xcworkspace/xcuserdata/

# Logs and temp files
*.log
*.tmp
```

Do not ignore `project.godot`, `.tscn`, `.gd`, `.tres`, `.res`, or source assets.

## Agent Rules

Create `docs/AGENT_RULES.md` with these rules:

```md
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


## Input and Display Rules

- Touch input only. Do not use `InputEventMouse`. Use `InputEventScreenTouch` and `InputEventScreenDrag` where custom input handling is needed. Standard Button nodes handle touch automatically — prefer them.
- Landscape orientation only. Set `display/window/handheld/orientation` to `landscape` in Godot project settings and confirm the iOS export preset matches.
- UI must be designed for large touch targets. Minimum button size 80×80px. No hover states.

- Keep pet behavior under `game/scripts/pet/`.
- Keep vocabulary logic under `game/scripts/vocab/`.
- Keep save/load logic under `game/scripts/save/`.
- Keep reusable UI scenes under `game/scenes/ui/`.
- Keep local vocabulary seed data under `game/data/`.
- Use typed GDScript where practical.
- Keep network/API code out of the MVP unless Ryan explicitly starts a backend milestone.

## Development Behavior

- Before making broad changes, update or create a task in `docs/BACKLOG.md`.
- Every completed task should leave the game runnable in the Godot editor.
- Do not break iPad export intentionally.
- If a task requires manual work in Godot Editor or Xcode, document the exact steps in `docs/GODOT_PROJECT_NOTES.md` or `docs/IOS_BUILD_RUNBOOK.md`.
```

## iOS Build Runbook

Create `docs/IOS_BUILD_RUNBOOK.md` with the following content and keep it updated as the project evolves:

```md
# iOS Build Runbook

This project is developed in Godot and installed directly onto an iPad using Xcode.

## Prerequisites

- macOS on Ryan's M4 MacBook Pro.
- Xcode installed and opened at least once.
- Apple ID added in Xcode under Settings -> Accounts.
- Godot 4.x stable installed.
- Matching Godot export templates installed.
- iPad connected by USB-C or available for wireless development after initial pairing.
- iPad has trusted the Mac if prompted.

## First-Time Godot Setup

1. Open Godot.
2. Create or open the project at `teacherspet/game/`.
3. Install export templates from Editor -> Manage Export Templates.
4. Create a minimal 3D scene and set it as the main scene.
5. Confirm the scene runs locally in the Godot editor.

## Export To iOS

1. In Godot, open Project -> Export.
2. Add an iOS export preset.
3. Set the export path to something under `build/ios/`.
4. Use a unique bundle identifier, initially `com.ryan.teacherspet`.
5. Export the project.
6. Open the generated Xcode project.

## Run On iPad From Xcode

1. Connect the iPad to the Mac.
2. Open the exported Xcode project.
3. Select the app target.
4. Open Signing & Capabilities.
5. Select Ryan's Apple ID/team.
6. Enable automatic signing if available.
7. Confirm the bundle identifier is unique.
8. Select the connected iPad as the run target.
9. Press Run.
10. If the iPad blocks the app, trust the developer profile on the iPad and try again.

## Common Issues

- Xcode may require signing changes before the app will run.
- The iPad may need to trust the Mac.
- The iPad may need to trust the developer profile.
- The bundle identifier must be unique.
- The iPadOS version may require a compatible Xcode version.
- If export fails, confirm the Godot export templates match the installed Godot version.
```

## Godot Project Shape

Once Godot is installed, create a Godot project inside `game/`.

### Main Scene

Create `game/scenes/Main.tscn` with this conceptual node structure:

```text
Main (Node)
  PetRoom (Node3D)
  CanvasLayer
    VocabularyPanel (Control)
```

Alternatively, if it is simpler at first, make `Main.tscn` a `Node3D` directly and add UI later.

### Pet Room Scene

Create `game/scenes/PetRoom.tscn`:

```text
PetRoom (Node3D)
  WorldEnvironment
  DirectionalLight3D
  Camera3D
  Floor (MeshInstance3D)
  PetPlaceholder (MeshInstance3D)
```

Use primitive meshes at first. Do not search for a final pet asset yet. A capsule, sphere, cube, or simple low-poly placeholder is enough.

### Vocabulary UI Scene

Create `game/scenes/ui/VocabularyPanel.tscn` later in Milestone 2:

```text
VocabularyPanel (Control)
  PanelContainer
    VBoxContainer
      WordLabel (Label)
      PromptLabel (Label)
      AnswerButtonA (Button)
      AnswerButtonB (Button)
      AnswerButtonC (Button)
      FeedbackLabel (Label)
```

## Initial Gameplay MVP

The MVP should be a local-only iPad game with this loop:

1. Selah sees Henry in a small room.
2. Henry wants to learn a new word and looks to Selah to teach him.
3. The app shows one vocabulary question with three choices. Selah demonstrates she knows the word by choosing correctly, which is how she teaches Henry.
4. Selah taps an answer.
5. Correct answer: Henry reacts happily — he learned the word from Selah. He gains progress.
6. Incorrect answer: Henry looks confused. Selah can try again to teach him.
7. Progress is saved locally on the iPad.

The framing throughout the UI should reinforce that Selah is the teacher and Henry is the learner. Prompts should say things like "Teach Henry what this word means" rather than "Answer this question."

## Initial Vocabulary Data

Create `game/data/vocab_seed.json` with a small hand-authored set of words. Example shape:

```json
[
  {
    "id": "curious",
    "word": "curious",
    "definition": "wanting to learn or know more",
    "example_sentence": "The pet was curious about the shiny box.",
    "question": "What does curious mean?",
    "correct_answer": "wanting to learn or know more",
    "wrong_answers": [
      "very sleepy",
      "hard to carry"
    ],
    "grade_level": 2
  },
  {
    "id": "gentle",
    "word": "gentle",
    "definition": "kind and careful",
    "example_sentence": "Selah was gentle when she brushed the pet.",
    "question": "What does gentle mean?",
    "correct_answer": "kind and careful",
    "wrong_answers": [
      "very loud",
      "covered in mud"
    ],
    "grade_level": 2
  }
]
```

Keep the first word pack small, about 5 to 10 words.

## Local Save Data

Implement local save/load after the quiz loop works.

Suggested save shape:

```json
{
  "profile_name": "Selah",
  "pet_name": "Henry",
  "known_words": ["curious", "gentle"],
  "word_mastery": {
    "curious": 2,
    "gentle": 1
  },
  "pet_happiness": 75,
  "pet_xp": 30,
  "unlocked_items": [],
  "last_played_at": "2026-06-26T12:00:00Z"
}
```

Create `SaveManager.gd` for all save/load behavior. Do not scatter file access across multiple scripts.

## Suggested GDScript Classes

### `PetState.gd`

Responsible for pet data only.

Suggested fields:

- `pet_name`
- `happiness`
- `xp`
- `known_words`
- `word_mastery`
- `current_mood`

### `PetController.gd`

Responsible for visual pet behavior.

Suggested methods:

- `set_mood(mood: String)`
- `react_correct()`
- `react_incorrect()`
- `play_idle_animation()`

For the first version, animations can be simple scale/position changes created with tweens. Real animations can come later.

### `VocabQuestion.gd`

Responsible for representing one question.

Suggested fields:

- `id`
- `word`
- `definition`
- `example_sentence`
- `question`
- `correct_answer`
- `wrong_answers`
- `grade_level`

### `VocabSession.gd`

Responsible for loading vocabulary data and selecting questions.

Suggested methods:

- `load_seed_questions()`
- `get_next_question()`
- `check_answer(question_id: String, answer: String)`

### `SaveManager.gd`

Responsible for local persistence.

Suggested methods:

- `save_game(state: Dictionary)`
- `load_game() -> Dictionary`
- `has_save() -> bool`
- `reset_save()`

## Planning And Tracking

### Backlog Format

`docs/BACKLOG.md` tracks milestone execution tasks.

Selah learning objectives are tracked in this document under `### Selah Learning Objectives`.

Use this format:

```md
# Backlog

## Milestone 0: Repo Setup
- [ ] Initialize git
- [ ] Create .gitignore

## Milestone 1: Godot Toolchain Proof
- [ ] Install Godot 4.x stable
...
```

Rules:
- One line per task, checkbox style.
- Check items off as they are completed.
- Keep `docs/BACKLOG.md` focused on implementation milestones and build progress.
- Keep learning outcomes in this file under `### Selah Learning Objectives`.
- Do not add sub-tasks unless the top-level task is genuinely ambiguous.
- Do not add due dates, assignees, or priorities.

### Selah Learning Objectives

- Build confidence with age-appropriate vocabulary before 3rd grade starts.
- Improve retention of learned words across repeated sessions.
- Keep daily play sessions short, positive, and consistent (10 to 15 minutes).
- Reinforce that Selah is teaching Henry, not taking a stressful test.
- Use progress signals (mastery counts, review success, engagement) to guide what words to practice next.

## Milestone Plan

### Milestone 0: Repo Setup

Goal: Create a clean repo structure and documentation.

Tasks:

- Initialize git if not already initialized.
- Create `.gitignore`.
- Create `README.md`.
- Create `PROJECT_PLAN.md`.
- Create `docs/AGENT_RULES.md`.
- Create `docs/IOS_BUILD_RUNBOOK.md`.
- Create `docs/BACKLOG.md`.
- Create `future-api/README.md` explaining that backend work is intentionally deferred.

Acceptance criteria:

- The folder has a clear structure.
- The repo can be opened in VS Code.
- The plan and agent rules are visible to Copilot.

### Milestone 1: Godot Toolchain Proof

Goal: Prove a minimal Godot app can run locally and on the iPad.

Tasks:

- Verify Xcode 26.6 can connect to the iPadOS 16.7.16 device. Document the result and any fix required before proceeding.
- Install Godot 4.x stable manually (check godotengine.org for latest stable).
- Install matching Godot export templates.
- Create a Godot project under `game/`.
- Create a minimal 3D main scene.
- Add a camera, light, floor, and placeholder pet mesh.
- Run the scene in the Godot editor.
- Configure iOS export preset.
- Set export orientation to landscape only.
- Export to Xcode.
- Open the Xcode project.
- Set signing and bundle identifier.
- Run on the connected iPad.
- Update `docs/IOS_BUILD_RUNBOOK.md` with any actual steps or fixes Ryan used.

Acceptance criteria:

- The project runs in Godot editor.
- The project installs and launches on the iPad through Xcode.
- No vocabulary gameplay is required yet.

### Milestone 2: Local Vocabulary Quiz

Goal: Build the first educational interaction.

Tasks:

- Add `game/data/vocab_seed.json` with 5 to 10 words.
- Create `VocabQuestion.gd`.
- Create `VocabSession.gd`.
- Create `VocabularyPanel.tscn`.
- Show one question and three answer buttons.
- Detect correct and incorrect answers.
- Show simple feedback text.

Acceptance criteria:

- The player can answer a vocabulary question.
- The app shows whether the answer is correct.
- The next question can be loaded.
- The feature works in the Godot editor.

### Milestone 3: Pet Reactions

Goal: Make the pet respond to learning.

Tasks:

- Create `PetState.gd`.
- Create `PetController.gd`.
- Add simple idle behavior.
- Add happy reaction for correct answers.
- Add thinking/sad reaction for incorrect answers.
- Connect quiz results to pet reactions.

Acceptance criteria:

- Correct answers visibly affect the pet.
- Incorrect answers visibly affect the pet.
- Reactions are simple but clear.

### Milestone 4: Local Save And Progress

Goal: Save Selah's progress locally on the iPad.

Tasks:

- Create `SaveManager.gd`.
- Save known words.
- Save word mastery counts.
- Save pet XP or happiness.
- Load progress when the app starts.
- Add a reset function for development testing.

Acceptance criteria:

- Progress persists after closing and reopening the app.
- Save/load works in the Godot editor.
- Save/load works on iPad.

### Milestone 5: First Playable iPad Build

Goal: Create the first version Selah can actually try.

Tasks:

- Export and install on iPad.
- Test touch interaction.
- Test audio if any exists.
- Test local save after app restart.
- Confirm the UI is readable on iPad.
- Confirm the game loop is understandable without explanation.
- Write notes from playtesting in `docs/GODOT_PROJECT_NOTES.md`.

Acceptance criteria:

- Selah can open the app from the iPad home screen.
- She can answer questions by touch.
- The pet reacts.
- Progress persists locally.

### Milestone 6: Polish Pass

Goal: Make the experience more charming before adding backend complexity.

Tasks:

- Replace placeholder pet with a simple low-poly pet asset or improved primitive model.
- Add basic pet name display.
- Add simple reward moments.
- Add sound effects if appropriate.
- Add a small notebook/list of learned words.
- Add 10 to 20 total vocabulary words.

Acceptance criteria:

- The app feels like a small game, not just a test scene.
- The vocabulary loop remains simple.
- iPad performance remains good.

### Milestone 7: Future Backend Planning Only

Goal: Plan backend integration without implementing it prematurely.

Tasks:

- Define future API endpoints in `future-api/README.md`.
- Decide whether backend will be FastAPI or Node/Fastify.
- Define progress sync shape.
- Define approved vocabulary pack shape.
- Define AI content safety rules.

Acceptance criteria:

- No backend is required for the app to run.
- Future API contracts are documented.

## Future Backend Direction

The backend should eventually support:

- Parent-approved word packs.
- Progress sync.
- Multiple profiles if needed.
- AI-generated candidate vocabulary content.
- Review/approval before generated content reaches the app.

Possible future endpoints:

```text
GET  /api/health
GET  /api/profiles/selah
GET  /api/vocab/packs/approved
POST /api/progress/sync
POST /api/ai/vocab/generate-candidates
POST /api/vocab/packs/approve
```

The iPad app must never call OpenAI or any model provider directly. The backend owns all model calls and content safety checks.

## Future AI Content Rules

When AI-generated content is added later:

- AI generates candidate word packs only.
- Backend validates JSON schema.
- Backend filters obvious unsafe or inappropriate content.
- Parent approval is required before the app receives new generated content.
- The app only downloads approved content.
- Keep all prompts and generation logs server-side.

## Design Principles

### Keep It Cozy

The experience should feel soft, warm, and encouraging. Avoid timers, punishment, failure states, or pressure in the first version.

### Make Learning Visible

The pet should visibly learn words over time. Example progression:

```text
0 correct answers: pet does not know the word yet
1 correct answer: pet recognizes the word
3 correct answers: pet can use the word in a sentence
5 correct answers: pet unlocks a phrase, trick, or reward
```

### Avoid Scope Creep

Do not add these in the first version:

- Multiple rooms.
- Multiple pets.
- Account login.
- Backend sync.
- Open-ended chatbot behavior.
- AI-generated live conversation.
- Inventory systems beyond tiny unlocks.
- Complex animations.
- Online multiplayer.
- Public sharing.

### Favor Touch-First UI

All UI must be comfortable on iPad:

- Large buttons.
- High contrast text.
- Minimal text per screen.
- Simple prompts.
- No tiny controls.
- Avoid hover-only interactions.

## Copilot Task Instructions

When asking Copilot Agent to work on this project, give it one task at a time.

Good task:

```text
Create the initial repo files for Milestone 0 exactly as described in PROJECT_PLAN.md. Do not create the Godot project yet. Add README.md, .gitignore, docs/AGENT_RULES.md, docs/IOS_BUILD_RUNBOOK.md, docs/BACKLOG.md, and future-api/README.md.
```

Good task:

```text
Create a Godot 4 project under game/ with a minimal Main.tscn scene containing a camera, directional light, floor mesh, and placeholder pet mesh. Use GDScript only. Keep it runnable in the Godot editor.
```

Bad task:

```text
Build the whole virtual pet vocabulary game with AI content and iPad deployment.
```

Do not ask Copilot to build too much in one pass.

## First Copilot Prompt To Use

Use this as the first prompt in VS Code Copilot Chat or Agent mode:

```text
We are starting a new project in /Users/ryan/j8d/teacherspet called TeachersPet. It will be a Godot 4 GDScript iPad game installed directly via Xcode. For now, do not create backend code and do not add AI integration.

Please complete Milestone 0 from PROJECT_PLAN.md:

1. Create a clean repo structure.
2. Create .gitignore for macOS, VS Code, Godot, export output, and Xcode generated files.
3. Create README.md with a short project overview and setup notes.
4. Create docs/AGENT_RULES.md using the rules from PROJECT_PLAN.md.
5. Create docs/IOS_BUILD_RUNBOOK.md using the runbook from PROJECT_PLAN.md.
6. Create docs/BACKLOG.md with milestone execution tasks from PROJECT_PLAN.md.
7. Create future-api/README.md explaining that backend work is intentionally deferred until the local iPad prototype works.

Do not create the Godot project yet unless asked. Keep the changes small and reviewable.
```

## Second Copilot Prompt To Use

Use this only after Milestone 0 is complete and Godot 4 is installed:

```text
Please complete the first part of Milestone 1 from PROJECT_PLAN.md.

Create a Godot 4 project under game/. Add a minimal 3D main scene with a camera, a directional light, a floor mesh, and a placeholder pet mesh using built-in primitive meshes. Use GDScript only. Add comments for non-obvious logic. Do not add vocabulary gameplay yet. Do not add backend code. Keep the project simple and runnable in the Godot editor.

After making changes, update docs/GODOT_PROJECT_NOTES.md with what was created and any manual steps Ryan must perform in the Godot editor.
```

## Third Copilot Prompt To Use

Use this after the blank Godot project runs in the editor:

```text
Please help prepare the Godot project for iPad direct install.

Review the project and update docs/IOS_BUILD_RUNBOOK.md with the exact manual steps Ryan should follow to create or confirm the iOS export preset in Godot, export the project, open it in Xcode, set signing with bundle identifier com.ryan.teacherspet, select the connected iPad, and press Run.

Do not make unsupported assumptions about Ryan's Apple account. Do not add backend code. Do not add gameplay. This task is documentation and export-prep only.
```

## Definition Of Done For The First Week

The first week is successful if:

- The repo has a clear structure.
- Godot 4 project exists under `game/`.
- A minimal 3D scene runs in the Godot editor.
- The app exports to Xcode.
- The app installs and launches on the iPad.
- The build/run steps are documented.

No backend is needed. No AI is needed. No final art is needed.

## References For Ryan

- Godot iOS export requires macOS with Xcode installed and matching Godot export templates.
- Godot exports the project for Xcode, and Xcode handles signing, building, and installing on device.
- Xcode automatic signing can create necessary signing assets for development builds.
- iOS/iPadOS apps must be code signed to run on a device.

Keep this project narrow until the iPad install path is proven.
