#!/usr/bin/env bash

set -e

echo "====================================="
echo " 🛠  Starting dotfiles installation..."
echo "====================================="

echo "🔧 Step 1: Removing old configs..."
rm -rf ~/.config/nvim
rm -rf ~/.config/tmux

echo "🔧 Step 2: Installing dependencies (tmux, neovim)..."
if ! command -v brew >/dev/null 2>&1; then
  echo "❌ Homebrew not found. Please install Homebrew first."
  exit 1
fi

brew install tmux neovim

echo "🔧 Step 3: Installing LazyVim starter config..."
git clone https://github.com/LazyVim/starter ~/.config/nvim

echo "🔧 Step 4: Installing TPM in ~/.config..."
mkdir -p ~/.config/tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

echo "📂 Step 5: Copying local configs to ~/.config..."
mkdir -p ~/.config
cp -r ./nvim ~/.config/ 2>/dev/null || true
cp -r ./tmux ~/.config/ 2>/dev/null || true
cp ./starship.toml ~/.config/ 2>/dev/null || true

echo "✅ Configs copied successfully!"

echo "🔄 Step 6: Reloading tmux config (if session exists)..."
if command -v tmux >/dev/null 2>&1; then
  if tmux has-session 2>/dev/null; then
    tmux source-file ~/.config/tmux/tmux.conf
    echo "✅ Tmux config reloaded!"
    else
    echo "ℹ️ No tmux session running. Will load config on next start."
  fi
else
  echo "⚠️  tmux not found in PATH, skipping reload."
fi

echo "====================================="
echo " 🎉 Installation complete!"
echo " 👉 Run 'tmux' or 'nvim' to get started."
echo "====================================="
