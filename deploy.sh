# Manually fix flutter beta web packaging error
if [[ -d "build/web/assets/assets/images" ]]
then
  rm -rf build/web/assets/images
  mv build/web/assets/assets/images build/web/assets/
fi

# Sync files to server
rsync -alPvz build/web/* $JIACHEN:/var/www/jiachen.dev/html