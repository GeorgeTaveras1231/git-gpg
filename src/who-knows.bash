who-knows() {
  _ensure-initialized

  gpg --homedir $gpg_dir --list-keys 2> /dev/null
}

_register-command who-knows

_who-knows-signature() {
  echo "who-knows"
}

_who-knows-brief() {
  cat <<-EOF
    List trusted keys
EOF
}
