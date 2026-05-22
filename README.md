# 🐈‍⬛ PowerCat

![PowerCat Logo](assets/banner.png)

[![PowerCat CI](https://img.shields.io/github/actions/workflow/status/TheOnliestMattastic/PowerCat/pester.yml?branch=main&style=for-the-badge&label=CI%20Tests&labelColor=6272a4)](https://github.com/TheOnliestMattastic/PowerCat/actions/workflows/pester.yml)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/PowerCat?color=bd93f9&style=for-the-badge&labelColor=6272a4)](https://www.powershellgallery.com/packages/PowerCat)
[![License: MIT](https://img.shields.io/badge/License-MIT-bd93f9?color=bd93f9&style=for-the-badge&labelColor=6272a4)](https://opensource.org/licenses/MIT)
[![Portfolio](https://img.shields.io/badge/Portfolio-bd93f9?style=for-the-badge&logo=githubpages&logoColor=white&labelColor=6272a4)](https://theonliestmattastic.github.io/)
[![GitHub](https://img.shields.io/badge/GitHub-Profile-bd93f9?style=for-the-badge&logo=github&logoColor=white&labelColor=6272a4)](https://github.com/theonliestmattastic)

## 🔭 Overview

**PowerCat** is a single-shot concatenator for bundling markdown and code into one clean text file.
It's the feline cousin of Unix `cat`—polished for PowerShell, built for sharing code with recruiters, collaborators, and LLMs.

> **Breaking change (v2.0.0):** PowerCat no longer includes `.md` files by default. This was an intentional, breaking change to avoid accidentally bundling documentation. To restore previous behavior, explicitly opt-in with `-IncludeMarkdown` or add `-Extensions ".md"`. See ReleaseNotes for migration guidance.

## ✨ Features

- **Stdout-first output:** Outputs to stdout by default (Unix `cat` style); optional file writing via `-OutputFile`.
- **Concatenation:** Bundle multiple filetypes into a single output.
- **Recursion:** Include subdirectories with `-Recurse`.
- **Token estimation:** View character and estimated token count with `-Stats` for AI context planning.
- **Markdown fences:** Opt-in code fencing with `-Fence` for clean LLM/GitHub sharing.
- **Header formats:** Choose between Markdown, JSON, or YAML with `-HeaderFormat` for flexible parsing.
- **Minification:** Strip comments and blank lines with `-Minify` for lean, token-optimized bundles.
- **Size filtering:** Exclude files by size with `-MinSize` and `-MaxSize` to control output volume.
- **Binary file detection:** Automatically skips common binary formats to prevent errors.
- **Extensions:** No implicit defaults — opt-in. Use `-IncludeMarkdown` to include `.md`, or include types via switches (`-Bash`, `-PowerShell`, `-HTML`, `-CSS`, `-Lua`) or `-Extensions`.
- **Sorting:** Control file order with `-Sort Name|Extension|LastWriteTime|Length`.
- **Catignore support:** Exclude files and directories with a `.gitignore`-style `catignore` file.
- **WhatIf/Verbose:** Safe dry-runs and granular progress tracking.
- **IncludeTree:** Prepend directory structure for better context.
- **Aliases:** Quick commands `PowerCat`, `pcat`, `concat` all point to `Invoke-PowerCat`.
- **Native help:** Full comment-based help via `Get-Help Invoke-PowerCat`.

## 🚀 Blasting Off

### Install from PowerShell Gallery

```powershell
Install-Module -Name PowerCat -Scope CurrentUser
Import-Module PowerCat
```

### Run as a cmdlet

```powershell
# Output to file (positional SourceDir)
Invoke-PowerCat "C:\Project" -OutputFile "C:\bundle.txt"

# Output to stdout (and pipe to file)
Invoke-PowerCat "C:\Project" | Out-File "C:\bundle.txt"
```

### Aliases

```powershell
PowerCat . -o out.txt                    # Write to file
pcat . | Out-File out.txt                # Pipe to file
concat . -r -f -p                        # Stdout with fences
```

### Help

```powershell
Get-Help Invoke-PowerCat -Full
Get-Help Invoke-PowerCat -Examples
```

## Demos

See PowerCat in action:

### Display help with the `-h` flag

![Demo of PowerCat with help flag](https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExYXBkZzl0bGExamhhZmRzeHNtbzk0ajh6M3VtNjhvcHZ4NWwyMzgyeCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/lvK3qtQj34pWwHch1H/giphy.gif)

### Bundle files with `-Stats` and output to stdout

![Demo of PowerCat with stats flag](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExaGxuOHBiNDVkOTU1ZGJ5bTVsZDhhODQ0bDFrZGx2N25iYmw3eWcycCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/GGuPOvVAg61zc0WxE9/giphy.gif)

### Write bundled files to `.txt` and view with `nano`

![Demo of PowerCat bundling files and verifying with `nano`](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExd3B1dmluaDFkbTl3YWNueDA4am93Ym5vcGY3bjZpdXd3bGV1M3htbiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/BeM9Uxe31ol7EzIQ8L/giphy.gif)

### Pipe bundled bash files to `bat` for syntax highlighting

![Demo of PowerCat piping output to `bat` with syntax highlighting](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExa3d5bnhhM2V1N210MmxvNDQwMzY3b3d1MW90ZHQxMTF1NDd5Y3ZmYSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/WUnH3gHQRTdDzrxxO8/giphy.gif)

### Pipe bundled output to `lolcat` for rainbow terminal fun

![Demo of PowerCat piping output to `lolcat`](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExcXJ4NmJxd2cxbWxyeTNodGFuN3Nyb2hrbzRrdjVqYWpmOW51bXFveSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/ULnasHsrwyqu2SxYVy/giphy.gif)

## 🧪 Examples

- **Concatenate matching files to stdout (no implicit Markdown):**

```powershell
Invoke-PowerCat "C:\Project"
# Output streams to console; pipe to capture
Invoke-PowerCat "C:\Project" | Out-File bundle.txt
```

- **Bundle for LLMs with minification, fences, and token stats:**

```powershell
Invoke-PowerCat "C:\Project" -Recurse -Minify -Fence -PowerShell -Stats
```

Output includes:

- Stripped comments and blank lines (lean for token limits)
- Code fenced blocks (markdown-aware)
- Token estimate (4 chars/token baseline):

```powershell
=== PowerCat Statistics ===
Files processed:     15
Total characters:    45,230
Estimated tokens:    11,308 (4 chars/token baseline)
===========================
```

- **Write to file with JSON headers for structured parsing:**

```powershell
Invoke-PowerCat "C:\Project" -o "C:\bundle.txt" -Recurse -HeaderFormat JSON -Lua
```

Output includes structured headers like `{"file":"script.lua"}` for better LLM parsing.

- **Exclude large files to optimize for token limits:**

```powershell
Invoke-PowerCat "C:\Project" -Recurse -MaxSize 50KB -Bash
```

- **Custom extensions and sorting:**

```powershell
Invoke-PowerCat "C:\Project" -o "C:\bundle.txt" -Extensions ".ps1",".json",".sh" -Sort Extension
```

- **Use catignore to exclude directories:**

Create a `catignore` file in your project:

```plaintext
node_modules/
.git/
*.log
bin/
obj/
```

Then run:

```powershell
Invoke-PowerCat "C:\Project" -o "C:\bundle.txt" -Recurse
```

- **View token estimation before bundling:**

```powershell
# Note: PowerCat no longer includes Markdown by default. Use `-IncludeMarkdown` to include `.md` files.
Invoke-PowerCat "C:\Project" -Recurse -Minify -Stats
# See: Files processed, Total characters, Estimated tokens
# Then decide: pipe to file, adjust MaxSize, or minify further
```

## 🗺️ Repo structure

This repo ships both a module and a standalone script for convenience:

- **Module:** `src/PowerCat/PowerCat.psm1`, `src/PowerCat/PowerCat.psd1`
- **Script:** `scripts/PowerCat.ps1`

Module usage:

```powershell
Import-Module .\src\PowerCat\ -Force
Invoke-PowerCat . -o out.txt
```

Script usage:

```powershell
.\scripts\PowerCat.ps1 . -o out.txt
```

_Note:_ If you see scripts blocked, run `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` as admin or follow your org policy.

## ☄️ Why PowerCat?

Because recruiters, collaborators, and LLMs don't want a directory tree—they want one file, structured and readable.
PowerCat makes your work portable, token-efficient, and a little stylish.

### PowerCat vs. Standard `cat`

**Standard `cat` or `Get-Content`:**

```powershell
# Just dumps all files end-to-end with no structure
Get-ChildItem -Recurse -Filter "*.ps1" | Get-Content
# Output: No file separators, no headers, unclear which code belongs where
```

**PowerCat:**

```powershell
Invoke-PowerCat . -Recurse -Fence -PowerShell
# Output:
# --- File: script1.ps1 ---
#
# '''ps1
# function HelloWorld { Write-Host "Hello" }
# '''
#
# --- File: script2.ps1 ---
#
# '''ps1
# function GoodbyeWorld { Write-Host "Goodbye" }
# '''
```

**The difference:**

| Feature                | `cat` | PowerCat                                 |
| ---------------------- | ----- | ---------------------------------------- |
| Stdout output          | ✅    | ✅ (default)                             |
| File output (optional) | ❌    | ✅                                       |
| File headers           | ❌    | ✅ (Markdown/JSON/YAML)                  |
| Code fencing           | ❌    | ✅ (Markdown fences)                     |
| Minification           | ❌    | ✅ (strip comments)                      |
| Token estimation       | ❌    | ✅ (AI context planning)                 |
| Size filtering         | ❌    | ✅ (min/max size)                        |
| Exclusion patterns     | ❌    | ✅ (catignore support)                   |
| Sorting control        | ❌    | ✅ (by name, extension, size, date)      |
| Multiple extensions    | ❌    | ✅ (flexible file type selection)        |
| Binary safety          | ❌    | ✅ (auto-skip executables, images, etc.) |

PowerCat is purpose-built for sharing code with recruiters, collaborators, and LLMs—creating readable, structured, token-aware bundles that respect context limits.

## 🛸 License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## 🪐 Recruiter's note

This isn't just a script—it's a demonstration of:

- Practical PowerShell scripting and automation
- Thoughtful parameter design and UX
- Clear documentation and branding
- Cross-platform compatibility (Windows, Linux, macOS)

If you're looking for someone who blends technical depth with creative polish, you've found him.

## 👽 Contact

Curious about my projects? Want to collaborate or hire for entry-level IT/support/dev roles? Shoot me an email or connect on GitHub—I reply quickly and love new challenges.

[![Portfolio](https://img.shields.io/badge/Portfolio-bd93f9?style=for-the-badge&logo=githubpages&logoColor=white&labelColor=6272a4)](https://theonliestmattastic.github.io/)
[![GitHub](https://img.shields.io/badge/GitHub-Profile-bd93f9?style=for-the-badge&logo=github&logoColor=white&labelColor=6272a4)](https://github.com/theonliestmattastic)
[![Email](https://img.shields.io/badge/Email-matthew.poole485%40gmail.com-bd93f9?style=for-the-badge&logo=gmail&logoColor=white&labelColor=6272a4)](mailto:matthew.poole485@gmail.com)

> "Give someone a program, frustrate them for a day. Teach them to program, frustrate them for a lifetime." — Unknown
