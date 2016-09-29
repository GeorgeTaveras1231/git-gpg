hide() {
  _ensure_initialized

  if [[ -z $(_recipient_ids) ]]; then
    echo "Trust ring is empty. Use \`$(basename $0) addperson identifier1 [identifierN]\`"
    exit 1
  fi

  files_to_encrypt=$(_raw_files)

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
