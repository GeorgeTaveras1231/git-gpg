clean() {
  echo "Cleaning up raw files"
  rm -r $(_secrets_dir)/raw/*
}
