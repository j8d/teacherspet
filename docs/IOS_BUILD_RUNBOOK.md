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

## Account and Version Notes

- Current Apple account type: free account.
- Free-account development installs can expire every 7 days and may need reinstall from Xcode.
- Current Xcode version: 26.6.
- Verify Xcode 26.6 can connect and deploy to iPadOS 16.7.16 before deeper implementation.

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
5. Set orientation to landscape only.
6. Export the project.
7. Open the generated Xcode project.

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
- Xcode 26.6 may not include full support for older iPadOS device targets.
- If export fails, confirm the Godot export templates match the installed Godot version exactly.
