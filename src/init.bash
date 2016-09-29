init() {
  local secrets_dir=${1-$default_secret_dir}
  _setup_project_structure $secrets_dir
  _config gitgpg.secretsdir $secrets_dir
  _config gitgpg.encryptedformat ascii
  _config gitgpg.rawexclude '-name \"\.\*\"'
}
