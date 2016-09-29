whoknows() {
  _ensure_initialized

  gpg --homedir $gpg_dir --list-keys
}
