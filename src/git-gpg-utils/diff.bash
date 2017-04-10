diff() {
  local anchor_version=$1

  for file in $(_hidden-files); do
    local file_relative_path=$(echo $file | sed -e "s#$project_root/##")

    git show $anchor_version:$file_relative_path | \
    gpg --decrypt | \
    git diff --no-index -- - $(_raw-file-for $file)
  done
}

_register-command diff

_diff-signature() {
  echo "diff"
}

_diff-brief() {
  cat <<-EOF
    View diff of changed secrets
EOF
}
