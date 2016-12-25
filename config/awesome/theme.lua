---------------------------
-- Default awesome theme --
---------------------------

-- Some colors
color_normal           = "#343034"
color_normal           = "#626262"
color_hlight1          = "#503939"
color_hlight2          = "#875f5f"
color_background       = "#121212"
color_background_focus = "#242424"

theme = {}

theme.font          = "terminus 8"

theme.bg_normal     = color_background
theme.bg_focus      = color_background
theme.bg_urgent     = color_background
theme.bg_minimize   = color_background
theme.bg_systray    = color_background

theme.fg_normal     = color_normal
theme.fg_focus      = color_hlight2
theme.fg_urgent     = color_normal
theme.fg_minimize   = color_normal

theme.border_width  = 1
theme.border_normal = "#000000"
theme.border_focus  = color_hlight1
theme.border_marked = "#00ff00"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = "~/.config/awesome/taglist/squarefw.png"
theme.taglist_squares_unsel = "~/.config/awesome/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "~/.config/awesome/submenu.png"
theme.menu_height = 15
theme.menu_width  = 100

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "~/.config/awesome/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "~/.config/awesome/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "~/.config/awesome/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "~/.config/awesome/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "~/.config/awesome/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "~/.config/awesome/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "~/.config/awesome/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "~/.config/awesome/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "~/.config/awesome/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "~/.config/awesome/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "~/.config/awesome/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "~/.config/awesome/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "~/.config/awesome/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "~/.config/awesome/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "~/.config/awesome/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "~/.config/awesome/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "~/.config/awesome/titlebar/maximized_focus_active.png"

theme.wallpaper = "~/.config/awesome/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh      = "~/.config/awesome/layouts/fairhw.png"
theme.layout_fairv      = "~/.config/awesome/layouts/fairvw.png"
theme.layout_floating   = "~/.config/awesome/layouts/floatingw.png"
theme.layout_magnifier  = "~/.config/awesome/layouts/magnifierw.png"
theme.layout_max        = "~/.config/awesome/layouts/maxw.png"
theme.layout_fullscreen = "~/.config/awesome/layouts/fullscreenw.png"
theme.layout_tilebottom = "~/.config/awesome/layouts/tilebottomw.png"
theme.layout_tileleft   = "~/.config/awesome/layouts/tileleftw.png"
theme.layout_tile       = "~/.config/awesome/layouts/tilew.png"
theme.layout_tiletop    = "~/.config/awesome/layouts/tiletopw.png"
theme.layout_spiral     = "~/.config/awesome/layouts/spiralw.png"
theme.layout_dwindle    = "~/.config/awesome/layouts/dwindlew.png"

theme.awesome_icon = nil

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

theme.useless_gap_width = 32

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
