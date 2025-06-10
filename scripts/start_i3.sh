#!/bin/bash
set -e

echo "Starting Aerospace (GUI app)..."
open -a "Aerospace"

echo "Starting SketchyBar (brew service)..."
brew services start sketchybar

# echo "Starting Borders (brew service)..."
# brew services start borders

echo "i3 stack started successfully!"
