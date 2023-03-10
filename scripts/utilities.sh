#!/usr/bin/env bash

utilities::echo_title() {
  local -r title=$1
  becho -c upper -bf red ${title}
}

utilities::echo_topic_i() {
  local -r topic=$1
  becho -l "  $(becho -f red "+") " -w 80 ${topic}
}

utilities::echo_topic_ii() {
  local -r topic=$1
  becho -l "    $(becho -f cyan "-") " -w 80 ${topic}
}

utilities::abort() {
  local -r exit_code=$1
  local -r message=$2

  becho "$(becho -bf red Opsie!) ${message}"
  becho -bf red "Procedure aborted. Nothing has changed."
  exit ${exit_code}
}
