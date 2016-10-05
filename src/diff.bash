diff() {
  anchor_version=${1-HEAD}
  for file in $(_hidden-files); do
    file_relative_path=$(echo $file | sed -e "s#$project_root/##")

    git show $anchor_version:$file_relative_path | \
    gpg --decrypt | \
    git diff --no-index -- - $(_raw-file-for $file)
  done
}

