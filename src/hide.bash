hide() {
  _ensure-initialized

  if [[ -z $(_recipient-ids) ]]; then
    echo "Trust ring is empty. Use \`$(_full-signature add-person)\`"
    exit 1
  fi

  files_to_encrypt=$(_raw-files)

  if [[ -z $files_to_encrypt ]]; then
    echo "Nothing to hide..."
    exit 0
  fi

  for file in $files_to_encrypt; do
    _encrypt $file
  done
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
