# 🚀 Release Checklist for `PowerCat`

```txt
 ███████████ █████                                                                       
░█░░░███░░░█░░███                                                                        
░   ░███  ░  ░███████    ██████                                                          
    ░███     ░███░░███  ███░░███                                                         
    ░███     ░███ ░███ ░███████                                                          
    ░███     ░███ ░███ ░███░░░                                                           
    █████    ████ █████░░██████                                                          
   ░░░░░    ░░░░ ░░░░░  ░░░░░░                                                           
                                                                                         
    ███████               ████   ███                    █████                            
  ███░░░░░███            ░░███  ░░░                    ░░███                             
 ███     ░░███ ████████   ░███  ████   ██████   █████  ███████                           
░███      ░███░░███░░███  ░███ ░░███  ███░░███ ███░░  ░░░███░                            
░███      ░███ ░███ ░███  ░███  ░███ ░███████ ░░█████   ░███                             
░░███     ███  ░███ ░███  ░███  ░███ ░███░░░   ░░░░███  ░███ ███                         
 ░░░███████░   ████ █████ █████ █████░░██████  ██████   ░░█████                          
   ░░░░░░░    ░░░░ ░░░░░ ░░░░░ ░░░░░  ░░░░░░  ░░░░░░     ░░░░░                           
                                                                                         
 ██████   ██████            █████     █████                       █████     ███          
░░██████ ██████            ░░███     ░░███                       ░░███     ░░░           
 ░███░█████░███   ██████   ███████   ███████    ██████    █████  ███████   ████   ██████ 
 ░███░░███ ░███  ░░░░░███ ░░░███░   ░░░███░    ░░░░░███  ███░░  ░░░███░   ░░███  ███░░███
 ░███ ░░░  ░███   ███████   ░███      ░███      ███████ ░░█████   ░███     ░███ ░███ ░░░ 
 ░███      ░███  ███░░███   ░███ ███  ░███ ███ ███░░███  ░░░░███  ░███ ███ ░███ ░███  ███
 █████     █████░░████████  ░░█████   ░░█████ ░░████████ ██████   ░░█████  █████░░██████ 
░░░░░     ░░░░░  ░░░░░░░░    ░░░░░     ░░░░░   ░░░░░░░░ ░░░░░░     ░░░░░  ░░░░░  ░░░░░░  
```

This checklist ensures that every release is consistent across GitHub and the PowerShell Gallery, because I cannot trust my own memory.

## 🌒 1. Bump the Module Version

- Open `src/PowerCat/PowerCat.psd1`.
- Update the `ModuleVersion` field:

```powershell
ModuleVersion = '1.0.X'
```

- Update `ReleaseNotes` in the manifest to summarize changes.

## 🌓 2. Commit the Change

```powershell
git add src/PowerCat/PowerCat.psd1
git commit -m "Bump version to v1.0.X"
git push origin main
```

## 🌔 3. Tag the Release

- Create a Git tag that matches the version:

```powershell
git tag v1.0.X
git push origin v1.0.X
```

- You can also create the tag in VS Code:
  - Open the **Source Control** panel.
  - Click the branch name → **Create Tag…** → enter `v1.0.X`.
  - Push the tag via **Command Palette → Git: Push Tags**.

## 🌕 4. GitHub Actions CI/CD

- The workflow will:
  - Run Pester tests.
  - If tests pass ✅, publish the module to the PowerShell Gallery using your API key secret (`PSGALLERY_KEY`).

## 🌖 5. Verify the Release

- Check the GitHub Actions run → ensure both **test** and **publish** jobs succeeded.
- Verify on PowerShell Gallery:

```powershell
Find-Module PowerCat
```

  Should show the new version.

## 🌗 6. (Optional) Create a GitHub Release Page

- Go to your repo → **Releases** → **Draft a new release**.
- Select the tag `v1.0.X`.
- Copy the `ReleaseNotes` from `src/PowerCat/PowerCat.psd1` or `CHANGELOG.md`.

## 🌘 Quick Summary

1. **Bump version** in `.psd1`.  
2. **Commit & push**.  
3. **Tag & push** (`vX.Y.Z`).  
4. Let **GitHub Actions** test + publish.  
5. **Verify** on Gallery.  
6. (Optional) Draft GitHub Release.
