_register_command() {
  if [[ -z $commands ]]; then
    commands=$1
    return
  fi

  commands="$commands $1"
}

_recipient_ids() {
  gpg --homedir $gpg_dir --fingerprint --with-colon 2> /dev/null | grep fpr | cut -d ':' -f 10
}

_hidden_destination() {
  secrets_dir=$(_secrets_dir)
  dirname $(echo $1 | sed -e "s#$secrets_dir/raw#$secrets_dir/hidden#")
}

_raw_destination() {
  dirname $(_raw_file_for $1)
}

_hidden_files() {
 find $project_root/secrets/hidden -name '*' -type f
}

_raw_files() {
  find "$(_secrets_dir)/raw" -name '*' -type f  -not -name ".*"
}

_raw_file_for() {
  echo $1 | sed -e "s#$(_secrets_dir)/hidden#$(_secrets_dir)/raw#"
}

_encrypt() {
  file=$1
  normalized_recipient_ids=$(_recipient_ids | sed -e 's/^/--recipient /')
  destination=$(_hidden_destination $file)
  mkdir -p $destination

  gpg --homedir $gpg_dir --encrypt $normalized_recipient_ids --output "$destination/$(basename $file)" $file
}

_secrets_dir() {
  _relative_path $(_config gitgpg.secretsdir)
}

_config() {
  git config -f $config_file $*
}

_relative_path() {
  echo "$project_root/$1"
}

_setup_project_structure() {
  local secrets_dir=$(_relative_path $1)

  printf "Creating git-gpg folder structure..."
  mkdir -p $secrets_dir/{raw,hidden}
  cat <<-EOF > $secrets_dir/.gitignore
# Ignore all files in this directory. This is for your own good
raw/*
EOF

  mkdir -p $gpg_dir
  touch $gpg_dir/.keep
  touch $config_file
  printf "Done\n"
}

_ensure_initialized() {
  if ! [[ -d $gpg_dir ]]; then
    echo "Run '$(basename $0) init' first "
    exit 1
  fi
}
