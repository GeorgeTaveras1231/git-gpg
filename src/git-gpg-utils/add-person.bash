add-person() {
  _ensure-initialized

  if [[ -z $@ ]]; then
    echo "Error: Missing argument"
    _add-person-signature
    exit 1
  fi

  gpg --export $@ | gpg --homedir $gpg_dir --import
}

_register-command add-person

_add-person-signature() {
  echo "add-person <key-id-1> [key-id-N...]"
}

_add-person-brief() {
  cat <<-EOF
    Add a person to web of trust.
EOF
}
