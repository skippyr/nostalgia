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

create_images() {
  local -r source_images_directory="$1"
  local -r images_directory="$2"
  local -r inner_color="$3"
  local -r border_color="$4"

  local -r source_inner_color=140000
  local -r source_border_color=fdebab

  utilities::echo_topic_i "Creating images using $(becho -b "#${inner_color}") as inner color and $(becho -b "#${border_color}") as border color."

  rm -rf "${images_directory}"
  mkdir -p "${images_directory}"

  for source_image in $(ls "${source_images_directory}"); do
    utilities::echo_topic_ii "Converting $(becho -b ${source_image}) colors."
    convert "${source_images_directory}/${source_image}"\
      -fill "#${inner_color}" -opaque "#${source_inner_color}"\
      -fill "#${border_color}" -opaque "#${source_border_color}"\
      "${images_directory}/${source_image}"
  done
}

build_cursor_files() {
  local -r configurations_directory="$1"
  local -r distribution_directory="$2"
  local -r images_directory="$3"

  utilities::echo_topic_i "Building cursor files."

  for configuration_file in $(ls "${configurations_directory}"); do
    local cursor_file=$(echo ${configuration_file} | cut -f 1 -d .)
    
    utilities::echo_topic_ii " Building from $(becho -b ${configuration_file}) to $(becho -b ${cursor_file})."
    
    xcursorgen "${configurations_directory}/${configuration_file}" > "${distribution_directory}/cursors/${cursor_file}"
  done

  rm -rf "${images_directory}"
}

create_symbolic_links() {
  local -r distribution_directory="$1"
  local -r symbolic_link_groups=(
    "left_ptr>right_ptr"
    "hand2>hand"
    "hand2>hand1"
    "ns-resize>n-resize"
    "ns-resize>s-resize"
    "ns-resize>top_side"
    "ns-resize>bottom_side"
    "ns-resize>row-resize"
    "ew-resize>e-resize"
    "ew-resize>w-resize"
    "ew-resize>right_side"
    "ew-resize>left_side"
    "ew-resize>col-resize"
    "nw-resize>top_left_corner"
    "nw-resize>bottom_right_corner"
    "nw-resize>nwse-resize"
    "ne-resize>top_right_corner"
    "ne-resize>bottom_left_corner"
    "ne-resize>nesw-resize"
    "all-scroll>fleur"
    "all-scroll>crosshair"
  )

    utilities::echo_topic_i "Creating symbolic links."

  for symbolic_link_group in ${symbolic_link_groups[@]}; do
    local source_file=$(echo ${symbolic_link_group} | cut -f 1 -d ">")
    local target_file=$(echo ${symbolic_link_group} | cut -f 2 -d ">")

    utilities::echo_topic_ii "Creating symbolic link between $(becho -b ${source_file}) and $(becho -b ${target_file})."

    ln -sf ${source_file} "${distribution_directory}/cursors/${target_file}"
  done
}

main() {
  local -r name="$1"
  local -r comment="$2"
  local -r configurations_directory="$3"
  local -r source_images_directory="$4"
  local -r images_directory="$5"
  local -r distribution_directory="$6"
  local -r inner_color="$7"
  local -r border_color="$8"

  utilities::echo_title "build"

  create_directory_structure "${distribution_directory}"
  create_metadata_files "${distribution_directory}" "${name}" "${comment}"
  create_images "${source_images_directory}" "${images_directory}" "${inner_color}" "${border_color}"
  build_cursor_files "${configurations_directory}" "${distribution_directory}" "${images_directory}"
  create_symbolic_links "${distribution_directory}"
}

main "$1" "$2" "$3" "$4" "$5" "$6" "$7" "$8"

