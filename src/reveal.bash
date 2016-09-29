reveal() {
  for file in $(_hidden_files); do
    mkdir -p $(_raw_destination $file)
    raw_file="$(_raw_file_for $file)"

    if [[ -f $raw_file ]]; then
      read -r -p "$raw_file exists. Confirm override? [y/N] " response
      case $response in
        [nN]) exit 0;;
      esac
    fi

    gpg --decrypt $file > $raw_file
  done
}

