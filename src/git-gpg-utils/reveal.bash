reveal() {
  for file in $(_hidden-files); do
    mkdir -p $(_raw-destination $file)
    raw_file="$(_raw-file-for $file)"

    if [[ -f $raw_file ]]; then
      read -r -p "$raw_file exists. Confirm override? [y/N] " response
      case $response in
        [nN]) exit 0;;
      esac
    fi

    gpg --decrypt $file > $raw_file
  done
}

_register-command reveal

_reveal-signature() {
  echo "reveal"
}

_reveal-brief() {
  cat <<-EOF
    Decrypt hidden files
EOF
}
