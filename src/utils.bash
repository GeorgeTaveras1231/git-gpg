_recipient_ids() {
  gpg --homedir $gpg_dir --fingerprint --with-colon 2> /dev/null | grep fpr | cut -d ':' -f 10
}

_hidden_destination() {
  echo $1 | sed -e "s#$(secrets_dir)/raw#$(secrets_dir)/hidden#" | xargs dirname
}

_raw_destination() {
  echo $1 | sed -e "s#$(secrets_dir)/hidden#$(secrets_dir)/raw#" | xargs dirname
}

_hidden_files() {
 find $project_root/secrets/hidden -name '*' -type f
}

_raw_files() {
  find "$(secrets_dir)/raw" -name '*' -type f
}

_raw_file_for() {
  echo $1 | sed -e "s#$project_root/secrets/hidden#$project_root/secrets/raw#"
}

_encrypt() {
  file=$1
  normalized_recipient_ids=$(recipient_ids | sed -e 's/^/--recipient /')
  destination=$(hidden_destination $file)
  mkdir -p $destination

  gpg --encrypt $normalized_recipient_ids --output "$destination/$(basename $file)" $file
}

_secrets_dir() {
  git config --local gitgpg.secretsdir
}

_setup_project_structure() {
  sec_dir=$(_secrets_dir)
  printf "Creating git-gpg folder structure..."
  mkdir -p $sec_dir/{raw,hidden}
  cat <<-EOF > $sec_dir/.gitignore
# Ignore all files in this directory. This is for your own good
raw/*
EOF

  mkdir -p $gpg_dir
  touch $gpg_dir/.keep
  printf "Done\n"
}

_ensure_initialized() {
  if ! [[ -d $project_root/.gitgpg ]]; then
    echo "Run '$(basename $0) init' first "
    exit 1
  fi
}
