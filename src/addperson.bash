addperson() {
  _ensure_initialized

  if [[ -z $@ ]]; then
    _addperson_signature
    exit 1
  fi

  gpg --export $@ | gpg --homedir $project_root/.gitgpg --import
}

_register_command addperson

_addperson_signature() {
  echo "addperson identifier1 [identifier-N...]"
}

_addperson_brief() {
  cat <<-EOF
    Add a person to web of trust.
EOF
}
