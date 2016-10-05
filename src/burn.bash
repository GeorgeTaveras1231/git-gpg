burn() {
  if ! [[ -d $(_secrets-dir) ]] && ! [[ -d $gpg_dir  ]]; then
    echo "Nothing to delete..."
    exit 0
  fi

  read -r -p "This will delete all encrypted and raw files and .gitgpg folder. Is that ok? [y/N] " response
  case $response in
    [nN]) exit 0;;
  esac

  rm -r $(_secrets-dir) 2> /dev/null
  rm -r $gpg_dir 2> /dev/null
}

_register-command burn

_burn-signature() {
  echo "burn"
}

_burn-brief() {
  cat <<-EOF
    Delete all secret files and .gitgpg folder.
EOF
}
