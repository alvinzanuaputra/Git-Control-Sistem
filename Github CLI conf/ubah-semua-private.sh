#!/bin/bash

USERNAME="alvinzanuaputra"

echo "📦 Mengambil semua repo milik $USERNAME..."

repos=$(gh repo list $USERNAME --limit 1000 --json name,visibility,owner -q \
  '.[] | select(.visibility == "PRIVATE" and .owner.login == "'$USERNAME'") | .name')

if [ -z "$repos" ]; then
  echo "✅ Tidak ada repo PRIVATE milik sendiri yang ditemukan."
  exit 0
fi

echo "🔄 Mengubah semua repo PRIVATE menjadi PUBLIC..."

for repo in $repos; do
  echo "➡️  Mengubah $repo menjadi public..."
  gh repo edit "$USERNAME/$repo" --visibility public --accept-visibility-change-consequences
done

echo "🎉 Selesai! Semua repo PRIVATE sudah diubah jadi PUBLIC."
