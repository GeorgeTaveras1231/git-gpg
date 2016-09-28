whoknows() {
  ensure_initialized

  gpg --homedir $project_root/.gitgpg --list-keys
}
