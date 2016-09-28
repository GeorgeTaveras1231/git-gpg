addperson() {
  ensure_initialized

  gpg --export $@ | gpg --homedir $project_root/.gitgpg --import
}
