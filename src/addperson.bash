addperson() {
  _ensure_initialized

  if [[ -z $@ ]]; then
    echo "$(basename $0) addperson identifier1 [identifierN...]"
    exit 1
  fi

  gpg --export $@ | gpg --homedir $project_root/.gitgpg --import
}
