# Introduction
A small plugin for toggling terminal in neovim.

# Key Mapping
Ctrl-`: toggle terminal in current tab
Alt-;: yank the register content to current terminal.

# Options
- g:term_name: term program name(e.g, bash, zsh, powershell), if
empty, use the default shell option. Default: &shell.
- g:term_height: Term height. Default: 15.
