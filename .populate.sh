function populate { 
  local BACKUPS_DIR="".dotfile_backups/"`date +"%T"`"
  local BACKUPS_PATH="$HOME/$BACKUPS_DIR"

  for f in ~/.dotfiles/*
  do
    local DEST_FILE=".${f##*/}"
    local DEST_PATH="$HOME/$DEST_FILE"

    local SRC_FILE="$f"

    if [ -f $DEST_PATH ] || [ -d $DEST_PATH ]; then
      if [ ! -d $BACKUPS_PATH ]; then
        mkdir $BACKUPS_PATH
        echo "Created ~/$BACKUPS_DIR directory\n"
      fi

      mv "$DEST_PATH" "$BACKUPS_PATH/$DEST_FILE"
      echo "Moved ~/$DEST_FILE to ~/$BACKUPS_DIR"
    fi

    ln -s $SRC_FILE $DEST_PATH
    echo "Created ~/$DEST_FILE\n"
  done
}

populate
