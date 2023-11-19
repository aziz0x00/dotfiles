## One Dark theme


def set_theme(c):
    palette = {
        "background": "#282c34",
        "background-alt": "#31353f",
        "background-attention": "#181a1f",
        "border": "#282c32",
        "current-line": "#393f4a",
        "selection": "#3b3f4c",
        "foreground": "#abb2bf",
        "foreground-alt": "#e0e0e0",
        "foreground-attention": "#ffffff",
        "comment": "#61afef",
        "cyan": "#56b6c2",
        "green": "#98c379",
        "orange": "#d19a66",
        "red": "#e86671",
        "yellow": "#e5c07b",
    }

    padding = {
        "top": 2,
        "right": 5,
        "bottom": 2,
        "left": 5,
    }

    ## Background color of the completion widget category headers.
    c.colors.completion.category.bg = palette["background"]

    ## Bottom border color of the completion widget category headers.
    c.colors.completion.category.border.bottom = palette["border"]

    ## Top border color of the completion widget category headers.
    c.colors.completion.category.border.top = palette["border"]

    ## Foreground color of completion widget category headers.
    c.colors.completion.category.fg = palette["yellow"]

    ## Background color of the completion widget for even rows.
    c.colors.completion.even.bg = palette["background"]

    ## Background color of the completion widget for odd rows.
    c.colors.completion.odd.bg = palette["background-alt"]

    ## Text color of the completion widget.
    c.colors.completion.fg = palette["foreground"]

    ## Background color of the selected completion item.
    c.colors.completion.item.selected.bg = palette["selection"]

    ## Bottom border color of the selected completion item.
    c.colors.completion.item.selected.border.bottom = palette["selection"]

    ## Top border color of the completion widget category headers.
    c.colors.completion.item.selected.border.top = palette["selection"]

    ## Foreground color of the selected completion item.
    c.colors.completion.item.selected.fg = palette["foreground"]

    ## Foreground color of the matched text in the completion.
    c.colors.completion.match.fg = palette["orange"]

    ## Color of the scrollbar in completion view
    c.colors.completion.scrollbar.bg = palette["background"]

    ## Color of the scrollbar handle in completion view.
    c.colors.completion.scrollbar.fg = palette["foreground"]

    ## Background color for the download bar.
    c.colors.downloads.bar.bg = palette["background"]

    ## Background color for downloads with errors.
    c.colors.downloads.error.bg = palette["background"]

    ## Foreground color for downloads with errors.
    c.colors.downloads.error.fg = palette["red"]

    ## Color gradient stop for download backgrounds.
    c.colors.downloads.stop.bg = palette["background"]

    ## Color gradient interpolation system for download backgrounds.
    ## Type: ColorSystem
    ## Valid values:
    ##   - rgb: Interpolate in the RGB color system.
    ##   - hsv: Interpolate in the HSV color system.
    ##   - hsl: Interpolate in the HSL color system.
    ##   - none: Don't show a gradient.
    c.colors.downloads.system.bg = "none"

    ## Background color for hints. Note that you can use a `rgba(...)` value
    ## for transparency.
    c.colors.hints.bg = palette["background"]

    ## Font color for hints.
    c.colors.hints.fg = palette["yellow"]

    ## Hints
    c.hints.border = "1px solid " + palette["background-alt"]

    ## Font color for the matched part of hints.
    c.colors.hints.match.fg = palette["selection"]

    ## Background color of the keyhint widget.
    c.colors.keyhint.bg = "#f0" + palette["background"][1:]

    ## Text color for the keyhint widget.
    c.colors.keyhint.fg = palette["yellow"]

    ## Highlight color for keys to complete the current keychain.
    c.colors.keyhint.suffix.fg = palette["foreground"]

    ## Background color of an error message.
    c.colors.messages.error.bg = palette["background"]

    ## Border color of an error message.
    c.colors.messages.error.border = palette["background-alt"]

    ## Foreground color of an error message.
    c.colors.messages.error.fg = palette["red"]

    ## Background color of an info message.
    c.colors.messages.info.bg = palette["background"]

    ## Border color of an info message.
    c.colors.messages.info.border = palette["background-alt"]

    ## Foreground color an info message.
    c.colors.messages.info.fg = palette["comment"]

    ## Background color of a warning message.
    c.colors.messages.warning.bg = palette["background"]

    ## Border color of a warning message.
    c.colors.messages.warning.border = palette["background-alt"]

    ## Foreground color a warning message.
    c.colors.messages.warning.fg = palette["red"]

    ## Background color for prompts.
    c.colors.prompts.bg = palette["background"]

    # ## Border used around UI elements in prompts.
    c.colors.prompts.border = "1px solid " + palette["background-alt"]

    ## Foreground color for prompts.
    c.colors.prompts.fg = palette["cyan"]

    ## Background color for the selected item in filename prompts.
    c.colors.prompts.selected.bg = palette["selection"]

    ## Background color of the statusbar in caret mode.
    c.colors.statusbar.caret.bg = palette["background"]

    ## Foreground color of the statusbar in caret mode.
    c.colors.statusbar.caret.fg = palette["orange"]

    ## Background color of the statusbar in caret mode with a selection.
    c.colors.statusbar.caret.selection.bg = palette["background"]

    ## Foreground color of the statusbar in caret mode with a selection.
    c.colors.statusbar.caret.selection.fg = palette["orange"]

    ## Background color of the statusbar in command mode.
    c.colors.statusbar.command.bg = palette["background"]

    ## Foreground color of the statusbar in command mode.
    c.colors.statusbar.command.fg = palette["foreground"]

    ## Background color of the statusbar in private browsing + command mode.
    c.colors.statusbar.command.private.bg = palette["background"]

    ## Foreground color of the statusbar in private browsing + command mode.
    c.colors.statusbar.command.private.fg = palette["foreground-alt"]

    ## Background color of the statusbar in insert mode.
    c.colors.statusbar.insert.bg = palette["background-attention"]

    ## Foreground color of the statusbar in insert mode.
    c.colors.statusbar.insert.fg = palette["foreground-attention"]

    ## Background color of the statusbar.
    c.colors.statusbar.normal.bg = palette["background"]

    ## Foreground color of the statusbar.
    c.colors.statusbar.normal.fg = palette["foreground"]

    ## Background color of the statusbar in passthrough mode.
    c.colors.statusbar.passthrough.bg = palette["background"]

    ## Foreground color of the statusbar in passthrough mode.
    c.colors.statusbar.passthrough.fg = palette["orange"]

    ## Background color of the statusbar in private browsing mode.
    c.colors.statusbar.private.bg = palette["background-alt"]

    ## Foreground color of the statusbar in private browsing mode.
    c.colors.statusbar.private.fg = palette["foreground-alt"]

    ## Background color of the progress bar.
    c.colors.statusbar.progress.bg = palette["foreground"]

    ## Foreground color of the URL in the statusbar on error.
    c.colors.statusbar.url.error.fg = palette["red"]

    ## Default foreground color of the URL in the statusbar.
    c.colors.statusbar.url.fg = palette["foreground"]

    ## Foreground color of the URL in the statusbar for hovered links.
    c.colors.statusbar.url.hover.fg = palette["cyan"]

    ## Foreground color of the URL in the statusbar on successful load
    c.colors.statusbar.url.success.http.fg = palette["green"]

    ## Foreground color of the URL in the statusbar on successful load
    c.colors.statusbar.url.success.https.fg = palette["green"]

    ## Foreground color of the URL in the statusbar when there's a warning.
    c.colors.statusbar.url.warn.fg = palette["yellow"]

    ## Status bar padding
    c.statusbar.padding = padding

    ## Background color of the tab bar.
    ## Type: QtColor
    c.colors.tabs.bar.bg = palette["selection"]

    ## Background color of unselected even tabs.
    ## Type: QtColor
    c.colors.tabs.even.bg = palette["selection"]

    ## Foreground color of unselected even tabs.
    ## Type: QtColor
    c.colors.tabs.even.fg = palette["foreground"]

    ## Color for the tab indicator on errors.
    ## Type: QtColor
    c.colors.tabs.indicator.error = palette["red"]

    ## Color gradient start for the tab indicator.
    ## Type: QtColor
    c.colors.tabs.indicator.start = palette["orange"]

    ## Color gradient end for the tab indicator.
    ## Type: QtColor
    c.colors.tabs.indicator.stop = palette["green"]

    ## Color gradient interpolation system for the tab indicator.
    ## Type: ColorSystem
    ## Valid values:
    ##   - rgb: Interpolate in the RGB color system.
    ##   - hsv: Interpolate in the HSV color system.
    ##   - hsl: Interpolate in the HSL color system.
    ##   - none: Don't show a gradient.
    c.colors.tabs.indicator.system = "none"

    ## Background color of unselected odd tabs.
    ## Type: QtColor
    c.colors.tabs.odd.bg = palette["selection"]

    ## Foreground color of unselected odd tabs.
    ## Type: QtColor
    c.colors.tabs.odd.fg = palette["foreground"]

    # ## Background color of selected even tabs.
    # ## Type: QtColor
    c.colors.tabs.selected.even.bg = palette["background"]

    # ## Foreground color of selected even tabs.
    # ## Type: QtColor
    c.colors.tabs.selected.even.fg = palette["foreground"]

    # ## Background color of selected odd tabs.
    # ## Type: QtColor
    c.colors.tabs.selected.odd.bg = palette["background"]

    # ## Foreground color of selected odd tabs.
    # ## Type: QtColor
    c.colors.tabs.selected.odd.fg = palette["foreground"]

    ## Tab padding
    c.tabs.padding = padding
    c.tabs.indicator.width = 1
    c.tabs.favicons.scale = 1


