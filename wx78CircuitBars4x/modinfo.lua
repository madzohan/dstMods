name ="wx78CircuitBars4x"
description = "Boost the Charge Meter up to 24 active bars, each of which can be occupied by a Circuit"
author = "勿言, madzohan, Chasni"
version = "0.1.0"

forumthread = ""

api_version = 10

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
all_clients_require_mod = true

server_filter_tags = {
    "madzohan",
    "Chasni",
    "wx78",
    "circuit",
    "slot",
    "status_wx",
    "charge"
}

icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = {}

configuration_options = {
    {
        name = "_SEPARATE_BACKPACK_MODE",
        label = "Backpack setting",
        hover = "Default: Integrated",
        options = {
            { description = "Integrated", data = false },
            { description = "Separate (Default)", data = true },
        },
        default = true
    },
    {
        name = "_WX78_CHARGE_REGENTIME",
        label = "WX78 Recharge Time",
        hover = "Default: Normal",
        options = {
            { description = "Fastest", data = 3 },
            { description = "Faster", data = 3*10 },
            { description = "Fast", data = 3*20 },
            { description = "Normal (Default)", data = 3*30 },
            { description = "Slow", data = 3*40 },
            { description = "Slower", data = 3*50 },
            { description = "Slowest", data = 3*60 },
        },
        default = 3*30
    },
    {
        name = "_WX78_BASE_HEALTH",
        label = "WX78 Base Health",
        hover = "Default: Normal",
        options = {
            { description = "Most", data = 200 },
            { description = "More", data = 150 },
            { description = "Normal (Default)", data = 125 },
            { description = "Low", data = 100 },
            { description = "Lower", data = 75 },
            { description = "Lowest", data = 50 },
        },
        default = 125
    },
    {
        name = "_WX78_BASE_HUNGER",
        label = "WX78 Base Hunger",
        hover = "Default: Normal",
        options = {
            { description = "Most", data = 200 },
            { description = "More", data = 150 },
            { description = "Normal (Default)", data = 125 },
            { description = "Low", data = 100 },
            { description = "Lower", data = 75 },
            { description = "Lowest", data = 50 },
        },
        default = 125
    },
    {
        name = "_WX78_BASE_SANITY",
        label = "WX78 Base Sanity",
        hover = "Default: Normal",
        options = {
            { description = "Most", data = 200 },
            { description = "More", data = 175 },
            { description = "Normal (Default)", data = 150 },
            { description = "Low", data = 125 },
            { description = "Lower", data = 100 },
            { description = "Lowest", data = 75 },
        },
        default = 150
    },
}