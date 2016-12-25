--[[
Nyx's awesome theme.  For now, pretty much just the default config plus a few
edits.  SOON IT WILL BE GREAT THOUGH.
]]--

local gears     = require("gears")
local awful     = require("awful")
local wibox     = require("wibox")
local beautiful = require("beautiful")
local naughty   = require("naughty")
local menubar   = require("menubar")
local lain      = require("lain")
awful.rules     = require("awful.rules")
require("awful.autofocus")

-------------------------------------------------------------------------------
--: Error handling :-----------------------------------------------------------
-------------------------------------------------------------------------------
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title  = "Oops, there were errors during startup!",
        text   = awesome.startup_errors 
    })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end

-------------------------------------------------------------------------------
--: Variable definitions :-----------------------------------------------------
-------------------------------------------------------------------------------
-- Themes define colours, icons, font and wallpapers.
beautiful.init("~/.config/awesome/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
editor = os.getenv("EDITOR") or "vi"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

lain.layout.termfair.nmaster = 2
lain.layout.termfair.ncol = 2

--[[ Table of layouts ]]--
local layouts = {
    awful.layout.suit.floating,
    lain.layout.uselessfair,
    lain.layout.centerwork,
}

--[[ Wallpaper ]]--
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.tiled(beautiful.wallpaper, s)
    end
end

--[[ Tags ]]--
tags = {
    names = {":D", ":O", ":I", ":|", ":(", ":C", ">:C"}
}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tags.names, s, layouts[1])
end

-------------------------------------------------------------------------------
--: Menu creation :------------------------------------------------------------
-------------------------------------------------------------------------------
myawesomemenu = {
   { "manual",      terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart",     awesome.restart },
   { "quit",        awesome.quit }
}

mymainmenu = awful.menu({
    items = {
        { "awesome", myawesomemenu, beautiful.awesome_icon },
        { "open terminal", terminal }
    }
})

mylauncher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = mymainmenu
})

-------------------------------------------------------------------------------
--: Wibox (top bar) creation :-------------------------------------------------
-------------------------------------------------------------------------------
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
markup = lain.util.markup

--[[ Create a textclock widget ]]--
mytextclock = awful.widget.textclock()

--[[ Create each wibox ]]--
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytasklist = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
    awful.button({ }, 1, awful.tag.viewonly),
    awful.button({ modkey }, 1, awful.client.movetotag),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, awful.client.toggletag),
    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
)

--[[ Create all buttons for the task list ]]--
mytasklist.buttons = awful.util.table.join(
    awful.button({ }, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            -- Without this, the following
            -- :isvisible() makes no sense
            c.minimized = false
            if not c:isvisible() then
                awful.tag.viewonly(c:tags()[1])
            end
            -- This will also un-minimize
            -- the client, if needed
            client.focus = c
            c:raise()
        end
    end),
    awful.button({ }, 3, function()
        if instance then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({
                theme = { width = 250 }
            })
        end
    end),
    awful.button({ }, 4, function()
        awful.client.focus.byidx(1)
        if client.focus then
            client.focus:raise()
        end
    end),
    awful.button({ }, 5, function()
        awful.client.focus.byidx(-1)
        if client.focus then
            client.focus:raise()
        end
    end)
)

--[[ Battery widget ]]--
mybattery = lain.widgets.bat({
    battery = "BAT1",
    settings = function()
        text = ""
        if bat_now.status == "Charging" then
            text = text .. "++[%" .. bat_now.perc .. "]"
        elseif bat_now.status == "Discharging" then
            text = text .. "[%" .. bat_now.perc .. "]"
        elseif bat_now.status == "Not present" then
            text = ""
        else
            text = text .. "s:" .. bat_now.status .. " %" .. bat_now.perc
        end

        text = text .. " "

        widget:set_markup(text)
    end
})

--[[ Create the wibox for each screen ]]--
for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
        awful.button({ }, 1, function() awful.layout.inc(layouts, 1) end),
        awful.button({ }, 3, function() awful.layout.inc(layouts, -1) end),
        awful.button({ }, 4, function() awful.layout.inc(layouts, 1) end),
        awful.button({ }, 5, function() awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({
        position = "top",
        screen = s,
        height = 16  -- TODO: I hardcoded this value via trial an error, try to find a way to get proper font size??
    })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    -- left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(mytextclock)
    right_layout:add(mybattery)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end

-------------------------------------------------------------------------------
--: Binds :--------------------------------------------------------------------
-------------------------------------------------------------------------------
--[[ Mouse bindings ]]--
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function() mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

--[[ Key bindings ]]--
globalkeys = awful.util.table.join(
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),
    awful.key({ modkey }, "Return", function() awful.util.spawn(terminal) end),
    awful.key({ modkey }, "y", function() mymainmenu:show() end),
    awful.key({ modkey }, "i", function() mypromptbox[mouse.screen]:run() end),
    awful.key({ modkey }, "p", function() menubar.show() end),
    awful.key({ modkey }, "h", awful.tag.viewprev ),
    awful.key({ modkey }, "l", awful.tag.viewnext ),
    awful.key({ modkey }, "j", function()
        awful.client.focus.byidx(1)
        if client.focus then
            client.focus:raise()
        end
    end),
    awful.key({ modkey,           }, "k", function()
        awful.client.focus.byidx(-1)
        if client.focus then
            client.focus:raise()
        end
    end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function(c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function(c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function(c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n", function(c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
    end),
    awful.key({ modkey,           }, "m", function(c)
        c.maximized_horizontal = not c.maximized_horizontal
        c.maximized_vertical   = not c.maximized_vertical
    end)
)

--[[ Bind all key numbers to tags.
     Be careful: we use keycodes to make it works on any keyboard layout.
     This should map on the top row of your keyboard, usually 1 to 9.
     Key bindings ]]--
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9, function()
            local screen = mouse.screen
            local tag = awful.tag.gettags(screen)[i]
            if tag then
                awful.tag.viewonly(tag)
            end
        end),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9, function()
            local screen = mouse.screen
            local tag = awful.tag.gettags(screen)[i]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
            if client.focus then
                local tag = awful.tag.gettags(client.focus.screen)[i]
                if tag then
                    awful.client.movetotag(tag)
                end
            end
        end),
        -- Toggle tag.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
            if client.focus then
                local tag = awful.tag.gettags(client.focus.screen)[i]
                if tag then
                    awful.client.toggletag(tag)
                end
            end
        end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function(c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize)
)

-- [[ Set keys ]]--
root.keys(globalkeys)

-------------------------------------------------------------------------------
--: Rules :--------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons 
        }
    },
    {
        rule = { class = "MPlayer" },
        properties = {
            floating = true
        }
    },
    {
        rule = { class = "pinentry" },
        properties = {
            floating = true
        }
    },
    {
        rule = { class = "gimp" },
        properties = {
            floating = true
        }
    },
}

-------------------------------------------------------------------------------
--: Signals -------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
            awful.button({ }, 1, function()
                client.focus = c
                c:raise()
                awful.mouse.client.move(c)
            end),
            awful.button({ }, 3, function()
                client.focus = c
                c:raise()
                awful.mouse.client.resize(c)
            end))

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
