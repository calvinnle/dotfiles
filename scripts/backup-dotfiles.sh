#!/bin/bash

# Dotfiles Backup Script
# This script automatically commits and pushes dotfiles changes to git
# Run monthly via cron: 0 0 1 * * /path/to/scripts/backup-dotfiles.sh

set -euo pipefail

# Configuration
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOG_FILE="$DOTFILES_DIR/.backup.log"
BACKUP_BRANCH="main"
REMOTE_NAME="origin"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Logging function
log() {
    echo -e "${GREEN}[$(date '+%Y-%m-%d %H:%M:%S')]${NC} $1" | tee -a "$LOG_FILE"
}

log_error() {
    echo -e "${RED}[$(date '+%Y-%m-%d %H:%M:%S')] ERROR:${NC} $1" | tee -a "$LOG_FILE"
}

log_warning() {
    echo -e "${YELLOW}[$(date '+%Y-%m-%d %H:%M:%S')] WARNING:${NC} $1" | tee -a "$LOG_FILE"
}

# Check if we're in a git repository
check_git_repo() {
    if ! git -C "$DOTFILES_DIR" rev-parse --git-dir > /dev/null 2>&1; then
        log_error "Not a git repository: $DOTFILES_DIR"
        exit 1
    fi
}

# Check for internet connection before pushing
check_connectivity() {
    if ! ping -c 1 github.com > /dev/null 2>&1; then
        log_warning "No internet connection, skipping push"
        return 1
    fi
    return 0
}

# Main backup function
backup_dotfiles() {
    log "Starting dotfiles backup..."
    
    cd "$DOTFILES_DIR"
    
    # Check if there are any changes to commit
    if git diff --quiet && git diff --cached --quiet; then
        log "No changes to backup"
        return 0
    fi
    
    # Show what changed
    log "Changes detected:"
    git status --porcelain | tee -a "$LOG_FILE"
    
    # Add all changes
    git add .
    
    # Commit with timestamp
    local commit_msg="Monthly backup - $(date '+%Y-%m-%d %H:%M:%S')"
    git commit -m "$commit_msg"
    
    log "Committed changes: $commit_msg"
    
    # Try to push if we have connectivity
    if check_connectivity; then
        git push "$REMOTE_NAME" "$BACKUP_BRANCH"
        log "Successfully pushed to remote repository"
    else
        log_warning "Changes committed locally but not pushed (no internet)"
    fi
    
    log "Backup completed successfully"
}

# Error handling
trap 'log_error "Script failed at line $LINENO"' ERR

# Run the backup
check_git_repo
backup_dotfiles

log "Dotfiles backup script finished"
