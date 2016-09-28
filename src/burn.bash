burn() {
  if ! [[ -d $project_root/secrets ]] || ! [[ -d $project_root/.gitgpg  ]]; then
    echo "Nothing to delete..."
    exit 0
  fi

  read -r -p "This will delete all encrypted and raw files and .gitgpg folder. Is that ok? [y/N] " response
  case $response in
    [nN]) exit 0;;
  esac

  rm -r $project_root/{.gitgpg,secrets} 2> /dev/null
}
