#!/bin/bash

# Fetches a drupal project with `git clone`.
dgit() {
  if [ -z "$1" ]; then
    echo "usage: ${FUNCNAME[0]} [URL]"
    return
  fi

  git clone "https://git.drupal.org/project/${1}.git"
}

# Opens pages for drupal projects.
dpj() {
  if [ -z "$1" ]; then
    echo "usage: ${FUNCNAME[0]} [URL]"
    return
  fi

  local arg is_queue args_stripped

  args_stripped=""
  is_queue=false
  for arg in "$@"; do
    if [ "$arg" == "-q" ]; then
      is_queue=true
    else
      args_stripped=${args_stripped:+$args_stripped }$arg
    fi
  done

  echo "$args_stripped"
  for arg in $args_stripped; do
    if $is_queue; then
      open "https://www.drupal.org/project/issues/${arg}?categories=All"
    else
      open "https://www.drupal.org/project/${arg}"
    fi
  done
}

# Provides auto-completion for dgit.
_dgit_completion() {
  local cur prev cword opts
  local directory

  _get_comp_words_by_ref -n : cur prev cword

  directory=$(dirname "${BASH_SOURCE[0]}")
  opts=$(cat $directory/drupal_modules.csv)

  COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
}

complete -F _dgit_completion dgit dpj
