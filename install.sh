#!/usr/bin/env bash

set -e

echo "====================================="
echo " 🛠  Starting dotfiles installation..."
echo "====================================="

echo "🔧 Step 1: Removing old configs..."
rm -rf ~/.config/nvim
rm -rf ~/.config/tmux

echo "🔧 Step 2: Installing dependencies (tmux, neovim)..."
brew install tmux neovim

echo "🔧 Step 3: Installing LazyVim starter config..."
git clone https://github.com/LazyVim/starter ~/.config/nvim

echo "📂 Step 4: Copying local configs to ~/.config..."
mkdir -p ~/.config
cp -r ./nvim ~/.config/
cp -r ./tmux ~/.config/

echo "✅ Configs copied successfully!"

echo "🔄 Step 5: Reloading tmux config..."
if command -v tmux >/dev/null 2>&1; then
  tmux start-server
  tmux source-file ~/.config/tmux/tmux.conf
  echo "✅ Tmux config reloaded!"
else
  echo "⚠️  tmux not found in PATH, skipping reload."
fi

echo "====================================="
echo " 🎉 Installation complete!"
echo " 👉 Run 'tmux' or 'nvim' to get started."
echo "====================================="
