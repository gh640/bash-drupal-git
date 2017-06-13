# bash-drupal-git

A Bash function to clone Drupal project repositories with autocompletion.

## Prerequisites

- Bash is installed.
- Git is installed.
- The commands for autocompletion are available: `complete`, `compgen` and `_get_comp_words_by_ref`.

## Installation

1. Git clone `https://github.com/gh640/bash-drupal-git`.
2. Move the directory, for example, to `~/.bashrc.d/init_git`.
3. Add the following line into your `.bashrc` to load the initiation script.

`.bashrc`:

```bash
source $HOME/.bashrc.d/init_git/init_dgit.sh
```

## Usage

A project repository can be downloaded with the following command.

```bash
$ dgit [project]
```

```bash
$ dgit ctools
$ dgit views
$ dgit adminimal_theme
```

Autocompletion is avaiable for projects which are in the top 10,000 popular modules.

```bash
$ dgit link_[TAB]
link_attributes               link_css                      link_image                    link_popup
link_badges                   link_favicon_formatter        link_menu                     link_target
link_class                    link_icons                    link_node                     link_to_self_field_formatter
link_click_count              link_iframe_formatter         link_onclick                  link_to_us
```
