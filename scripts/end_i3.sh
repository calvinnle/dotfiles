#!/bin/bash
set -e

echo "Quitting Aerospace (GUI app)..."
osascript -e 'quit app "Aerospace"'

echo "Stopping SketchyBar..."
brew services stop sketchybar || true
pkill -x sketchybar || true

echo "Stopping Borders..."
brew services stop borders || true
pkill -x borders || true

echo "i3 stack stopped successfully!"
