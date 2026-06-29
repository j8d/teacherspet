# TeachersPet

TeachersPet is a private iPad game for Selah.

The verified iPad slice currently runs from the Godot 3.6.2 `game3/` project, where Selah teaches Henry (the pet cat) vocabulary words through short, touch-first interactions.

## Current Scope

- Godot 3.6.2 with GDScript for the verified iPad build
- iPad-first development and install through Xcode
- Local-only prototype (no backend, no AI integration)
- One room, one pet, one vocabulary activity for MVP

## Setup Notes

1. Keep the repo structure simple and milestone-driven.
2. Do not create the Godot project until explicitly requested.
3. Use `docs/TEACHERSPET_PROJECT_PLAN.md` as the source of truth for implementation milestones.
4. Track milestone execution in `docs/BACKLOG.md`.

## Platform Constraints

- Target device: iPadOS 16.7.16
- Xcode installed: 26.6
- Orientation: landscape only
- Input: touch only

## Security

- Never commit API keys, tokens, credentials, or secrets.
- Do not add backend/model provider calls in the iPad app for MVP.
