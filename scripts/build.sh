#!/usr/bin/env bash

source "$(dirname $0)/utilities.sh"

create_directory_structure() {
  local -r distribution_directory="$1"

  utilities::echo_topic_i "Creating directory structure."

  rm -rf "${distribution_directory}"
  mkdir -p "${distribution_directory}/cursors"
}

create_metadata_files() {
  local -r distribution_directory="$1"
  local -r name="$2"
  local -r comment="$3"

  utilities::echo_topic_i "Creating metadata files."

  echo -e "[Icon Theme]\nName=${name}\nComment=${comment}\n" > "${distribution_directory}/index.theme"
}

build_cursor_files() {
  local -r configurations_directory="$1"
  local -r distribution_directory="$2"

  utilities::echo_topic_i "Building cursor files."

  for configuration_file in $(ls "${configurations_directory}"); do
    local cursor_file=$(echo ${configuration_file} | cut -f 1 -d .)
    
    utilities::echo_topic_ii " Building from $(becho -b ${configuration_file}) to $(becho -b ${cursor_file})."
    
    xcursorgen "${configurations_directory}/${configuration_file}" > "${distribution_directory}/cursors/${cursor_file}"
  done
}

main() {
  local -r name="$1"
  local -r comment="$2"
  local -r configurations_directory="$3"
  local -r distribution_directory="$4"

  utilities::echo_title "build"

  create_directory_structure "${distribution_directory}"
  create_metadata_files "${distribution_directory}" "${name}" "${comment}"
  build_cursor_files "${configurations_directory}" "${distribution_directory}"
}

main "$1" "$2" "$3" "$4"
