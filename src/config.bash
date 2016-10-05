config() {
  _ensure-initialized

  _config --list
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
