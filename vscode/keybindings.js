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
        "key": "ctrl+m ctrl+g",
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
    {
        "key": "ctrl+m ctrl+shift+[",
        "command": "pr.collapseAllComments",
        "when": "editorFocus"
    },
    {
        "key": "ctrl+m ctrl+shift+]",
        "command": "pr.expandAllComments",
        "when": "editorFocus"
    },
    {
        "key": "ctrl+m ctrl+shift+g",
        "command": "github:activePullRequest.focus"
    },
    {
        "key": "ctrl+shift+space",
        "command": "-issue.suggestRefresh",
        "when": "suggestWidgetVisible"
    },
    {
        "key": "ctrl+shift+space",
        "command": "git.refresh",
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
    * Toggle Status Bar
    **/
    {
        "key": "shift+alt+s",
        "command": "toggle",
        "when": "",
        "args": {
            "id": "statusbar",
            "value": [
                {
                    "workbench.statusBar.visible": true,
                },
                {
                    "workbench.statusBar.visible": false,
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
        "when": "explorerViewletVisible && filesExplorerFocus && !inputFocus"
    },
    {
        "key": "ctrl+k ctrl+shift+c",
        "command": "-copyRelativeFilePath",
        "when": "!editorFocus"
    },
    {
        "key": "shift+ctrl+[",
        "command": "list.collapseAll",
        "when": "listFocus && !inputFocus"
    },
    {
        "key": "ctrl+left",
        "command": "-list.collapseAll",
        "when": "listFocus && !inputFocus"
    },
    {
        "key": "ctrl+shift+space",
        "command": "workbench.files.action.refreshFilesExplorer",
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
    * Better Terminal
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
        "key": "shift+pagedown",
        "command": "-workbench.action.terminal.scrollDownPage",
        "when": "terminalFocus && terminalHasBeenCreated && !terminalAltBufferActive || terminalFocus && terminalProcessSupported && !terminalAltBufferActive"
    },
    {
        "key": "shift+pageup",
        "command": "-workbench.action.terminal.scrollUpPage",
        "when": "terminalFocus && terminalHasBeenCreated && !terminalAltBufferActive || terminalFocus && terminalProcessSupported && !terminalAltBufferActive"
    },
    {
        "key": "shift+down",
        "command": "workbench.action.terminal.scrollDown",
        "when": "terminalFocus && terminalHasBeenCreated && !terminalAltBufferActive || terminalFocus && terminalProcessSupported && !terminalAltBufferActive"
    },
    {
        "key": "shift+up",
        "command": "workbench.action.terminal.scrollUp",
        "when": "terminalFocus && terminalHasBeenCreated && !terminalAltBufferActive || terminalFocus && terminalProcessSupported && !terminalAltBufferActive"
    },
    {
        "key": "ctrl+tab",
        "command": "workbench.action.terminal.focusNext",
        "when": "terminalFocus && terminalHasBeenCreated && !terminalEditorFocus || terminalFocus && terminalProcessSupported && !terminalEditorFocus"
    },
    {
        "key": "ctrl+shift+tab",
        "command": "workbench.action.terminal.focusPrevious",
        "when": "terminalFocus && terminalHasBeenCreated && !terminalEditorFocus || terminalFocus && terminalProcessSupported && !terminalEditorFocus"
    },
    {
        "key": "ctrl+pagedown",
        "command": "-workbench.action.terminal.focusNext",
        "when": "terminalFocus && terminalHasBeenCreated && !terminalEditorFocus || terminalFocus && terminalProcessSupported && !terminalEditorFocus"
    },
    {
        "key": "ctrl+pageup",
        "command": "-workbench.action.terminal.focusPrevious",
        "when": "terminalFocus && terminalHasBeenCreated && !terminalEditorFocus || terminalFocus && terminalProcessSupported && !terminalEditorFocus"
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
    {
        "key": "ctrl+shift+w",
        "command": "-workbench.action.closeWindow"
    },
]
