# Panduan Lengkap GitHub CLI & Git Commands

## 📋 Daftar Isi

1. [Instalasi GitHub CLI](#-instalasi-github-cli)
2. [Autentikasi dan Konfigurasi](#-autentikasi-dan-konfigurasi)
3. [Manajemen Repository](#-manajemen-repository)
4. [Perintah Dasar Git](#-perintah-dasar-git)
5. [Manajemen Branch](#-manajemen-branch)
6. [Pull Request & Issues](#-pull-request--issues)
7. [Fitur Lanjutan GitHub CLI](#-fitur-lanjutan-github-cli)
8. [Workflow Git](#-workflow-git)
9. [Troubleshooting](#-troubleshooting)
10. [Tips & Best Practices](#-tips--best-practices)

---

## 🛠️ Instalasi GitHub CLI

### Windows
```bash
# Menggunakan Windows Package Manager (winget)
# Perintah ini akan mengunduh dan menginstal GitHub CLI secara otomatis
winget install --id GitHub.cli

# Menggunakan Chocolatey Package Manager
# Pastikan Chocolatey sudah terinstal di sistem Anda
choco install gh

# Menggunakan Scoop Package Manager
# Scoop adalah package manager ringan untuk Windows
scoop install gh
```

### macOS
```bash
# Menggunakan Homebrew (package manager paling populer untuk macOS)
# Perintah ini akan menginstal GitHub CLI beserta dependensinya
brew install gh

# Menggunakan MacPorts (alternatif package manager)
# Memerlukan password administrator untuk instalasi
sudo port install gh
```

### Linux
```bash
# Untuk distribusi berbasis Debian/Ubuntu
# apt adalah package manager default untuk Ubuntu
sudo apt install gh

# Untuk distribusi berbasis Red Hat (Fedora/CentOS/RHEL)
# dnf adalah package manager modern untuk Red Hat
sudo dnf install gh

# Untuk Arch Linux dan turunannya
# pacman adalah package manager untuk Arch Linux
sudo pacman -S github-cli
```

### Verifikasi Instalasi
```bash
# Cek versi GitHub CLI yang terinstal
# Perintah ini akan menampilkan versi dan info build
gh --version

# Tampilkan bantuan GitHub CLI
# Menampilkan daftar command yang tersedia
gh help
```

---

## 🔐 Autentikasi dan Konfigurasi

### Login ke GitHub
```bash
# Login menggunakan browser (metode yang disarankan)
# Perintah ini akan membuka browser untuk autentikasi
gh auth login

# Login menggunakan token personal
# Ganti 'your-token-here' dengan token GitHub Anda
echo "your-token-here" | gh auth login --with-token

# Login dengan memilih metode autentikasi
# Memberikan pilihan antara HTTPS atau SSH
gh auth login --web

# Cek status login saat ini
# Menampilkan user yang sedang login dan scope token
gh auth status

# Logout dari GitHub CLI
# Menghapus kredensial yang tersimpan
gh auth logout
```

### Konfigurasi Git Global
```bash
# Set nama pengguna secara global
# Nama ini akan muncul di semua commit yang Anda buat
git config --global user.name "Nama Lengkap Anda"

# Set email pengguna secara global
# Email ini akan digunakan untuk semua commit
git config --global user.email "email@domain.com"

# Set editor default untuk Git
# Menentukan editor yang akan digunakan untuk commit message
git config --global core.editor "code --wait"  # Untuk VS Code
git config --global core.editor "vim"          # Untuk Vim
git config --global core.editor "nano"         # Untuk Nano

# Lihat semua konfigurasi global
# Menampilkan daftar lengkap konfigurasi Git
git config --global --list

# Cek konfigurasi spesifik
git config --global user.name    # Tampilkan nama yang dikonfigurasi
git config --global user.email   # Tampilkan email yang dikonfigurasi
```

---

## 📁 Manajemen Repository

### Membuat Repository Baru
```bash
# Buat repository baru di GitHub
# Perintah ini akan membuat repo public secara default
gh repo create nama-repository

# Buat repository dengan deskripsi
# Deskripsi membantu orang lain memahami tujuan repository
gh repo create nama-repository --description "Deskripsi singkat tentang project"

# Buat repository private
# Repository private hanya bisa diakses oleh Anda dan kolaborator
gh repo create nama-repository --private

# Buat repository public secara eksplisit
# Meskipun default adalah public, Anda bisa memastikannya
gh repo create nama-repository --public

# Buat repository dengan template
# Menggunakan repository lain sebagai template
gh repo create nama-repository --template username/template-repo

# Buat repository dan langsung clone ke lokal
# Perintah ini akan membuat repo di GitHub dan clone ke komputer
gh repo create nama-repository --clone

# Buat repository dengan berbagai opsi sekaligus
gh repo create nama-repository \
  --description "Project keren saya" \
  --private \
  --clone \
  --gitignore "Node"
```

### Clone Repository
```bash
# Clone repository menggunakan GitHub CLI
# Metode ini otomatis menggunakan autentikasi yang sudah dikonfigurasi
gh repo clone username/nama-repository

# Clone repository ke direktori tertentu
# Menentukan nama folder tujuan
gh repo clone username/nama-repository nama-folder-lokal

# Clone repository dengan Git tradisional (HTTPS)
# Memerlukan username dan password/token saat push
git clone https://github.com/username/nama-repository.git

# Clone repository dengan SSH
# Memerlukan SSH key yang sudah dikonfigurasi di GitHub
git clone git@github.com:username/nama-repository.git

# Clone repository private
# GitHub CLI akan otomatis menggunakan autentikasi
gh repo clone username/private-repository
```

### Informasi Repository
```bash
# Lihat informasi repository saat ini
# Menampilkan deskripsi, bahasa, stars, forks, dll
gh repo view

# Lihat informasi repository tertentu
# Tanpa perlu berada di dalam folder repository
gh repo view username/nama-repository

# Lihat informasi repository dalam format JSON
# Berguna untuk scripting atau parsing data
gh repo view username/nama-repository --json name,description,stargazers

# Lihat daftar repository milik Anda
# Menampilkan semua repository yang Anda miliki
gh repo list

# Lihat repository milik user lain
# Menampilkan repository public dari user tertentu
gh repo list username

# Lihat repository dengan filter
gh repo list --limit 10           # Batasi jumlah hasil
gh repo list --language python    # Filter berdasarkan bahasa
gh repo list --archived          # Hanya repository yang diarsipkan
```

---

## 🛠️ Perintah Dasar Git

### Inisialisasi dan Status
```bash
# Inisialisasi repository Git baru
# Membuat folder .git dan setup repository kosong
git init

# Inisialisasi dengan branch utama bernama 'main'
# Sesuai dengan standar terbaru GitHub
git init --initial-branch=main

# Cek status file dalam repository
# Menampilkan file yang dimodifikasi, ditambah, atau dihapus
git status

# Cek status dalam format singkat
# Menampilkan status dalam format yang lebih ringkas
git status --short

# Lihat riwayat commit
# Menampilkan daftar commit dengan detail lengkap
git log

# Lihat riwayat commit dalam satu baris
# Format yang lebih ringkas dan mudah dibaca
git log --oneline

# Lihat riwayat commit dengan grafik
# Menampilkan struktur branch dan merge
git log --graph --oneline --decorate

# Lihat perubahan yang belum di-commit
# Menampilkan perbedaan antara working directory dan staging area
git diff

# Lihat perubahan yang sudah di-stage
# Menampilkan perbedaan antara staging area dan commit terakhir
git diff --cached
```

### Staging dan Commit
```bash
# Tambahkan file spesifik ke staging area
# Hanya file yang ditentukan yang akan di-commit
git add nama-file.txt

# Tambahkan semua file yang dimodifikasi
# Perintah ini akan menambahkan semua perubahan ke staging area
git add .

# Tambahkan file dengan pattern tertentu
# Menggunakan wildcard untuk menambahkan file dengan ekstensi sama
git add *.js          # Semua file JavaScript
git add src/*.py      # Semua file Python di folder src
git add **/*.css      # Semua file CSS di semua subdirektori

# Tambahkan file secara interaktif
# Memungkinkan Anda memilih bagian mana yang akan di-stage
git add --interactive

# Commit perubahan dengan pesan
# Pesan commit harus menjelaskan perubahan yang dibuat
git commit -m "Tambah fitur login pengguna"

# Commit dengan pesan multi-baris
# Baris pertama adalah judul, baris selanjutnya adalah deskripsi
git commit -m "Tambah fitur login pengguna

- Implementasi form login
- Validasi email dan password
- Integrasi dengan database
- Tambah unit test"

# Commit semua perubahan tracked files
# Menggabungkan 'git add' dan 'git commit' untuk file yang sudah tracked
git commit -am "Perbaiki bug validasi form"

# Ubah commit terakhir
# Menambahkan perubahan ke commit terakhir atau mengubah pesan
git commit --amend -m "Pesan commit yang diperbaiki"

# Commit kosong (untuk trigger CI/CD)
# Membuat commit tanpa perubahan file
git commit --allow-empty -m "Trigger deployment"
```

### Remote Repository
```bash
# Tambahkan remote repository
# Menghubungkan repository lokal dengan repository di GitHub
git remote add origin https://github.com/username/nama-repository.git

# Lihat daftar remote yang dikonfigurasi
# Menampilkan nama remote dan URL-nya
git remote -v

# Ubah URL remote
# Berguna saat mengubah dari HTTPS ke SSH atau sebaliknya
git remote set-url origin git@github.com:username/nama-repository.git

# Hapus remote
# Menghapus koneksi ke remote repository
git remote remove origin

# Push perubahan ke remote repository
# Mengirim commit lokal ke GitHub
git push origin main

# Push untuk pertama kali dengan set upstream
# Mengatur branch lokal untuk track branch remote
git push -u origin main

# Push semua branch
# Mengirim semua branch lokal ke remote
git push --all origin

# Pull perubahan dari remote
# Mengambil dan menggabungkan perubahan dari GitHub
git pull origin main

# Fetch perubahan tanpa merge
# Mengambil perubahan terbaru tanpa menggabungkan
git fetch origin

# Fetch semua branch
# Mengambil informasi tentang semua branch di remote
git fetch --all
```

---

## 🌿 Manajemen Branch

### Membuat dan Beralih Branch
```bash
# Lihat daftar branch lokal
# Menampilkan semua branch di repository lokal
git branch

# Lihat semua branch (lokal dan remote)
# Menampilkan branch lokal dan remote dengan warna berbeda
git branch -a

# Lihat branch remote saja
# Menampilkan hanya branch yang ada di remote repository
git branch -r

# Buat branch baru
# Membuat branch baru berdasarkan branch saat ini
git branch nama-branch-baru

# Buat branch dari commit tertentu
# Membuat branch dari commit hash yang spesifik
git branch nama-branch-baru abc1234

# Beralih ke branch yang sudah ada
# Mengubah working directory ke branch yang ditentukan
git checkout nama-branch

# Buat branch baru dan langsung beralih ke sana
# Menggabungkan pembuatan branch dan checkout
git checkout -b nama-branch-baru

# Menggunakan git switch (perintah yang lebih modern)
# Beralih ke branch yang sudah ada
git switch nama-branch

# Buat branch baru dan beralih dengan git switch
git switch -c nama-branch-baru

# Kembali ke branch sebelumnya
# Seperti 'cd -' di terminal
git switch -

# Lihat branch yang sedang aktif
# Menampilkan nama branch saat ini
git branch --show-current
```

### Merge dan Rebase
```bash
# Merge branch ke branch saat ini
# Menggabungkan perubahan dari branch lain
git checkout main
git merge nama-branch-fitur

# Merge dengan pesan commit kustom
# Membuat merge commit dengan pesan yang ditentukan
git merge nama-branch-fitur -m "Merge fitur authentication"

# Merge tanpa fast-forward
# Selalu membuat merge commit meskipun bisa fast-forward
git merge --no-ff nama-branch-fitur

# Rebase branch saat ini ke branch lain
# Memindahkan commit ke atas branch yang ditentukan
git rebase main

# Rebase interaktif
# Memungkinkan edit, squash, atau reorder commit
git rebase -i HEAD~3

# Batalkan rebase yang sedang berlangsung
# Mengembalikan ke kondisi sebelum rebase
git rebase --abort

# Lanjutkan rebase setelah menyelesaikan conflict
# Melanjutkan proses rebase setelah resolve conflict
git rebase --continue
```

### Menghapus Branch
```bash
# Hapus branch lokal (safe delete)
# Hanya menghapus branch yang sudah di-merge
git branch -d nama-branch

# Hapus branch lokal secara paksa
# Menghapus branch meskipun belum di-merge
git branch -D nama-branch

# Hapus branch remote
# Menghapus branch dari GitHub
git push origin --delete nama-branch

# Hapus branch remote (sintaks alternatif)
git push origin :nama-branch

# Hapus branch lokal dan remote sekaligus
git branch -d nama-branch && git push origin --delete nama-branch

# Bersihkan branch remote yang sudah dihapus
# Menghapus referensi lokal ke branch remote yang sudah tidak ada
git remote prune origin
```

---

## 🔄 Pull Request & Issues

### Manajemen Pull Request
```bash
# Buat pull request baru
# Membuat PR dari branch saat ini ke branch default
gh pr create --title "Judul Pull Request" --body "Deskripsi detail perubahan"

# Buat PR dengan template
# Menggunakan file template untuk body PR
gh pr create --title "Fitur Login" --body-file .github/pull_request_template.md

# Buat PR ke branch tertentu
# Menentukan base branch selain default
gh pr create --title "Hotfix Bug" --base develop --head feature/bug-fix

# Buat draft PR
# PR yang belum siap untuk di-review
gh pr create --title "WIP: Fitur Baru" --draft

# Lihat daftar PR
# Menampilkan semua PR dalam repository
gh pr list

# Filter PR berdasarkan status
gh pr list --state open     # PR yang masih terbuka
gh pr list --state closed   # PR yang sudah ditutup
gh pr list --state merged   # PR yang sudah di-merge

# Lihat PR berdasarkan author
gh pr list --author username

# Lihat detail PR
# Menampilkan informasi lengkap tentang PR
gh pr view 123

# Lihat PR dalam browser
# Membuka PR di GitHub web
gh pr view 123 --web

# Checkout PR untuk testing
# Mengunduh dan beralih ke branch PR
gh pr checkout 123

# Review PR
gh pr review 123 --approve                           # Approve PR
gh pr review 123 --request-changes --body "Perlu perbaikan di line 45"  # Request changes
gh pr review 123 --comment --body "Terlihat bagus!"  # Komentar saja

# Merge PR
gh pr merge 123                    # Merge biasa
gh pr merge 123 --squash          # Squash merge
gh pr merge 123 --rebase          # Rebase merge

# Close PR tanpa merge
gh pr close 123

# Reopen PR yang sudah ditutup
gh pr reopen 123
```

### Manajemen Issues
```bash
# Buat issue baru
# Membuat issue dengan judul dan deskripsi
gh issue create --title "Bug: Login tidak berfungsi" --body "Deskripsi detail bug"

# Buat issue dengan label
# Menambahkan label saat membuat issue
gh issue create --title "Feature Request" --body "Deskripsi fitur" --label "enhancement"

# Buat issue dan assign ke seseorang
gh issue create --title "Task: Update documentation" --assignee username

# Lihat daftar issues
gh issue list

# Filter issues berdasarkan status
gh issue list --state open     # Issues yang masih terbuka
gh issue list --state closed   # Issues yang sudah ditutup

# Filter issues berdasarkan label
gh issue list --label "bug"
gh issue list --label "enhancement"

# Filter issues yang di-assign ke Anda
gh issue list --assignee @me

# Lihat detail issue
gh issue view 456

# Edit issue
gh issue edit 456 --title "Judul baru"
gh issue edit 456 --body "Deskripsi yang diperbarui"
gh issue edit 456 --add-label "priority-high"
gh issue edit 456 --add-assignee username

# Close issue
gh issue close 456

# Reopen issue
gh issue reopen 456

# Komentar pada issue
gh issue comment 456 --body "Ini komentar saya"
```

---

## 🔧 Fitur Lanjutan GitHub CLI

### Manajemen Gist
```bash
# Buat gist dari file
# Membuat gist public dari file lokal
gh gist create nama-file.js

# Buat gist private
# Gist yang hanya bisa diakses dengan link
gh gist create nama-file.js --secret

# Buat gist dengan deskripsi
gh gist create nama-file.js --desc "Contoh kode JavaScript"

# Buat gist dari multiple files
gh gist create file1.js file2.css file3.html

# Lihat daftar gist milik Anda
gh gist list

# Lihat isi gist
gh gist view gist-id

# Edit gist
gh gist edit gist-id

# Clone gist
gh gist clone gist-id

# Hapus gist
gh gist delete gist-id
```

### Manajemen Release
```bash
# Buat release baru
# Membuat release dengan tag version
gh release create v1.0.0

# Buat release dengan judul dan deskripsi
gh release create v1.0.0 --title "Release v1.0.0" --notes "Fitur baru dan perbaikan bug"

# Buat release dengan file attachment
# Menambahkan file binary ke release
gh release create v1.0.0 dist/app.exe dist/app.dmg

# Buat draft release
# Release yang belum dipublikasikan
gh release create v1.0.0 --draft

# Buat pre-release
# Menandai sebagai versi beta atau RC
gh release create v1.0.0-beta --prerelease

# Lihat daftar releases
gh release list

# Lihat detail release
gh release view v1.0.0

# Download release
gh release download v1.0.0

# Download file tertentu dari release
gh release download v1.0.0 --pattern "*.zip"

# Edit release
gh release edit v1.0.0 --title "Judul baru"

# Hapus release
gh release delete v1.0.0
```

### GitHub Actions (Workflows)
```bash
# Lihat daftar workflow runs
# Menampilkan riwayat eksekusi workflow
gh run list

# Lihat runs untuk workflow tertentu
gh run list --workflow "CI/CD"

# Lihat detail run
gh run view 123456

# Lihat log run
gh run view 123456 --log

# Download artifacts
# Mengunduh file hasil build dari workflow
gh run download 123456

# Trigger manual workflow
# Menjalankan workflow yang memiliki trigger manual
gh workflow run workflow-name

# Lihat daftar workflows
gh workflow list

# Disable workflow
gh workflow disable workflow-name

# Enable workflow
gh workflow enable workflow-name
```

---

## 🔄 Workflow Git

### Gitflow Workflow
```bash
# === PERSIAPAN PROJECT ===
# 1. Clone repository dan setup
gh repo clone username/project-name
cd project-name

# 2. Pastikan branch main up-to-date
git checkout main
git pull origin main

# === MENGEMBANGKAN FITUR BARU ===
# 3. Buat branch fitur baru
# Penamaan: feature/nama-fitur-singkat
git checkout -b feature/user-authentication

# 4. Kembangkan fitur dengan commit yang sering
git add .
git commit -m "Tambah model User dan database schema"

git add .
git commit -m "Implementasi login dan register endpoint"

git add .
git commit -m "Tambah middleware authentication"

git add .
git commit -m "Tambah unit test untuk authentication"

# 5. Push branch ke remote
git push -u origin feature/user-authentication

# 6. Buat pull request
gh pr create --title "Fitur: User Authentication" --body "
Implementasi sistem autentikasi pengguna:

## Perubahan
- [x] Model User dan database schema
- [x] Endpoint login dan register
- [x] Middleware authentication
- [x] Unit test lengkap

## Testing
- [x] Unit test passed
- [x] Integration test passed
- [x] Manual testing completed

## Screenshot
![Login Form](screenshot-login.png)
"

# === REVIEW DAN MERGE ===
# 7. Setelah review selesai, merge PR
gh pr merge --squash

# 8. Cleanup branch lokal
git checkout main
git pull origin main
git branch -d feature/user-authentication
```

### Hotfix Workflow
```bash
# === HOTFIX UNTUK BUG KRITIS ===
# 1. Mulai dari branch main yang terbaru
git checkout main
git pull origin main

# 2. Buat branch hotfix
# Penamaan: hotfix/deskripsi-bug-singkat
git checkout -b hotfix/fix-login-security-vulnerability

# 3. Perbaiki bug dengan fokus
git add .
git commit -m "Fix: Perbaiki vulnerability SQL injection di login"

# 4. Push dan buat PR dengan prioritas tinggi
git push -u origin hotfix/fix-login-security-vulnerability
gh pr create --title "HOTFIX: Security vulnerability di login" --body "
🚨 **URGENT SECURITY FIX** 🚨

## Masalah
- SQL injection vulnerability di endpoint login
- Memungkinkan akses unauthorized

## Solusi
- Implementasi prepared statements
- Validasi input yang lebih ketat
- Sanitasi parameter query

## Testing
- [x] Manual testing dengan berbagai input
- [x] Security scan passed
- [x] Existing tests still passing

Perlu segera di-merge dan deploy!
"

# 5. Merge dengan fast-forward (tanpa squash untuk hotfix)
gh pr merge --merge

# 6. Cleanup
git checkout main
git pull origin main
git branch -d hotfix/fix-login-security-vulnerability
```

### Collaborative Workflow
```bash
# === KOLABORASI DALAM TEAM ===
# 1. Sync dengan upstream repository (untuk fork)
git remote add upstream https://github.com/original-owner/repo.git
git fetch upstream
git checkout main
git merge upstream/main
git push origin main

# 2. Sebelum mulai coding, selalu update
git checkout main
git pull origin main

# 3. Buat branch dengan naming convention team
# Format: [type]/[ticket-number]-[short-description]
git checkout -b feat/JIRA-123-add-payment-gateway

# 4. Commit dengan conventional commits
git commit -m "feat: tambah integration payment gateway

- Implementasi Stripe payment
- Tambah webhook handler
- Update database schema

Closes #123"

# 5. Rebase sebelum push (untuk history yang bersih)
git checkout main
git pull origin main
git checkout feat/JIRA-123-add-payment-gateway
git rebase main

# 6. Push dengan force-with-lease (lebih aman dari --force)
git push --force-with-lease origin feat/JIRA-123-add-payment-gateway

# 7. Buat PR dengan template lengkap
gh pr create --title "feat: Tambah Payment Gateway Integration" --body "
## 📝 Deskripsi
Implementasi payment gateway menggunakan Stripe untuk mendukung pembayaran online.

## 🎯 Jira Ticket
- [JIRA-123](https://company.atlassian.net/browse/JIRA-123)

## ✅ Checklist
- [x] Code implementation
- [x] Unit tests
- [x] Integration tests  
- [x] Documentation update
- [x] Security review
- [x] Performance testing

## 🧪 Testing
\`\`\`bash
npm test
npm run test:integration
npm run test:e2e
\`\`\`

## 📸 Screenshots
![Payment Flow](./docs/payment-flow.png)

## 🔍 Review Notes
- Perhatikan error handling di webhook
- Validasi semua edge cases
- Cek compliance dengan PCI DSS
"
```

---

## 🚨 Troubleshooting

### Masalah Autentikasi
```bash
# === PERMISSION DENIED ERROR ===
# Problem: git push gagal dengan permission denied
# Solution 1: Cek koneksi SSH
ssh -T git@github.com

# Jika gagal, generate SSH key baru
ssh-keygen -t ed25519 -C "email@domain.com"

# Tambahkan SSH key ke ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Tambahkan SSH key ke GitHub
gh ssh-key add ~/.ssh/id_ed25519.pub --title "Laptop Development"

# Solution 2: Gunakan HTTPS dengan token
git remote set-url origin https://github.com/username/repo.git
# Saat diminta password, gunakan Personal Access Token

# === TOKEN EXPIRED ===
# Problem: GitHub CLI token expired
# Solution: Login ulang
gh auth logout
gh auth login

# Refresh token
gh auth refresh
```

### Masalah Merge Conflicts
```bash
# === RESOLVE MERGE CONFLICTS ===
# Problem: Conflict saat merge atau pull
# 1. Lihat file yang conflict
git status

# 2. Edit file yang conflict secara manual
# Cari marker: <<<<<<<, =======, >>>>>>>
# Hapus marker dan pilih kode yang benar

# 3. Tandai conflict sebagai resolved
git add file-yang-conflict.js

# 4. Commit hasil resolve
git commit -m "Resolve merge conflict di file-yang-conflict.js"

# === ABORT MERGE ===
# Jika ingin batalkan merge
git merge --abort

# === RESOLVE DENGAN TOOLS ===
# Menggunakan merge tool (VS Code, KDiff3, etc.)
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'
git mergetool
```

### Masalah Git History
```bash
# === UNDO LAST COMMIT ===
# Undo commit terakhir tapi keep changes
git reset --soft HEAD~1

# Undo commit dan changes
git reset --hard HEAD~1

# Undo commit terakhir di remote (DANGEROUS!)
git push --force-with-lease origin main

# === REVERT COMMIT ===
# Safer way: buat commit baru yang membatalkan commit lama
git revert commit-hash

# === CLEAN WORKING DIRECTORY ===
# Hapus semua untracked files
git clean -fd

# Hapus semua changes yang belum di-commit
git checkout -- .

# Reset ke commit tertentu
git reset --hard commit-hash

# === STASH CHANGES ===
# Simpan perubahan sementara
git stash

# Simpan dengan pesan
git stash save "Perubahan sementara untuk testing"

# Lihat daftar stash
git stash list

# Apply stash terakhir
git stash pop

# Apply stash tertentu
git stash apply stash@{1}

# Hapus stash
git stash drop stash@{1}
```

### Masalah Performance
```bash
# === REPOSITORY TERLALU BESAR ===
# Lihat ukuran repository
du -sh .git

# Lihat file terbesar dalam history
git rev-list --objects --all | git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' | awk '/^blob/ {print substr($0,6)}' | sort --numeric-sort --key=2 | tail -10

# Hapus file besar dari history (DANGEROUS!)
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch file-besar.zip' --prune-empty --tag-name-filter cat -- --all

# Atau gunakan BFG Repo Cleaner (lebih cepat)
java -jar bfg.jar --delete-files file-besar.zip
git reflog expire --expire=now --all && git gc --prune=now --aggressive

# === SLOW OPERATIONS ===
# Enable parallel processing
git config --global pack.threads 0

# Optimize repository
git gc --aggressive --prune=now

# Shallow clone untuk repo besar
git clone --depth 1 https://github.com/user/big-repo.git
```

---

## 💡 Tips & Best Practices

### Pesan Commit yang Baik
```bash
# === CONVENTIONAL COMMITS ===
# Format: <type>(<scope>): <description>
# 
# Types:
# feat: fitur baru
# fix: bug fix
# docs: dokumentasi
# style: formatting, missing semicolons, etc
# refactor: code refactoring
# test: tambah atau update tests
# chore: maintenance tasks

# Contoh pesan commit yang baik:
git commit -m "feat(auth): tambah fitur login dengan Google OAuth

- Implementasi Google OAuth 2.0
- Tambah button login dengan Google
- Update database schema untuk OAuth users
- Tambah middleware untuk validasi OAuth token

Closes #45"

git commit -m "fix(api): perbaiki bug pagination di endpoint users

- Fix offset calculation yang salah
- Tambah validation untuk limit parameter
- Update error handling untuk invalid page numbers

Fixes #67"

git commit -m "docs(readme): update installation instructions

- Tambah panduan untuk Windows users
- Update dependencies list
- Perbaiki broken links ke documentation

Co-authored-by: John Doe <john@example.com>"

# === TEMPLATE COMMIT MESSAGE ===
# Buat template untuk consistency
git config --global commit.template ~/.gitmessage

# Isi file ~/.gitmessage:
# <type>(<scope>): <subject>
# 
# <body>
# 
# <footer>
```

### Strategi Branching
```bash
# === NAMING CONVENTIONS ===
# Feature branches
feature/JIRA-123-user-authentication
feature/add-payment-gateway
feature/responsive-design

# Bug fix branches
bugfix/fix-login-redirect
bugfix/JIRA-456-memory-leak

# Hotfix branches
hotfix/security-vulnerability
hotfix/critical-performance-fix

# Release branches
release/v1.2.0
release/2023-12-sprint

# === BRANCH PROTECTION ===
# Setup branch protection via GitHub CLI
gh api repos/:owner/:repo/branches/main/protection \
  --method PUT \
  --field required_status_checks='{"strict":true,"contexts":["ci/build","ci/test"]}' \
  --field enforce_admins=true \
  --field required_pull_request_reviews='{"required_approving_review_count":2}' \
  --field restrictions=null
```

### Alias dan Shortcuts
```bash
# === GIT ALIASES ===
# Setup alias untuk perintah yang sering digunakan
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.cp cherry-pick
git config --global alias.df diff
git config --global alias.dc "diff --cached"

# Alias untuk log yang lebih cantik
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Alias untuk uncommit (undo last commit)
git config --global alias.uncommit "reset --soft HEAD~1"

# Alias untuk amend
git config --global alias.amend "commit --amend --no-edit"

# Alias untuk force push yang lebih aman
git config --global alias.pushf "push --force-with-lease"

# === GITHUB CLI ALIASES ===
# Setup alias untuk GitHub CLI
gh alias set prc "pr create"
gh alias set prv "pr view"
gh alias set prl "pr list"
gh alias set prm "pr merge"
gh alias set prs "pr status"

gh alias set iv "issue view"
gh alias set il "issue list"
gh alias set ic "issue create"

gh alias set rv "repo view"
gh alias set rl "repo list"
gh alias set rc "repo create"

# === SHELL ALIASES ===
# Tambahkan ke ~/.bashrc atau ~/.zshrc
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gco="git checkout"
alias gbr="git branch"
alias glog="git log --oneline --graph"

# Git flow aliases
alias gf="git flow"
alias gff="git flow feature"
alias gfr="git flow release"
alias gfh="git flow hotfix"
```

### Keamanan Repository
```bash
# === SECRETS MANAGEMENT ===
# Jangan pernah commit secrets/passwords!
# Setup .gitignore untuk file sensitif
echo "
# Secrets dan credentials
.env
.env.local
.env.production
config/secrets.json
*.key
*.pem
*.p12

# Database
*.db
*.sqlite
*.sqlite3

# Logs
*.log
logs/
npm-debug.log*

# Dependencies
node_modules/
vendor/
.vendor/

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db
" >> .gitignore

# === SCAN FOR SECRETS ===
# Install dan gunakan git-secrets
git secrets --register-aws
git secrets --install
git secrets --scan

# Atau gunakan truffleHog untuk scan secrets
truffleHog --regex --entropy=False https://github.com/user/repo.git

# === SIGNED COMMITS ===
# Setup GPG signing untuk verifikasi commit
gpg --full-generate-key
gpg --list-secret-keys --keyid-format LONG

# Configure git untuk menggunakan GPG
git config --global user.signingkey YOUR_KEY_ID
git config --global commit.gpgsign true
git config --global gpg.program gpg

# Upload GPG key ke GitHub
gpg --armor --export YOUR_KEY_ID | gh ssh-key add --title "GPG Key"
```

### Optimasi Workflow
```bash
# === HOOKS UNTUK AUTOMATION ===
# Pre-commit hook untuk format code
# File: .git/hooks/pre-commit
#!/bin/sh
# Format JavaScript/TypeScript files
npm run format
npm run lint

# Run tests
npm test

# Pre-push hook untuk additional checks
# File: .git/hooks/pre-push
#!/bin/sh
# Run full test suite
npm run test:full

# Security scan
npm audit

# Build check
npm run build

# === CONTINUOUS INTEGRATION ===
# Setup GitHub Actions untuk automation
# File: .github/workflows/ci.yml
name: CI/CD Pipeline

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '18'
        cache: 'npm'
    
    - name: Install dependencies
      run: npm ci
    
    - name: Run tests
      run: npm test
    
    - name: Run linting
      run: npm run lint
    
    - name: Build project
      run: npm run build

# === AUTOMATED DEPENDENCY UPDATES ===
# Setup Dependabot untuk update dependencies
# File: .github/dependabot.yml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
    open-pull-requests-limit: 10
```

---

## 🎯 Command Reference Cepat

### Perintah Harian
```bash
# === MORNING ROUTINE ===
# Update repository dan mulai kerja
git checkout main                    # Pindah ke branch utama
git pull origin main                 # Update dengan remote
git checkout -b feature/new-task     # Buat branch baru untuk task

# === WORKING ROUTINE ===
# Selama development
git add .                           # Stage perubahan
git commit -m "Progress: deskripsi" # Commit progress
git push origin feature/new-task    # Backup ke remote

# === END OF DAY ===
# Selesai kerja
git add .                           # Stage semua perubahan
git commit -m "WIP: end of day save" # Commit work in progress
git push origin feature/new-task    # Push ke remote
gh pr create --title "WIP: Feature" --draft # Buat draft PR
```

### Perintah Emergency
```bash
# === QUICK FIXES ===
# Perbaikan cepat dan push
git add . && git commit -m "Quick fix" && git push

# Simpan perubahan sementara
git stash && git checkout main && git pull

# Kembali ke perubahan yang di-stash
git stash pop

# === UNDO OPERATIONS ===
# Batalkan perubahan file
git checkout -- filename.js

# Batalkan semua perubahan
git reset --hard HEAD

# Undo commit terakhir tapi keep changes
git reset --soft HEAD~1

# Undo commit dan hapus changes
git reset --hard HEAD~1
```

### Perintah Kolaborasi
```bash
# === TEAM COLLABORATION ===
# Sync dengan team
git fetch --all                    # Ambil semua perubahan
git checkout main && git pull      # Update main branch
git checkout feature/my-branch     # Kembali ke branch kerja
git rebase main                    # Rebase dengan main terbaru

# Review PR dari team
gh pr list                         # Lihat semua PR
gh pr checkout 123                 # Checkout PR untuk review
gh pr review 123 --approve         # Approve PR

# Merge PR setelah review
gh pr merge 123 --squash           # Merge dengan squash
```

---

## 📚 Resources dan Link Berguna

### Dokumentasi Resmi
- [GitHub CLI Manual](https://cli.github.com/manual/) - Panduan lengkap GitHub CLI
- [Git Documentation](https://git-scm.com/doc) - Dokumentasi resmi Git
- [GitHub Docs](https://docs.github.com) - Dokumentasi GitHub
- [Pro Git Book](https://git-scm.com/book) - Buku gratis tentang Git

### Tools Tambahan
```bash
# === GITHUB EXTENSIONS ===
# Install extension untuk GitHub CLI
gh extension install github/gh-copilot    # GitHub Copilot CLI
gh extension install vilmibm/gh-screensaver # Fun screensaver
gh extension install gennaro-tedesco/gh-s   # Search repositories

# === GIT TOOLS ===
# Tools untuk mempercantik Git
brew install git-delta              # Better diff viewer
brew install lazygit               # Terminal UI for Git
brew install tig                   # Text-mode interface for Git

# === PRODUCTIVITY TOOLS ===
# Conventional commits helper
npm install -g commitizen
npm install -g cz-conventional-changelog

# Git hooks manager
npm install -g husky

# Code formatter
npm install -g prettier
pip install black                  # Python formatter
```

### Cheat Sheet Commands
```bash
# === PRINT CHEAT SHEET ===
# Buat file cheat sheet pribadi
cat > ~/git-cheat-sheet.txt << 'EOF'
=== GIT CHEAT SHEET ===

SETUP
git config --global user.name "Name"
git config --global user.email "email@domain.com"
gh auth login

BASIC WORKFLOW
git init                    # Initialize repo
git add .                   # Stage changes
git commit -m "message"     # Commit changes
git push origin main        # Push to remote

BRANCHING
git branch                  # List branches
git checkout -b new-branch  # Create and switch
git merge branch-name       # Merge branch
git branch -d branch-name   # Delete branch

GITHUB CLI
gh repo create             # Create repository
gh pr create              # Create pull request
gh issue create           # Create issue
gh pr merge               # Merge PR

EMERGENCY
git stash                 # Save changes temporarily
git reset --hard HEAD     # Discard all changes
git revert commit-hash    # Undo commit safely
EOF

# Tambahkan alias untuk akses cepat
echo "alias githelp='cat ~/git-cheat-sheet.txt'" >> ~/.bashrc
```

---

