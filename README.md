# Restic B2 Recovery
[![Docker Pulls](https://img.shields.io/badge/github-repo-blue?logo=github)](https://github.com/Tweeeeester/restic-b2-recovery)
[![Docker Pulls](https://img.shields.io/docker/v/tweeeeester/restic-b2-recovery?sort=semver)](https://hub.docker.com/r/tweeeeester/restic-b2-recovery)
___

Simple docker build to recover backups from Backblaze B2 and Restic

## .ENV
```commandline
RESTIC_HOST="HOST_NAME"
RESTIC_PASSWORD="XXXXXXXXXXXXXXXXXXXXXXXXX"

B2_BUCKET="BUCKET_NAME"
B2_ACCOUNT="XXXXXXXXXXXXXXXXXXXXXXXXX"
B2_KEY="XXXXXXXXXXXXXXXXXXXXXXXXX"
```
## Docker Compose
### Docker Hub Image
```docker
services:
  restic-b2-recovery:
    env_file: .env
    image: tweeeeester/restic-b2-recovery:latest
    volumes:
      - "/path/to/my/restic/repo:/app/repo"
      - "/path/to/my/recovery:/app/recovery"
```

### Build From Scratch
```docker
services:
  restic-b2-recovery:
    build:
      context: .
      args:
        RESTIC_VERISON: 0.18.1
        RCLONE_VERSION: 1.73.2
    env_file: .env
    image: tweeeeester/restic-b2-recovery:1.0.0
    volumes:
      - "/path/to/my/restic/repo:/app/repo"
      - "/path/to/my/recovery:/app/recovery"
```
### Volumes
- The restic repo location should be mounted to `/app/repo`.
- The recovery location should be mounted to `/app/recovery`