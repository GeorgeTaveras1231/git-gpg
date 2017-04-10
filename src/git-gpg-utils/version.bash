version() {
  cat $support_path/version.txt
}

_register-command version

_version-signature() {
  echo "version"
}

_version-brief() {
  cat <<-EOF
    See version
EOF
}
