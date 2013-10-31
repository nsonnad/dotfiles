// add this to <profile>/static/custom/custom.js to load vim keybindings:
$.getScript("/static/components/codemirror/keymap/vim.js", function() {
    if (! IPython.Cell) return;
    IPython.Cell.options_default.cm_config.keyMap = "vim";
});
