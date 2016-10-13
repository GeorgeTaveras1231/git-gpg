config() {
  _ensure-initialized

  if [[ -z $@  ]]; then
    _config --list
  else
    _config $@
  fi
}

_register-command config

_config-signature() {
  echo "config"
}

_config-brief() {
  cat <<-EOF
    View config
EOF
}
