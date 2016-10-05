config() {
  _ensure_initialized

  _config --list
}

_register_command config

_config_signature() {
  echo "config"
}

_config_brief() {
  cat <<-EOF
    View config
EOF
}
