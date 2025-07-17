# GitHub CLI & Git Commands Guide

## 📋 Daftar Isi

1. [Instalasi GitHub CLI](#instalasi-github-cli)
2. [Autentikasi](#autentikasi)
3. [Repository Management](#repository-management)
4. [Git Basic Commands](#git-basic-commands)
5. [Branch Management](#branch-management)
6. [Pull Request & Issues](#pull-request--issues)
7. [Advanced GitHub CLI](#advanced-github-cli)
8. [Git Workflow](#git-workflow)
9. [Troubleshooting](#troubleshooting)

---

## 🚀 Instalasi GitHub CLI

### Windows
```bash
# Menggunakan winget
winget install --id GitHub.cli

# Menggunakan Chocolatey
choco install gh

# Menggunakan Scoop
scoop install gh
```

### macOS
```bash
# Menggunakan Homebrew
brew install gh

# Menggunakan MacPorts
sudo port install gh
```

### Linux
```bash
# Ubuntu/Debian
sudo apt install gh

# Fedora/CentOS/RHEL
sudo dnf install gh

# Arch Linux
sudo pacman -S github-cli
```

---

## 🔐 Autentikasi

### Login ke GitHub
```bash
# Login dengan browser
gh auth login

# Login dengan token
gh auth login --with-token < mytoken.txt

# Cek status login
gh auth status

# Logout
gh auth logout
```

### Setup Git Global Config
```bash
# Set nama dan email
git config --global user.name "Nama Anda"
git config --global user.email "email@example.com"

# Cek konfigurasi
git config --global --list
```

---

## 📁 Repository Management

### Membuat Repository
```bash
# Buat repo baru di GitHub
gh repo create nama-repo

# Buat repo dengan deskripsi
gh repo create nama-repo --description "Deskripsi repo"

# Buat repo private
gh repo create nama-repo --private

# Buat repo dengan template
gh repo create nama-repo --template username/template-repo

# Clone repo setelah dibuat
gh repo create nama-repo --clone
```

### Clone Repository
```bash
# Clone repo dengan GitHub CLI
gh repo clone username/repo-name

# Clone repo dengan Git
git clone https://github.com/username/repo-name.git

# Clone repo private
gh repo clone username/private-repo
```

### Repository Information
```bash
# Lihat info repo
gh repo view

# Lihat info repo spesifik
gh repo view username/repo-name

# Lihat repo list
gh repo list

# Lihat repo list user lain
gh repo list username
```

---

## 🛠️ Git Basic Commands

### Inisialisasi dan Status
```bash
# Inisialisasi git repo
git init

# Cek status
git status

# Cek status singkat
git status -s

# Lihat log commit
git log

# Lihat log singkat
git log --oneline
```

### Staging dan Commit
```bash
# Add file ke staging
git add filename.txt

# Add semua file
git add .

# Add file dengan pattern
git add *.js

# Commit dengan message
git commit -m "Pesan commit"

# Commit dan add sekaligus
git commit -am "Pesan commit"

# Amend commit terakhir
git commit --amend -m "Pesan baru"
```

### Remote Repository
```bash
# Tambah remote origin
git remote add origin https://github.com/username/repo-name.git

# Lihat remote
git remote -v

# Push ke remote
git push origin main

# Push pertama kali
git push -u origin main

# Pull dari remote
git pull origin main

# Fetch dari remote
git fetch origin
```

---

## 🌿 Branch Management

### Membuat dan Beralih Branch
```bash
# Lihat branch
git branch

# Lihat semua branch (local dan remote)
git branch -a

# Buat branch baru
git branch nama-branch

# Beralih ke branch
git checkout nama-branch

# Buat dan beralih ke branch baru
git checkout -b nama-branch

# Atau dengan git switch (Git 2.23+)
git switch nama-branch
git switch -c nama-branch
```

### Merge dan Delete Branch
```bash
# Merge branch ke main
git checkout main
git merge nama-branch

# Delete branch local
git branch -d nama-branch

# Force delete branch local
git branch -D nama-branch

# Delete branch remote
git push origin --delete nama-branch
```

---

## 🔄 Pull Request & Issues

### Pull Request
```bash
# Buat pull request
gh pr create --title "Judul PR" --body "Deskripsi PR"

# Buat PR dengan template
gh pr create --title "Judul PR" --body-file template.md

# Lihat PR list
gh pr list

# Lihat PR detail
gh pr view 123

# Checkout PR
gh pr checkout 123

# Merge PR
gh pr merge 123

# Close PR
gh pr close 123

# Review PR
gh pr review 123 --approve
gh pr review 123 --request-changes --body "Perlu perbaikan"
```

### Issues
```bash
# Buat issue baru
gh issue create --title "Judul Issue" --body "Deskripsi issue"

# Lihat issue list
gh issue list

# Lihat issue detail
gh issue view 123

# Close issue
gh issue close 123

# Reopen issue
gh issue reopen 123

# Assign issue
gh issue edit 123 --add-assignee username
```

---

## 🔧 Advanced GitHub CLI

### Gist Management
```bash
# Buat gist
gh gist create filename.txt

# Buat gist private
gh gist create filename.txt --secret

# Lihat gist list
gh gist list

# Edit gist
gh gist edit gist-id
```

### Release Management
```bash
# Buat release
gh release create v1.0.0

# Buat release dengan file
gh release create v1.0.0 dist/*.zip

# Lihat release list
gh release list

# Download release
gh release download v1.0.0
```

### Workflow (Actions)
```bash
# Lihat workflow runs
gh run list

# Lihat workflow detail
gh run view 123

# Download workflow artifacts
gh run download 123

# Trigger workflow
gh workflow run workflow-name
```

---

## 🔄 Git Workflow

### Gitflow Workflow
```bash
# 1. Update main branch
git checkout main
git pull origin main

# 2. Buat feature branch
git checkout -b feature/nama-fitur

# 3. Kerjakan fitur dan commit
git add .
git commit -m "Tambah fitur baru"

# 4. Push branch
git push origin feature/nama-fitur

# 5. Buat pull request
gh pr create --title "Fitur: Nama Fitur" --body "Deskripsi fitur"

# 6. Setelah review, merge dan cleanup
gh pr merge --squash
git checkout main
git pull origin main
git branch -d feature/nama-fitur
```

### Hotfix Workflow
```bash
# 1. Buat hotfix branch dari main
git checkout main
git pull origin main
git checkout -b hotfix/nama-fix

# 2. Fix bug dan commit
git add .
git commit -m "Fix: Perbaikan bug"

# 3. Push dan buat PR
git push origin hotfix/nama-fix
gh pr create --title "Hotfix: Nama Fix" --body "Deskripsi perbaikan"

# 4. Merge dengan fast-forward
gh pr merge --merge
```

---

## 🔍 Troubleshooting

### Common Issues

#### Permission Denied
```bash
# Cek SSH key
ssh -T git@github.com

# Generate SSH key baru
ssh-keygen -t ed25519 -C "email@example.com"

# Add SSH key ke ssh-agent
ssh-add ~/.ssh/id_ed25519

# Add SSH key ke GitHub
gh ssh-key add ~/.ssh/id_ed25519.pub
```

#### Merge Conflicts
```bash
# Lihat file yang conflict
git status

# Setelah resolve manual
git add .
git commit -m "Resolve merge conflict"

# Atau abort merge
git merge --abort
```

#### Reset Changes
```bash
# Unstage file
git reset HEAD filename

# Discard changes
git checkout -- filename

# Reset ke commit tertentu
git reset --hard commit-hash

# Reset soft (keep changes)
git reset --soft HEAD~1
```

---

## 📝 Tips & Best Practices

### Commit Messages
- Gunakan present tense: "Add feature" bukan "Added feature"
- Maksimal 50 karakter untuk judul
- Gunakan body untuk penjelasan detail jika perlu

### Branch Naming
```
feature/nama-fitur
bugfix/nama-bug
hotfix/nama-hotfix
chore/nama-task
```

### GitHub CLI Aliases
```bash
# Set alias untuk command yang sering digunakan
gh alias set prc "pr create"
gh alias set prv "pr view"
gh alias set prl "pr list"
gh alias set iv "issue view"
gh alias set il "issue list"
```

### Useful Git Aliases
```bash
# Set git aliases
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.lg "log --oneline --graph --decorate"
```

---

## 🎯 Quick Reference

### Daily Commands
```bash
# Morning routine
git checkout main
git pull origin main
git checkout -b feature/new-task

# Working
git add .
git commit -m "Progress on feature"
git push origin feature/new-task

# End of day
gh pr create --title "WIP: Feature" --draft
```

### Emergency Commands
```bash
# Stash changes quickly
git stash

# Apply stash back
git stash pop

# Quick fix and push
git add . && git commit -m "Quick fix" && git push
```

---

## 📚 Resources

- [GitHub CLI Documentation](https://cli.github.com/manual/)
- [Git Documentation](https://git-scm.com/doc)
- [GitHub Docs](https://docs.github.com)
- [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)

---
