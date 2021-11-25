/*
* THIS IS ACTUALLY A JSON FILE.
* BUT BECAUSE GITHUB HIGHLIGHT COMMENTS AS ERROR, 
* I CHANGED IT INTO .js FILE.
*/
{
    /**
    * Better Defaults
    **/
    "editor.copyWithSyntaxHighlighting": false,
    "diffEditor.ignoreTrimWhitespace": false,
    "editor.emptySelectionClipboard": false,
    "workbench.editor.enablePreview": false,
    "window.newWindowDimensions": "offset",
    "editor.multiCursorModifier": "ctrlCmd",
    "diffEditor.renderSideBySide": false,
    "editor.snippetSuggestions": "top",
    "editor.detectIndentation": false,
    "editor.lineNumbers": "relative",
    "window.menuBarVisibility": "compact",
    "editor.suggestSelection": "first",
    "editor.smoothScrolling": false,
    "files.autoSave": "onFocusChange",
    "workbench.activityBar.visible": false,

    /**
    * Hide Everything
    */
    "workbench.sideBar.location": "right",
    "workbench.statusBar.visible": false,
    "workbench.editor.showTabs": false,
    "editor.renderIndentGuides": false,
    "editor.minimap.enabled": false,
    "editor.hover.enabled": false,
    "editor.matchBrackets": "never",
    "workbench.tips.enabled": false,
    "editor.colorDecorators": false,
    "workbench.startupEditor": "none",
    "editor.lightbulb.enabled": false,
    "editor.selectionHighlight": false,
    "editor.overviewRulerBorder": false,
    "editor.renderLineHighlight": "none",
    "editor.renderControlCharacters": false,
    "editor.hideCursorInOverviewRuler": true,
    "editor.gotoLocation.multipleReferences": "goto",
    "editor.gotoLocation.multipleDefinitions": "goto",
    "editor.gotoLocation.multipleDeclarations": "goto",
    "workbench.editor.enablePreviewFromQuickOpen": false,
    "editor.gotoLocation.multipleImplementations": "goto",
    "editor.gotoLocation.multipleTypeDefinitions": "goto",
    "breadcrumbs.enabled": false,

    /**
    * Typography & Looks
    **/
    "workbench.colorTheme": "Night Owl (No Italics)",
    "workbench.iconTheme": "vscode-icons",
    "editor.fontSize": 15,
    "editor.lineHeight": 26,
    "editor.suggestFontSize": 15,
    "editor.suggestLineHeight": 28,
    "terminal.integrated.fontSize": 15,
    "terminal.integrated.lineHeight": 1,

    /**
     VIM
    */
    "vim.useCtrlKeys": true,
    "vim.hlsearch": true,
    "vim.useSystemClipboard": true,
    "vim.normalModeKeyBindings": [
        {
            "before": [ "U" ],
            "after": [ "<C-r>" ]
        },
    ],
    "vim.normalModeKeyBindingsNonRecursive" : [
        {
            "before": [ "J" ],
            "after": [ "1", "5", "j", "z", "z" ]
        },
        {
            "before": [ "K" ],
            "after": [ "1", "5", "k", "z", "z" ]
        },
        {
            "before": [ "P" ],
            "after": [ "y", "y", "p" ]
        },
        {
            "before": [ "d" ],
            "after": [ "\"", "_", "d" ]
        },
        {
            "before": [ "D" ],
            "after": [ "\"", "_", "D" ]
        },
        {
            "before": [ "d", "d" ],
            "after": [ "\"", "_", "d", "d" ]
        },
        {
            "before": [ "X" ],
            "after": [ "y", "y", "d", "d" ]
        },
    ],
    "vim.visualModeKeyBindingsNonRecursive" : [
        {
            "before": [ "P" ],
            "after": [ "y", "k", "p" ]
        },
        {
            "before": [ "d" ],
            "after": [ "\"", "_", "d" ]
        },
        {
            "before": [ "J" ],
            "after": [ "1", "5", "j", "z", "z" ]
        },
        {
            "before": [ "K" ],
            "after": [ "1", "5", "k", "z", "z" ]
        },
    ],
    "vim.handleKeys": {
        "<C-j>": false,
        "<C-d>": false,
        "<C-`>": false,
        "<C-~>": false,
        "<C-s>": false,
        "<C-E>": false,
        "<C-e>": false,
        "<C-/>": false,
        "<C-b>": false,
        "<C-w>": false,
        "<C-p>": false,
        "<C-P>": false,
        "<C-\\>": false,
        "<C-|>": false,
        "<C-a>": false,
        "<Alt-F>": false,
        "<C-k>": false,
        "<C-D>": false,
        "<C-BS>": false,
        "<C-?>": false,
        "<C-X>": false,
        "<C-f>": false,
        "<C-h>": false,
        "<C-m>": false,
        "<C-c>": false,
        "<C-r>": false,

        "<C-u>": true,
        "<C-L>": true,
    },

    /**
    * Etc.
    */
    "python.pythonPath": "C:\\ProgramData\\Anaconda3\\python.exe",
    "python.defaultInterpreterPath": "C:\\ProgramData\\Anaconda3\\python.exe",
    "diffEditor.codeLens": true,
    "[javascript]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[html]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "terminal.integrated.gpuAcceleration": "off",
}
