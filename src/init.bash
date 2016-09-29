init() {
  git config --local gitgpg.secretsdir $default_secret_dir
  git config --local gitgpg.encryptedformat ascii
  _setup_project_structure
}

