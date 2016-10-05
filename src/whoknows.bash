whoknows() {
  _ensure_initialized

  gpg --homedir $gpg_dir --list-keys
}

_register_command whoknows

_whoknows_signature() {
  echo "whoknows"
}

_whoknows_brief() {
  cat <<-EOF
    List trusted keys
EOF
}
