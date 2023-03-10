#!/usr/bin/env bash

repository_directory="$(dirname $(dirname $(realpath $0)))"

create_directory_structure() {
  local -r cursors_directory="$1"
  rm -rf $(dirname "${cursors_directory}")
  mkdir -p "${cursors_directory}"
  echo "Creating directory structure."
}

create_metadata_files() {
  local -r distribution_directory="$1"
  local -r name="$2"
  local -r comment="$3"
  echo "Creating metadata files."
  echo -e "[Icon Theme]\nName=${name}\nComment=${comment}\n" > "${distribution_directory}/index.theme"
}

build_cursor_files() {
  local -r configurations_directory="$1"
  local -r cursors_directory="$2"

  echo "Building cursor files."
  for configuration_file in $(ls "${configurations_directory}"); do
    local cursor_file=$(echo ${configuration_file} | cut -f 1 -d .)
    echo " * Building from ${configuration_file} to ${cursor_file}."
    xcursorgen "${configurations_directory}/${configuration_file}" > "${cursors_directory}/${cursor_file}"
  done
}

install_cursor() {
  local -r distribution_directory="$1"
  local -r installation_directory="$2"
  local -r sudo=$(
    test $(whoami) == root &&
    echo sudo ||
    echo
  )
  echo "Installing cursor."

  ${sudo} rm -rf "${installation_directory}"
  ${sudo} cp -rP "${distribution_directory}" "${installation_directory}"
}

main() {
  local -r name=nostalgia
  local -r comment="An X11 cursor."

  local -r distribution_directory="${repository_directory}/dist"
  local -r configurations_directory="${repository_directory}/configurations"
  local -r cursors_directory="${distribution_directory}/cursors"
  local -r installation_directory=$(
    test $(whoami) == root &&
    echo "/usr/share/icons/${name}" ||
    echo "${HOME}/.local/share/icons/${name}"
  )

  create_directory_structure "${cursors_directory}"
  create_metadata_files "${distribution_directory}" "${name}" "${comment}"
  build_cursor_files "${configurations_directory}" "${cursors_directory}"
  install_cursor "${distribution_directory}" "${installation_directory}"

  echo "Done."
}

main

