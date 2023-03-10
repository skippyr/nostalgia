#!/usr/bin/env bash

source "$(dirname $0)/utilities.sh"

main() {
  utilities::echo_title "Uninstall"

  utilities::echo_topic_i "Removing possible installation."
  rm -rf "${installation_directory}"
}

main "${installation_directory}"
