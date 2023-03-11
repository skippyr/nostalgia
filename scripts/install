#!/usr/bin/env bash

source "$(dirname $0)/utilities.sh"

main() {
  local -r distribution_directory="$1"
  local -r installation_directory="$2"

  utilities::echo_title "Install"

  [[ ! -d "${distribution_directory}" ]] &&
    utilities::abort 1 "Need to build before installing."

  utilities::echo_topic_i "Removing possible previous installation."
  rm -rf "${installation_directory}"
  utilities::echo_topic_i "Installing build."
	mv "${distribution_directory}" "${installation_directory}"
}

main "$1" "$2"
