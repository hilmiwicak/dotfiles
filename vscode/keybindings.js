/*
* THIS IS ACTUALLY A JSON FILE.
* BUT BECAUSE GITHUB HIGHLIGHT COMMENTS AS ERROR, 
* I CHANGED IT INTO .js FILE.
*/
[
    /**
    * Better Activity Bar
    **/
    {
        "key": "shift+alt+g",
        "command": "git-graph.view"
    },
    {
        "key": "shift+alt+t",
        "command": "workbench.view.extension.thunder-client-sidebar-view"
    },
    {
        "key": "ctrl+shift+d",
        "command": "-workbench.view.debug",
        "when": "viewContainer.workbench.view.debug.enabled"
    },
    {
        "key": "ctrl+shift+d",
        "command": "dockerContainers.focus",
    },

    /*
     * Better Git Shortcuts
     */
    {
        "key": "ctrl+shift+g",
        "command": "pr:github.focus"
    },
    {
        "key": "ctrl+shift+g",
        "command": "-workbench.view.scm",
        "when": "workbench.scm.active"
    },
    {
        "key": "ctrl+g",
        "command": "workbench.view.scm",
        "when": "workbench.scm.active"
    },

    /**
    * Toggle Activity Bar
    **/
    {
        "key": "shift+alt+a",
        "command": "toggle",
        "when": "",
        "args": {
            "id": "activitybar",
            "value": [
                {
                    "workbench.activityBar.visible" : true
                },
                {
                    "workbench.activityBar.visible" : false
                }
            ]
        }
    },

    /**
    * Fold/Unfold
    **/
    {
        "key": "shift+ctrl+[",
        "command": "editor.fold",
        "when": "editorFocus"
    },
    {
        "key": "shift+ctrl+]",
        "command": "editor.unfold",
        "when": "editorFocus"
    },

    /**
    * File Explorer
    **/
    {
        "key": "ctrl+d",
        "command": "duplicate.execute",
        "when": "explorerViewletVisible && filesExplorerFocus && !explorerResourceIsRoot && !inputFocus"
    },
    {
        "key": "ctrl+n",
        "command": "explorer.newFile",
        "when": "explorerViewletVisible && filesExplorerFocus && !inputFocus"
    },
    {
        "key": "shift+ctrl+n",
        "command": "explorer.newFolder",
        "when": "explorerViewletVisible && filesExplorerFocus && !inputFocus"
    },
    {
        "key": "ctrl+m ctrl+c",
        "command": "copyRelativeFilePath",
        "when": "!editorFocus"
    },
    {
        "key": "ctrl+k ctrl+shift+c",
        "command": "-copyRelativeFilePath",
        "when": "!editorFocus"
    },

    /**
    * Multi-Cursor
    **/
    {
        "key": "ctrl+backspace",
        "command": "editor.action.moveSelectionToPreviousFindMatch",
        "when": "editorFocus && editorHasMultipleSelections"
    },
    {
        "key": "ctrl+shift+d",
        "command": "editor.action.moveSelectionToNextFindMatch",
        "when": "editorFocus && editorHasMultipleSelections"
    },

    /*
    * Terminal
    */
    {
        "key": "ctrl+w",
        "command": "workbench.action.terminal.kill",
        "when": "terminalFocus"
    },
    {
        "key": "ctrl+j",
        "command": "workbench.action.toggleMaximizedPanel",
        "when": "terminalFocus"
    },
    {
        "key": "shift+down",
        "command": "workbench.action.terminal.scrollDownPage",
        "when": "terminalFocus && terminalProcessSupported && !terminalAltBufferActive"
    },
    {
        "key": "shift+pagedown",
        "command": "-workbench.action.terminal.scrollDownPage",
        "when": "terminalFocus && terminalProcessSupported && !terminalAltBufferActive"
    },
    {
        "key": "shift+up",
        "command": "workbench.action.terminal.scrollUpPage",
        "when": "terminalFocus && terminalProcessSupported && !terminalAltBufferActive"
    },
    {
        "key": "shift+pageup",
        "command": "-workbench.action.terminal.scrollUpPage",
        "when": "terminalFocus && terminalProcessSupported && !terminalAltBufferActive"
    },

    /*
    * Split Screen
    */
    {
        "key": "ctrl+shift+\\",
        "command": "workbench.action.splitEditorOrthogonal"
    },
    {
        "key": "ctrl+shift+\\",
        "command": "-workbench.action.terminal.focusTabs",
        "when": "terminalFocus && terminalProcessSupported || terminalProcessSupported && terminalTabsFocus"
    },
    {
        "key": "ctrl+j",
        "command": "workbench.action.toggleEditorWidths",
        "when": "editorFocus"
    },

    /**
    * Emmet
    */
    {
        "key": "ctrl+m ctrl+i",
        "command": "editor.emmet.action.balanceIn",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+m ctrl+o",
        "command": "editor.emmet.action.balanceOut",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+m ctrl+w",
        "command": "editor.emmet.action.wrapWithAbbreviation",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+m ctrl+m",
        "command": "editor.emmet.action.matchTag",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+m ctrl+e",
        "command": "editor.action.smartSelect.expand",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+m ctrl+r",
        "command": "editor.emmet.action.updateTag",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+m ctrl+backspace",
        "command": "editor.emmet.action.removeTag",
        "when": "editorTextFocus"
    },

    /**
    * VIM
    * I stands for vIm
    */
    {
        "key": "shift+space",
        "command": "extension.vim_escape",
        "when": "editorTextFocus && vim.active && !inDebugRepl"
    },

    /*
     * Markdown
     */
    {
        "key": "ctrl+m ctrl+v",
        "command": "markdown.showPreview",
        "when": "!notebookEditorFocused && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+shift+v",
        "command": "-markdown.showPreview",
        "when": "!notebookEditorFocused && editorLangId == 'markdown'"
    },

    /*
    * Etc.
    */
    {
        "key": "ctrl+shift+/",
        "command": "editor.action.blockComment",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "ctrl+shift+i",
        "command": "-workbench.action.toggleDevTools",
        "when": "isDevelopment"
    },
    {
        "key": "ctrl+m ctrl+f",
        "command": "editor.action.formatDocument",
        "when": "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor"
    },
    {
        "key": "shift+alt+f",
        "command": "-editor.action.formatDocument",
        "when": "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor"
    },
    {
        "key": "ctrl+g",
        "command": "-workbench.action.gotoLine"
    },
    {
        "key": "ctrl+e",
        "command": "-workbench.action.quickOpen"
    },
]
