dgit() {
  if [ -z "$1" ]; then
    echo 'usage: dgit [URL]'
    return
  fi

  git clone "https://git.drupal.org/project/${1}.git"
}

_dgit_completion() {
  local cur prev cword opts
  local directory

  _get_comp_words_by_ref -n : cur prev cword

  directory=$(dirname "${BASH_SOURCE[0]}")
  opts=$(cat $directory/drupal_modules.csv)

  COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
}

complete -F _dgit_completion dgit
