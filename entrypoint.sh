#!/bin/sh

# Setup Environment Variables
export RESTIC_REPOSITORY=/app/repo
export RESTIC_RECOVERY=/app/recovery

# Sync
if [ -n "$B2_BUCKET" ]; then
  echo "Sync with B2 using the following command: rclone sync :b2:$B2_BUCKET $RESTIC_REPOSITORY --b2-account '$B2_ACCOUNT' --b2-key 'XXX' --fast-list --b2-hard-delete --transfers 10"
  rclone sync :b2:$B2_BUCKET $RESTIC_REPOSITORY --b2-account "$B2_ACCOUNT" --b2-key "$B2_KEY" --fast-list --b2-hard-delete --transfers 10
fi

# Recovery
restic -r $RESTIC_REPOSITORY restore latest --target $RESTIC_RECOVERY
