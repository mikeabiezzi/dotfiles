function populate { 
  local BACKUPS_DIR="".dotfile_backups/"`date +"%T"`"
  echo "BACKUPS_DIR=$BACKUPS_DIR"
  local BACKUPS_PATH="$HOME/$BACKUPS_DIR"
  echo "BACKUPS_PATH=$BACKUPS_PATH"
  echo ""

  for f in ~/.dotfiles/*
  do
    local DEST_FILE=".${f##*/}"
    echo "DEST_FILE=$DEST_FILE"
    local DEST_PATH="$HOME/$DEST_FILE"
    echo "DEST_PATH=$DEST_PATH"

    local SRC_PATH="$f"
    echo "SRC_PATH=$SRC_PATH"

    if [ -f $DEST_PATH ] || [ -d $DEST_PATH ]; then
      if [ ! -d $BACKUPS_PATH ]; then
        echo "mkdir $BACKUPS_PATH"
        mkdir $BACKUPS_PATH
      fi

      echo "mv "$DEST_PATH" "$BACKUPS_PATH/$DEST_FILE""
      mv "$DEST_PATH" "$BACKUPS_PATH$DEST_FILE"
    fi

    echo "ln -s $SRC_PATH $DEST_PATH"
    ln -s $SRC_PATH $DEST_PATH

    echo ""
  done
}

populate
