who-knows() {
  _ensure-initialized

  gpg --homedir $gpg_dir --list-keys
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