set_theme(c)
config.load_autoconfig()


def set_theme2(c):
    # credits to theova/base16-qutebrowser for the original template

    ##########
    # COLORS #
    ##########

    # base16 colors but with variable names that
    # reflect what the color is mainly used for

    bg_default = "#282c34"  # main shade darkest
    bg_lighter = "#3b3f4c"
    bg_selection = "#282c34"  # current active tab
    # "#545862"
    fg_disabled = "#565c64"
    fg_default = "#abb2bf"
    # "#b6bdca"
    bg_lightest = "#c8ccd4"  # main shade lightest
    fg_error = "#e06c75"  # red
    # "#d19a66"                     # orange
    bg_hint = "#e5c07b"  # yellow
    fg_matched_text = "#98c379"  # green
    bg_passthrough_mode = "#56b6c2"  # teal
    bg_insert_mode = "#61afef"  # blue
    bg_warning = "#c678dd"  # purple
    # "#be5046"                     # dark red

    ############
    # SETTINGS #
    ############

    # Text color of the completion widget. May be a single color to use for
    # all columns or a list of three colors, one for each column.
    c.colors.completion.fg = fg_default

    # Background color of the completion widget for odd rows.
    c.colors.completion.odd.bg = bg_lighter

    # Background color of the completion widget for even rows.
    c.colors.completion.even.bg = bg_default

    # Foreground color of completion widget category headers.
    c.colors.completion.category.fg = bg_hint

    # Background color of the completion widget category headers.
    c.colors.completion.category.bg = bg_default

    # Top border color of the completion widget category headers.
    c.colors.completion.category.border.top = bg_default

    # Bottom border color of the completion widget category headers.
    c.colors.completion.category.border.bottom = bg_default

    # Foreground color of the selected completion item.
    c.colors.completion.item.selected.fg = fg_default

    # Background color of the selected completion item.
    c.colors.completion.item.selected.bg = bg_selection

    # Top border color of the selected completion item.
    c.colors.completion.item.selected.border.top = bg_selection

    # Bottom border color of the selected completion item.
    c.colors.completion.item.selected.border.bottom = bg_selection

    # Foreground color of the matched text in the selected completion item.
    c.colors.completion.item.selected.match.fg = fg_matched_text

    # Foreground color of the matched text in the completion.
    c.colors.completion.match.fg = fg_matched_text

    # Color of the scrollbar handle in the completion view.
    c.colors.completion.scrollbar.fg = fg_default

    # Color of the scrollbar in the completion view.
    c.colors.completion.scrollbar.bg = bg_default

    # Background color of disabled items in the context menu.
    c.colors.contextmenu.disabled.bg = bg_lighter

    # Foreground color of disabled items in the context menu.
    c.colors.contextmenu.disabled.fg = fg_disabled

    # Background color of the context menu. If set to null, the Qt default is used.
    c.colors.contextmenu.menu.bg = bg_default

    # Foreground color of the context menu. If set to null, the Qt default is used.
    c.colors.contextmenu.menu.fg = fg_default

    # Background color of the context menu’s selected item. If set to null, the Qt default is used.
    c.colors.contextmenu.selected.bg = bg_selection

    # Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
    c.colors.contextmenu.selected.fg = fg_default

    # Background color for the download bar.
    c.colors.downloads.bar.bg = bg_default

    # Color gradient start for download text.
    c.colors.downloads.start.fg = bg_default

    # Color gradient start for download backgrounds.
    c.colors.downloads.start.bg = bg_insert_mode

    # Color gradient end for download text.
    c.colors.downloads.stop.fg = bg_default

    # Color gradient stop for download backgrounds.
    c.colors.downloads.stop.bg = bg_passthrough_mode

    # Foreground color for downloads with errors.
    c.colors.downloads.error.fg = fg_error

    # Font color for hints.
    c.colors.hints.fg = bg_default

    # Background color for hints. Note that you can use a `rgba(...)` value
    # for transparency.
    c.colors.hints.bg = bg_hint

    # Font color for the matched part of hints.
    c.colors.hints.match.fg = fg_default

    # Text color for the keyhint widget.
    c.colors.keyhint.fg = fg_default

    # Highlight color for keys to complete the current keychain.
    c.colors.keyhint.suffix.fg = fg_default

    # Background color of the keyhint widget.
    c.colors.keyhint.bg = bg_default

    # Foreground color of an error message.
    c.colors.messages.error.fg = bg_default

    # Background color of an error message.
    c.colors.messages.error.bg = fg_error

    # Border color of an error message.
    c.colors.messages.error.border = fg_error

    # Foreground color of a warning message.
    c.colors.messages.warning.fg = bg_default

    # Background color of a warning message.
    c.colors.messages.warning.bg = bg_warning

    # Border color of a warning message.
    c.colors.messages.warning.border = bg_warning

    # Foreground color of an info message.
    c.colors.messages.info.fg = fg_default

    # Background color of an info message.
    c.colors.messages.info.bg = bg_default

    # Border color of an info message.
    c.colors.messages.info.border = bg_default

    # Foreground color for prompts.
    c.colors.prompts.fg = fg_default

    # Border used around UI elements in prompts.
    c.colors.prompts.border = bg_default

    # Background color for prompts.
    c.colors.prompts.bg = bg_default

    # Background color for the selected item in filename prompts.
    c.colors.prompts.selected.bg = bg_selection

    # Foreground color for the selected item in filename prompts.
    c.colors.prompts.selected.fg = fg_default

    # Foreground color of the statusbar.
    c.colors.statusbar.normal.fg = fg_matched_text

    # Background color of the statusbar.
    c.colors.statusbar.normal.bg = bg_default

    # Foreground color of the statusbar in insert mode.
    c.colors.statusbar.insert.fg = bg_default

    # Background color of the statusbar in insert mode.
    c.colors.statusbar.insert.bg = bg_insert_mode

    # Foreground color of the statusbar in passthrough mode.
    c.colors.statusbar.passthrough.fg = bg_default

    # Background color of the statusbar in passthrough mode.
    c.colors.statusbar.passthrough.bg = bg_passthrough_mode

    # Foreground color of the statusbar in private browsing mode.
    c.colors.statusbar.private.fg = bg_default

    # Background color of the statusbar in private browsing mode.
    c.colors.statusbar.private.bg = bg_lighter

    # Foreground color of the statusbar in command mode.
    c.colors.statusbar.command.fg = fg_default

    # Background color of the statusbar in command mode.
    c.colors.statusbar.command.bg = bg_default

    # Foreground color of the statusbar in private browsing + command mode.
    c.colors.statusbar.command.private.fg = fg_default

    # Background color of the statusbar in private browsing + command mode.
    c.colors.statusbar.command.private.bg = bg_default

    # Foreground color of the statusbar in caret mode.
    c.colors.statusbar.caret.fg = bg_default

    # Background color of the statusbar in caret mode.
    c.colors.statusbar.caret.bg = bg_warning

    # Foreground color of the statusbar in caret mode with a selection.
    c.colors.statusbar.caret.selection.fg = bg_default

    # Background color of the statusbar in caret mode with a selection.
    c.colors.statusbar.caret.selection.bg = bg_insert_mode

    # Background color of the progress bar.
    c.colors.statusbar.progress.bg = bg_insert_mode

    # Default foreground color of the URL in the statusbar.
    c.colors.statusbar.url.fg = fg_default

    # Foreground color of the URL in the statusbar on error.
    c.colors.statusbar.url.error.fg = fg_error

    # Foreground color of the URL in the statusbar for hovered links.
    c.colors.statusbar.url.hover.fg = fg_default

    # Foreground color of the URL in the statusbar on successful load
    # (http).
    c.colors.statusbar.url.success.http.fg = bg_passthrough_mode

    # Foreground color of the URL in the statusbar on successful load
    # (https).
    c.colors.statusbar.url.success.https.fg = fg_matched_text

    # Foreground color of the URL in the statusbar when there's a warning.
    c.colors.statusbar.url.warn.fg = bg_warning

    # Background color of the tab bar.
    c.colors.tabs.bar.bg = bg_default

    # Color gradient start for the tab indicator.
    c.colors.tabs.indicator.start = bg_insert_mode

    # Color gradient end for the tab indicator.
    c.colors.tabs.indicator.stop = bg_passthrough_mode

    # Color for the tab indicator on errors.
    c.colors.tabs.indicator.error = fg_error

    # Foreground color of unselected odd tabs.
    c.colors.tabs.odd.fg = fg_default

    # Background color of unselected odd tabs.
    c.colors.tabs.odd.bg = bg_lighter

    # Foreground color of unselected even tabs.
    c.colors.tabs.even.fg = fg_default

    # Background color of unselected even tabs.
    c.colors.tabs.even.bg = bg_default

    # Background color of pinned unselected even tabs.
    c.colors.tabs.pinned.even.bg = bg_passthrough_mode

    # Foreground color of pinned unselected even tabs.
    c.colors.tabs.pinned.even.fg = bg_lightest

    # Background color of pinned unselected odd tabs.
    c.colors.tabs.pinned.odd.bg = fg_matched_text

    # Foreground color of pinned unselected odd tabs.
    c.colors.tabs.pinned.odd.fg = bg_lightest

    # Background color of pinned selected even tabs.
    c.colors.tabs.pinned.selected.even.bg = bg_selection

    # Foreground color of pinned selected even tabs.
    c.colors.tabs.pinned.selected.even.fg = fg_default

    # Background color of pinned selected odd tabs.
    c.colors.tabs.pinned.selected.odd.bg = bg_selection

    # Foreground color of pinned selected odd tabs.
    c.colors.tabs.pinned.selected.odd.fg = fg_default

    # Foreground color of selected odd tabs.
    c.colors.tabs.selected.odd.fg = fg_default

    # Background color of selected odd tabs.
    c.colors.tabs.selected.odd.bg = bg_selection

    # Foreground color of selected even tabs.
    c.colors.tabs.selected.even.fg = fg_default

    # Background color of selected even tabs.
    c.colors.tabs.selected.even.bg = bg_selection

    # Background color for webpages if unset (or empty to use the theme's
    # color).
    # c.colors.webpage.bg = bg_default
    config.load_autoconfig()
