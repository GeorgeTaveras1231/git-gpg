version() {
  cat $support_path/version.txt
}

_register-command version

_version-signature() {
  echo "hide"
}

_version-brief() {
  cat <<-EOF
    See version
EOF
}
