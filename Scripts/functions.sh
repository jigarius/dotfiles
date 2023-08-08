# Functions
# ======

# Stop all docker containers.
dsac() {
  cids=$(docker ps -q)
  if [ -z "$cids" ]; then
    echo "No containers are running. Aborting."
    return
  fi

  docker stop $(docker ps -q) > /dev/null
}

# Delete dangling images.
dddi() {
  docker rmi $(docker images -q --filter "dangling=true")
}

# Wait, showing one dot every second.
dots() {
  t=${1:-3}
  for i in $(seq 1 $t); do echo -n "." && sleep 1; done
  echo ""
}

# mkdir and cd into it.
mkcd() { mkdir -p "$1" && cd "$1"; }

# Retry until success.
please() {
  if [ $# -eq 0 ]; then
    echo "A command must be provided."
    return
  fi

  until eval "$@"; do echo -n "Retrying"; dots 3; done
}

# Remove Git branches where the remote branch is gone.
gdrg() {
  git fetch origin --prune;
  git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D;
}

# Updates the target branch based on the main branch.
#
# The base branch is first updated by pulling all changes from remote.
#
# Usage: grb (rebase on main)
# Usage: grb foo (rebase on foo)
grbs() {
  base=${1:-main}
  git checkout "$base"
  git pull origin "$base"
  git checkout -
  git rebase "$base"
}

