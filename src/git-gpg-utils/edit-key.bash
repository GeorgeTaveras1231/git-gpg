edit-key() {
  if [[ -z $@ ]]; then
    echo "Error: missing argument"
    _full-signature edit-key
    exit 1
  fi

  gpg --homedir $gpg_dir --edit $@
}

_register-command edit-key

_edit-key-signature() {
  echo "edit-key <key-id>"
}

_edit-key-brief() {
  cat <<-EOF
    Start gpg interactive edit session
EOF
}
