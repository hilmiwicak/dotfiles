{
    "$help": "https://aka.ms/terminal-documentation",
    "$schema": "https://aka.ms/terminal-profiles-schema",
    "actions": 
    [
        {
            "command": "find",
            "keys": "ctrl+alt+f"
        },
        {
            "command": 
            {
                "action": "openSettings",
                "target": "settingsFile"
            }
        },
        {
            "command": 
            {
                "action": "splitPane",
                "split": "right"
            }
        },
        {
            "command": 
            {
                "action": "copy",
                "singleLine": false
            },
            "keys": "ctrl+c"
        },
        {
            "command": "paste",
            "keys": "ctrl+shift+v"
        },
        {
            "command": "unbound",
            "keys": "ctrl+shift+f"
        },
        {
            "command": "unbound",
            "keys": "ctrl+shift+p"
        },
        {
            "command": "unbound",
            "keys": "ctrl+shift+comma"
        },
        {
            "command": "unbound",
            "keys": "ctrl+shift+\\"
        },
        {
            "command": "unbound",
            "keys": "ctrl+\\"
        },
        {
            "command": "unbound",
            "keys": "ctrl+comma"
        },
        {
            "command": "unbound",
            "keys": "ctrl+minus"
        },
        {
            "command": "unbound",
            "keys": "ctrl+plus"
        },
        {
            "command": "unbound",
            "keys": "ctrl+alt+shift+comma"
        },
        {
            "command": "unbound",
            "keys": "ctrl+alt+comma"
        },
        {
            "command": 
            {
                "action": "scrollUp"
            },
            "keys": "shift+up"
        },
        {
            "command": 
            {
                "action": "splitPane",
                "split": "down"
            }
        },
        {
            "command": 
            {
                "action": "scrollDown"
            },
            "keys": "shift+down"
        },
        {
            "command": 
            {
                "action": "splitPane",
                "split": "auto",
                "splitMode": "duplicate"
            },
            "keys": "alt+shift+d"
        },
        {
            "command": 
            {
                "action": "commandPalette"
            },
            "keys": "ctrl+alt+p"
        },
        {
            "command": 
            {
                "action": "adjustFontSize",
                "delta": -1
            },
            "keys": "ctrl+alt+minus"
        },
        {
            "command": 
            {
                "action": "adjustFontSize",
                "delta": 1
            },
            "keys": "ctrl+alt+plus"
        },
        {
            "command": "toggleFocusMode",
            "keys": "alt+enter"
        },
        {
          "command": "toggleFullscreen",
          "keys": "alt+shift+enter"
        }
    ],
    "copyFormatting": "none",
    "copyOnSelect": false,
    "defaultProfile": "{07b52e3e-de2c-5db4-bd2d-ba144ed6c273}",
    "disableAnimations": true,
    "profiles": 
    {
        "defaults": 
        {
            "font": 
            {
                "size": 11
            },
            "opacity": 100,
            "useAcrylic": false
        },
        "list": 
        [
            {
                "colorScheme": "Catppuccin Frappe",
                "commandline": "C:\\Windows\\system32\\wsl.exe -d Ubuntu-20.04",
                "tabTitle": "Ubuntu",
                "cursorShape": "filledBox",
                "experimental.retroTerminalEffect": false,
                "font": 
                {
                    "face": "RobotoMono NF",
                    "size": 11
                },
                "guid": "{07b52e3e-de2c-5db4-bd2d-ba144ed6c273}",
                "hidden": false,
                "name": "Ubuntu-20.04",
                "source": "Windows.Terminal.Wsl",
                "startingDirectory": "/home/wicak"
            },
            {
                "cursorShape": "filledBox",
                "guid": "{5fb123f1-af88-5b5c-8953-d14a8def1978}",
                "hidden": false,
                "name": "PowerShell 7",
                "source": "Windows.Terminal.PowershellCore"
            },
            {
                "cursorShape": "filledBox",
                "guid": "{574e775e-4f2a-5b96-ac1e-a2962a402336}",
                "hidden": true,
                "name": "PowerShell 7",
                "source": "Windows.Terminal.PowershellCore"
            },
            {
                "cursorShape": "filledBox",
                "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
                "hidden": true,
                "name": "Windows PowerShell"
            },
            {
                "guid": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
                "hidden": false,
                "name": "cmd "
            },
            {
                "guid": "{b453ae62-4e3d-5e58-b989-0a998ec441b8}",
                "hidden": false,
                "name": "Azure Cloud Shell",
                "source": "Windows.Terminal.Azure"
            },
            {
                "guid": "{ea2c75af-e923-5a81-a699-72bd2c8c8af4}",
                "hidden": false,
                "name": "Developer Command Prompt for VS 2019 (2)",
                "source": "Windows.Terminal.VisualStudio"
            },
            {
                "guid": "{b2babfb1-4ec3-5faf-9d6c-f61e9ccd16ea}",
                "hidden": false,
                "name": "Developer PowerShell for VS 2019 (2)",
                "source": "Windows.Terminal.VisualStudio"
            },
            {
                "guid": "{a47025eb-dbf0-5408-8783-6e69ad2266a2}",
                "hidden": true,
                "name": "Developer Command Prompt for VS 2019",
                "source": "Windows.Terminal.VisualStudio"
            },
            {
                "guid": "{14f1eddd-93a4-5895-b566-a1047e5c0a1e}",
                "hidden": true,
                "name": "Developer PowerShell for VS 2019",
                "source": "Windows.Terminal.VisualStudio"
            },
            {
                "guid": "{c889c324-768a-5124-9da5-e2259363803e}",
                "hidden": true,
                "name": "Developer Command Prompt for VS 2017",
                "source": "Windows.Terminal.VisualStudio"
            }
        ]
    },
    "schemes": 
    [
        {
            "background": "#0C0C0C",
            "black": "#0C0C0C",
            "blue": "#0037DA",
            "brightBlack": "#767676",
            "brightBlue": "#3B78FF",
            "brightCyan": "#61D6D6",
            "brightGreen": "#16C60C",
            "brightPurple": "#B4009E",
            "brightRed": "#E74856",
            "brightWhite": "#F2F2F2",
            "brightYellow": "#F9F1A5",
            "cursorColor": "#FFFFFF",
            "cyan": "#3A96DD",
            "foreground": "#CCCCCC",
            "green": "#13A10E",
            "name": "Campbell",
            "purple": "#881798",
            "red": "#C50F1F",
            "selectionBackground": "#36FFB9",
            "white": "#CCCCCC",
            "yellow": "#C19C00"
        },
        {
            "background": "#012456",
            "black": "#0C0C0C",
            "blue": "#0037DA",
            "brightBlack": "#767676",
            "brightBlue": "#3B78FF",
            "brightCyan": "#61D6D6",
            "brightGreen": "#16C60C",
            "brightPurple": "#B4009E",
            "brightRed": "#E74856",
            "brightWhite": "#F2F2F2",
            "brightYellow": "#F9F1A5",
            "cursorColor": "#FFFFFF",
            "cyan": "#3A96DD",
            "foreground": "#CCCCCC",
            "green": "#13A10E",
            "name": "Campbell Powershell",
            "purple": "#881798",
            "red": "#C50F1F",
            "selectionBackground": "#FFFFFF",
            "white": "#CCCCCC",
            "yellow": "#C19C00"
        },
        {
            "background": "#303446",
            "black": "#51576D",
            "blue": "#8CAAEE",
            "brightBlack": "#626880",
            "brightBlue": "#8CAAEE",
            "brightCyan": "#81C8BE",
            "brightGreen": "#A6D189",
            "brightPurple": "#F4B8E4",
            "brightRed": "#E78284",
            "brightWhite": "#A5ADCE",
            "brightYellow": "#E5C890",
            "cursorColor": "#F2D5CF",
            "cyan": "#81C8BE",
            "foreground": "#C6D0F5",
            "green": "#A6D189",
            "name": "Catppuccin Frappe",
            "purple": "#F4B8E4",
            "red": "#E78284",
            "selectionBackground": "#626880",
            "white": "#B5BFE2",
            "yellow": "#E5C890"
        },
        {
            "background": "#EFF1F5",
            "black": "#5C5F77",
            "blue": "#1E66F5",
            "brightBlack": "#6C6F85",
            "brightBlue": "#1E66F5",
            "brightCyan": "#179299",
            "brightGreen": "#40A02B",
            "brightPurple": "#EA76CB",
            "brightRed": "#D20F39",
            "brightWhite": "#BCC0CC",
            "brightYellow": "#DF8E1D",
            "cursorColor": "#DC8A78",
            "cyan": "#179299",
            "foreground": "#4C4F69",
            "green": "#40A02B",
            "name": "Catppuccin Latte",
            "purple": "#EA76CB",
            "red": "#D20F39",
            "selectionBackground": "#ACB0BE",
            "white": "#ACB0BE",
            "yellow": "#DF8E1D"
        },
        {
            "background": "#24273A",
            "black": "#494D64",
            "blue": "#8AADF4",
            "brightBlack": "#5B6078",
            "brightBlue": "#8AADF4",
            "brightCyan": "#8BD5CA",
            "brightGreen": "#A6DA95",
            "brightPurple": "#F5BDE6",
            "brightRed": "#ED8796",
            "brightWhite": "#B8C0E0",
            "brightYellow": "#EED49F",
            "cursorColor": "#F4DBD6",
            "cyan": "#8BD5CA",
            "foreground": "#CAD3F5",
            "green": "#A6DA95",
            "name": "Catppuccin Macchiato",
            "purple": "#F5BDE6",
            "red": "#ED8796",
            "selectionBackground": "#5B6078",
            "white": "#B8C0E0",
            "yellow": "#EED49F"
        },
        {
            "background": "#1E1E2E",
            "black": "#45475A",
            "blue": "#89B4FA",
            "brightBlack": "#585B70",
            "brightBlue": "#89B4FA",
            "brightCyan": "#94E2D5",
            "brightGreen": "#A6E3A1",
            "brightPurple": "#F5C2E7",
            "brightRed": "#F38BA8",
            "brightWhite": "#A6ADC8",
            "brightYellow": "#F9E2AF",
            "cursorColor": "#F5E0DC",
            "cyan": "#94E2D5",
            "foreground": "#CDD6F4",
            "green": "#A6E3A1",
            "name": "Catppuccin Mocha",
            "purple": "#F5C2E7",
            "red": "#F38BA8",
            "selectionBackground": "#585B70",
            "white": "#BAC2DE",
            "yellow": "#F9E2AF"
        },
        {
            "background": "#282C34",
            "black": "#282C34",
            "blue": "#61AFEF",
            "brightBlack": "#5A6374",
            "brightBlue": "#61AFEF",
            "brightCyan": "#56B6C2",
            "brightGreen": "#98C379",
            "brightPurple": "#C678DD",
            "brightRed": "#E06C75",
            "brightWhite": "#DCDFE4",
            "brightYellow": "#E5C07B",
            "cursorColor": "#FFFFFF",
            "cyan": "#56B6C2",
            "foreground": "#DCDFE4",
            "green": "#98C379",
            "name": "One Half Dark",
            "purple": "#C678DD",
            "red": "#E06C75",
            "selectionBackground": "#FFFFFF",
            "white": "#DCDFE4",
            "yellow": "#E5C07B"
        },
        {
            "background": "#FAFAFA",
            "black": "#383A42",
            "blue": "#0184BC",
            "brightBlack": "#4F525D",
            "brightBlue": "#61AFEF",
            "brightCyan": "#56B5C1",
            "brightGreen": "#98C379",
            "brightPurple": "#C577DD",
            "brightRed": "#DF6C75",
            "brightWhite": "#FFFFFF",
            "brightYellow": "#E4C07A",
            "cursorColor": "#4F525D",
            "cyan": "#0997B3",
            "foreground": "#383A42",
            "green": "#50A14F",
            "name": "One Half Light",
            "purple": "#A626A4",
            "red": "#E45649",
            "selectionBackground": "#FFFFFF",
            "white": "#FAFAFA",
            "yellow": "#C18301"
        },
        {
            "background": "#002B36",
            "black": "#002B36",
            "blue": "#268BD2",
            "brightBlack": "#073642",
            "brightBlue": "#839496",
            "brightCyan": "#93A1A1",
            "brightGreen": "#586E75",
            "brightPurple": "#6C71C4",
            "brightRed": "#CB4B16",
            "brightWhite": "#FDF6E3",
            "brightYellow": "#657B83",
            "cursorColor": "#FFFFFF",
            "cyan": "#2AA198",
            "foreground": "#839496",
            "green": "#859900",
            "name": "Solarized Dark",
            "purple": "#D33682",
            "red": "#DC322F",
            "selectionBackground": "#FFFFFF",
            "white": "#EEE8D5",
            "yellow": "#B58900"
        },
        {
            "background": "#FDF6E3",
            "black": "#002B36",
            "blue": "#268BD2",
            "brightBlack": "#073642",
            "brightBlue": "#839496",
            "brightCyan": "#93A1A1",
            "brightGreen": "#586E75",
            "brightPurple": "#6C71C4",
            "brightRed": "#CB4B16",
            "brightWhite": "#FDF6E3",
            "brightYellow": "#657B83",
            "cursorColor": "#002B36",
            "cyan": "#2AA198",
            "foreground": "#657B83",
            "green": "#859900",
            "name": "Solarized Light",
            "purple": "#D33682",
            "red": "#DC322F",
            "selectionBackground": "#FFFFFF",
            "white": "#EEE8D5",
            "yellow": "#B58900"
        },
        {
            "background": "#000000",
            "black": "#000000",
            "blue": "#3465A4",
            "brightBlack": "#555753",
            "brightBlue": "#729FCF",
            "brightCyan": "#34E2E2",
            "brightGreen": "#8AE234",
            "brightPurple": "#AD7FA8",
            "brightRed": "#EF2929",
            "brightWhite": "#EEEEEC",
            "brightYellow": "#FCE94F",
            "cursorColor": "#FFFFFF",
            "cyan": "#06989A",
            "foreground": "#D3D7CF",
            "green": "#4E9A06",
            "name": "Tango Dark",
            "purple": "#75507B",
            "red": "#CC0000",
            "selectionBackground": "#FFFFFF",
            "white": "#D3D7CF",
            "yellow": "#C4A000"
        },
        {
            "background": "#FFFFFF",
            "black": "#000000",
            "blue": "#3465A4",
            "brightBlack": "#555753",
            "brightBlue": "#729FCF",
            "brightCyan": "#34E2E2",
            "brightGreen": "#8AE234",
            "brightPurple": "#AD7FA8",
            "brightRed": "#EF2929",
            "brightWhite": "#EEEEEC",
            "brightYellow": "#FCE94F",
            "cursorColor": "#000000",
            "cyan": "#06989A",
            "foreground": "#555753",
            "green": "#4E9A06",
            "name": "Tango Light",
            "purple": "#75507B",
            "red": "#CC0000",
            "selectionBackground": "#FFFFFF",
            "white": "#D3D7CF",
            "yellow": "#C4A000"
        },
        {
            "background": "#000000",
            "black": "#000000",
            "blue": "#000080",
            "brightBlack": "#808080",
            "brightBlue": "#0000FF",
            "brightCyan": "#00FFFF",
            "brightGreen": "#00FF00",
            "brightPurple": "#FF00FF",
            "brightRed": "#FF0000",
            "brightWhite": "#FFFFFF",
            "brightYellow": "#FFFF00",
            "cursorColor": "#FFFFFF",
            "cyan": "#008080",
            "foreground": "#C0C0C0",
            "green": "#008000",
            "name": "Vintage",
            "purple": "#800080",
            "red": "#800000",
            "selectionBackground": "#FFFFFF",
            "white": "#C0C0C0",
            "yellow": "#808000"
        }
    ],
    "tabWidthMode": "compact"
}
