# iOS Build Runbook

This project is developed in Godot and installed directly onto an iPad using Xcode.

## Prerequisites

- macOS on Ryan's M4 MacBook Pro.
- Xcode installed and opened at least once.
- Apple ID added in Xcode under Settings -> Accounts.
- Godot 3.6.2 stable installed.
- Matching Godot 3 export templates installed.
- iPad connected by USB-C or available for wireless development after initial pairing.
- iPad has trusted the Mac if prompted.

## Account and Version Notes

- Current Apple account type: free account.
- Free-account development installs can expire every 7 days and may need reinstall from Xcode.
- Current Xcode version: 26.6.
- Verify Xcode 26.6 can connect and deploy to iPadOS 16.7.16 before deeper implementation.

## First-Time Godot Setup

1. Open Godot.
2. Create or open the verified project at `teacherspet/game3/`.
3. Install export templates from Editor -> Manage Export Templates.
4. Confirm the real question loop runs locally in the Godot editor.
5. Keep orientation locked to landscape in project settings.

## Export To iOS

1. In Godot, open Project -> Export.
2. Add an iOS export preset.
3. Set the export path to `build/ios-game3/teacherspet-g3.xcodeproj`.
4. Use bundle identifier `com.j8d.teacherspet.g3`.
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

## Verified CLI Workflow (2026-06-29)

This is the exact path that worked end to end. Bundle id `com.j8d.teacherspet.g3`, team `2ZBRNRSJC4`.

### Why we deploy to the physical iPad, not the simulator

Godot 3.6.2's verified path uses the physical iPad (arm64) and `ios-deploy`
for install and launch. Use the simulator only if you explicitly verify the
matching template/arch combination first.

### 1. Export the Xcode project from Godot (headless)

```sh
godot --headless --path game3 --export-debug "iOS" ../build/ios-game3/teacherspet-g3.xcodeproj
```

Requirements baked into `game3/project.godot` and `game3/export_presets.cfg`:

- `*.json` is included so `res://data/vocab_seed.json` is packed.
- `display/window/handheld/orientation="reverse_landscape"`.
- A real `res://icon.png` (1024x1024, opaque) referenced as the app icon.

### 2. Build + sign for the device (arm64)

```sh
DEVICE_UDID=4e0c9da18c05974cd18c3df63a1957f7c359bcf1   # Ryan's iPad (16.7.16)
xcodebuild -project build/ios-game3/teacherspet-g3.xcodeproj -scheme teacherspet-g3 \
  -configuration Debug -sdk iphoneos \
  -destination "id=$DEVICE_UDID" \
  DEVELOPMENT_TEAM=2ZBRNRSJC4 CODE_SIGN_STYLE=Automatic \
  -allowProvisioningUpdates \
  -derivedDataPath build/ios-game3/DerivedData build
```

Get the device UDID with `xcrun xctrace list devices` (use the hex UDID, not
the CoreDevice UUID).

### 3. Install + launch on the iPad

`xcrun devicectl` reports this iPad as "unavailable" (CoreDevice is finicky with
iOS 16), so use `ios-deploy` (`brew install ios-deploy`):

```sh
APP=build/ios-game3/DerivedData/Build/Products/Debug-iphoneos/teacherspet-g3.app
ios-deploy --id "$DEVICE_UDID" --bundle "$APP" --justlaunch
```

A `run` / `success` in the output means it installed and launched. On first run
you may need to trust the developer profile on the iPad
(Settings -> General -> VPN & Device Management).

### Notes

- Free / personal-team installs expire ~7 days; rerun steps 2-3 to reinstall.
- Build output lives under `build/ios-game3/` which is gitignored.
