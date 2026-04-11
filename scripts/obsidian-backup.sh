SOURCE_FOLDER="$HOME/Obsidian-vault"
BACKUP_FOLDER="$HOME/Obsidian-vault-Backup"

# Date format for backup folder
DATE=$(date +"%Y-%m-%d")

# Backup folder name
DEST="$BACKUP_FOLDER/obsidian-backup-$DATE"

# Create backup
cp -r "$SOURCE_FOLDER" "$DEST"

echo "Backup created at $DEST"

# Keep only the 5 most recent backups
cd "$BACKUP_FOLDER" || exit
BACKUPS=$(ls -dt obsidian-backup-* | tail -n +6)
if [ ! -z "$BACKUPS" ]; then
    echo "Deleting old backups:"
    echo "$BACKUPS"
    rm -rf $BACKUPS
fi
