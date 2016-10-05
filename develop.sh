project_root=$(git rev-parse --show-toplevel)
export PATH=$project_root/src:$PATH

proj-clean() {
  rm -rf .gitgpg
  rm -rf secrets
}
