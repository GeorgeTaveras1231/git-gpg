hide() {
  _ensure-initialized

  if [[ -z $(_recipient_ids) ]]; then
    echo "Trust ring is empty. Use \`$(_full-signature add-person)\`"
    exit 1
  fi

  files_to_encrypt=$(_raw-files)

  if [[ -z $files_to_encrypt ]]; then
    echo "Nothing to hide..."
    exit 0
  fi

  read -r -p "This will delete the raw files after encrypting them. Ok? [y/N] " response
  case $response in
    [nN]) exit 0;;
  esac

  for file in $files_to_encrypt; do
    _encrypt $file
  done

  clean
}

_register-command hide

_hide-signature() {
  echo "hide"
}

_hide-brief() {
  cat <<-EOF
    Encrypt raw files
EOF
}
