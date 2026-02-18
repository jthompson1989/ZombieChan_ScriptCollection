# ZombieChan Script Collection

A small collection of personal automation and installer scripts (PowerShell + shell) used to scaffold projects and install files.

---

## Contents 🔧

- `Dev-Script/`
  - `New-GoProject.ps1` — PowerShell helper to scaffold a new Go project.
- `Install-Script/`
  - `Install-File.ps1` — PowerShell installer/helper for Windows.
  - `install-files.sh` — POSIX shell installer for Linux/macOS/WSL.

## Quick start ✅

Prerequisites:
- PowerShell 7+ (`pwsh`) to run `.ps1` scripts
- Bash (or WSL) to run `install-files.sh`
- Go (optional) if you use the Go project scaffold

Run examples (from repository root):

- PowerShell (Windows / pwsh):
  - `pwsh .\Dev-Script\New-GoProject.ps1` — run the Go scaffold script (see `-h`/`--help` if present)
  - `pwsh .\Install-Script\Install-File.ps1` — run the installer script

- Bash (Linux/macOS/WSL):
  - `chmod +x Install-Script/install-files.sh`
  - `./Install-Script/install-files.sh`

> ⚠️ Always review scripts before running them locally. Back up important data.

## Usage notes & troubleshooting 💡

- If PowerShell blocks script execution, consider:
  - `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force` (review policy implications first)
- For shell script permission errors: use `chmod +x`.
- Most scripts accept arguments or a `--help` flag — try `-h`/`--help`.


## License / Disclaimer ⚠️

No license file is included in this repository. Use these scripts at your own risk — review before running. Add a `LICENSE` file if you want to publish under a specific license.

---

