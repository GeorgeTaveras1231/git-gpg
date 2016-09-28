default_secret_dir=$project_root/secrets
gpg_dir=$project_root/.gitgpg

_setup_project_structure() {
  secrets_dir=$(git config --local gitgpg.secretsdir)
  printf "Creating git-gpg folder structure..."
  mkdir -p $secrets_dir/{raw,hidden}
  cat <<-EOF > $secrets_dir/raw/.gitignore
# Ignore all files in this directory. This is for your own good
*
!.gitignore
EOF

  mkdir -p $gpg_dir
  touch $secrets_dir/hidden/.keep
  touch $gpg_dir/.keep
  printf "Done\n"
}

ensure_initialized() {
  if ! [[ -d $project_root/.gitgpg ]]; then
    echo "Run '$(basename $0) init' first "
    exit 1
  fi
}

init() {
  git config --local gitgpg.secretsdir $default_secret_dir
  _setup_project_structure
}

