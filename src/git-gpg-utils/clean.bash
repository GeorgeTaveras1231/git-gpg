clean() {
  echo "Cleaning up raw files"
  rm -r $(_secrets-dir)/raw/*
}

_register-command clean

_clean-signature() {
  echo "clean"
}

_clean-brief() {
  cat <<-EOF
    Remove all raw secret files
EOF
}
