burn() {
  read -r -p "This will delete all encrypted and raw files and .gitgpg folder. Is that ok? [y/N] " response
  case $response in
    [nN]) exit 0;;
  esac

  rm -r $project_root/{.gitgpg,secrets}
}
