#!/bin/bash

USERNAME="alvinzanuaputra"
FILE="hapuskan.txt"

if [ ! -f "$FILE" ]; then
  echo "❌ File $FILE tidak ditemukan!"
  exit 1
fi

echo "⚠️  PERINGATAN: Semua repo dalam $FILE akan DIHAPUS!"

while read -r repo; do
  if [ -n "$repo" ]; then
    echo "🗑️  Menghapus $USERNAME/$repo ..."
    gh repo delete "$USERNAME/$repo" --yes
  fi
done < "$FILE"

echo "✅ Selesai menghapus semua repo yang dipilih."
