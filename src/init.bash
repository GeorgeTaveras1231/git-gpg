init() {
  local secrets_dir=${1-$default_secret_dir}
  _setup-project-structure $secrets_dir
  _config gitgpg.secretsdir $secrets_dir
  _config gitgpg.encryptedformat ascii
  _config --path gitgpg.rawexclude '.\*'
}

_register-command init

_init-signature() {
  echo "init [secrets-dir]"
}

_init-brief() {
  cat <<-EOF
    Initialize git-gpg project. This will create a .gitgpg directory that
    serves as the gnupg public-key database and the config database.

$(_init-help)
EOF
}

_init-help() {
  cat <<-EOF
    Parameters:
      secrets-dir:
        Dedicated folder for secrets. This folder will have the following structure

        dir/
          |- .gitignore
          |- raw/
          |- hidden/

        Files in the raw/ directory will contain the secret files you wish to hide.
        These files are automatically ignored by git to avoid committing them.

        Files in the hidden/ directory are the encrypted versions of the files in
        raw/. These should be commited.
EOF
}
