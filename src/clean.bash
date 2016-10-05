clean() {
  echo "Cleaning up raw files"
  rm -r $(_secrets_dir)/raw/*
}

_register_command clean

_clean_signature() {
  echo "clean"
}

_clean_brief() {
  cat <<-EOF
    Remove all raw secret files
EOF
}
