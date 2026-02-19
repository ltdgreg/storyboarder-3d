# Storyboarder Community Build: What Changed So Far

This branch includes reliability and usability fixes for desktop Storyboarder, focused on Shot Generator behavior and startup.

## Included fixes

1. Shot Generator window spawn fix (multi-monitor)
- Restored window position is now clamped to visible display work area.
- Prevents Shot Generator from reopening off-screen or too high to move when monitor layout changes.

2. Right-mouse vertical orbit toggle (default ON)
- Added setting: **Invert RMB Vertical Orbit** in Shot Generator camera panel.
- Default behavior is now inverted vertical orbit for right-mouse drag (more intuitive for most users).
- Setting is persisted locally.

3. Reduced startup noise / extension errors
- Added guard to skip devtools extension install when configured.
- Avoids noisy `Cr24` extension errors in this setup.

4. Windows one-click launcher
- Added `open-storyboarder.bat`:
  - Clears conflicting `ELECTRON_RUN_AS_NODE`
  - Ensures dependencies are installed
  - Ensures Electron binary is present
  - Starts Storyboarder via `npm run start:electron`

5. First-run build handling for this environment
- Launcher and setup were adjusted to work around modern Node/OpenSSL friction with legacy Webpack tooling in this repo.

## Branch

`community-maintained` on:
`https://github.com/ltdgreg/storyboarder-3d`

## Notes

- This is a community-maintained branch, not an official Wonder Unit desktop release.
- Please keep backups of `.storyboarder` projects when testing any community build.
- If you hit a bug, include:
  - OS/version
  - Repro steps
  - Expected vs actual behavior
  - Logs/screenshots if possible
