_register-command() {
  if [[ -z $commands ]]; then
    commands=$1
    return
  fi

  commands="$commands $1"
}

_recipient-ids() {
  gpg --homedir $gpg_dir --fingerprint --with-colon 2> /dev/null | grep fpr | cut -d ':' -f 10
}

_hidden-destination() {
  secrets_dir=$(_secrets-dir)
  dirname $(echo $1 | sed -e "s#$secrets_dir/raw#$secrets_dir/hidden#")
}

_raw-destination() {
  dirname $(_raw-file-for $1)
}

_hidden-files() {
 find $project_root/secrets/hidden -name '*' -type f
}

_raw-files() {
  find "$(_secrets-dir)/raw" -name '*' -type f  -not -name ".*"
}

_raw-file-for() {
  echo $1 | sed -e "s#$(_secrets-dir)/hidden#$(_secrets-dir)/raw#"
}

_encrypt() {
  file=$1
  normalized_recipient_ids=$(_recipient-ids | sed -e 's/^/--recipient /')
  destination=$(_hidden-destination $file)
  mkdir -p $destination

  gpg --homedir $gpg_dir --encrypt $normalized_recipient_ids --output "$destination/$(basename $file)" $file
}

_secrets-dir() {
  _relative-path $(_config gitgpg.secretsdir)
}

_config() {
  git config -f $config_file $*
}

_relative-path() {
  echo "$project_root/$1"
}

_setup-project-structure() {
  local secrets_dir=$(_relative-path $1)

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

_ensure-initialized() {
  if ! [[ -d $gpg_dir ]]; then
    echo "Run '$(basename $0) init' first "
    exit 1
  fi
}

_full-signature() {
  echo $(basename $0) $("_$1_signature")
}
