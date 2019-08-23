local S = minetest.get_translator("tsm_pyramids")

-- ROOM LAYOUTS

local ROOM_WIDTH = 9

local room_types = {
	-- Pillar room
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" ","^"," ","^"," ","^"," ","^"," ",
			" ","s"," ","s"," ","s"," ","s"," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" ","s"," ","s"," ","s"," ","s"," ",
			" ","v"," ","v"," ","v"," ","v"," ",
			" "," "," "," "," "," "," "," "," "
		},
		traps = true,
	},
	-- Hieroglyph walls
	{
		style = "yrepeat",
		layout = {
			"s","s","s","s","s","s","s","s","s",
			"s"," "," "," "," "," "," "," ","s",
			"s"," "," "," "," "," "," "," ","s",
			"s"," "," "," "," "," "," "," ","s",
			" "," "," "," ","<"," "," "," ","s",
			"s"," "," "," "," "," "," "," ","s",
			"s"," "," "," "," "," "," "," ","s",
			"s"," "," "," "," "," "," "," ","s",
			"s","s","s","s","s","s","s","s","s"
		},
	},
	-- 4 large pillars
	{
		style = "yrepeat",
		layout = {
			" "," "," "," ","v"," "," "," "," ",
			" ","s","s"," "," "," ","s","s"," ",
			" ","s","s"," "," "," ","s","s"," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," ","<",
			" "," "," "," "," "," "," "," "," ",
			" ","s","s"," "," "," ","s","s"," ",
			" ","s","s"," "," "," ","s","s"," ",
			" "," "," "," ","^"," "," "," "," "
		},
	},
	-- hidden room
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," ","s","S","s","S","s"," "," ",
			" "," ","S"," "," "," ","S"," "," ",
			" "," ","s"," ",">"," ","s"," ","<",
			" "," ","S"," "," "," ","S"," "," ",
			" "," ","s","S","s","S","s"," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," "
		},
	},
	-- spiral 1
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" ","S","S","S","S","S","S","S"," ",
			" ","S"," "," "," "," "," ","S"," ",
			" ","S"," ","s","s","s"," ","S"," ",
			" ","S"," ","s","v","s"," ","S"," ",
			"S","S"," ","s"," ","s"," ","S"," ",
			"S","S"," ","s"," "," "," ","S"," ",
			"v","S"," ","S","S","S","S","S"," ",
			" ","S"," "," "," "," "," "," "," "
		},
	},
	-- spiral 2
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" ","S","S","S","S","S","S","S"," ",
			" "," "," ","s"," "," "," ","S"," ",
			"S","S"," ","s"," ","s"," ","S"," ",
			" ","S"," ","s","^","s"," ","S"," ",
			" ","S"," ","s","s","s"," ","S"," ",
			" ","S"," "," "," "," "," ","S"," ",
			" ","S","S","S","S","S","S","S"," ",
			" "," "," "," "," "," "," "," "," "
		},
	},
	-- pillar mania
	{
		style = "yrepeat",
		layout = {
			" "," ","v"," ","v"," ","v"," ","v",
			" ","s"," ","s"," ","s"," ","s"," ",
			" "," "," "," "," "," "," "," "," ",
			" ","s"," ","s"," ","s"," ","s"," ",
			" "," "," "," "," "," "," "," "," ",
			" ","s"," ","s"," ","s"," ","s"," ",
			" "," "," "," "," "," "," "," "," ",
			" ","s"," ","s"," ","s"," ","s"," ",
			" "," ","^"," ","^"," ","^"," ","^",
		},
		--traps = true,
	},
	-- plusses
	{
		style = "yrepeat",
		layout = {
			"s"," "," "," "," "," "," "," ","s",
			" "," ","s",">"," ","<","s"," "," ",
			" ","s","s","s"," ","s","s","s"," ",
			" "," ","s"," "," "," ","s"," "," ",
			" "," "," "," ","<"," "," "," "," ",
			" "," ","s"," "," "," ","s"," "," ",
			" ","s","s","s"," ","s","s","s"," ",
			" "," ","s",">"," ","<","s"," "," ",
			"s"," "," "," "," "," "," "," ","s",
		},
		--traps = true,
	},
	-- diamond
	{
		style = "yrepeat",
		layout = {
			">","s","s","s","s","s","s","s","s",
			"s","s","s"," "," "," ","s","s","s",
			"s","s"," "," "," "," "," ","s","s",
			"s"," "," "," "," "," "," "," ","s",
			" "," "," "," "," "," "," ","<","s",
			"s"," "," "," "," "," "," "," ","s",
			"s","s"," "," "," "," "," ","s","s",
			"s","s","s"," "," "," ","s","s","s",
			">","s","s","s","s","s","s","s","s",
		},
		--traps = true,
	},
	-- square
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" ","S","S","S","^","S","S","S"," ",
			" ","S","S","S","S","S","S","S"," ",
			" ","S","S","S","S","S","S","S"," ",
			" ","S","S","S","S","S","S",">"," ",
			" ","S","S","S","S","S","S","S"," ",
			" ","S","S","S","S","S","S","S"," ",
			" ","S","S","S","v","S","S","S"," ",
			" "," "," "," "," "," "," "," "," ",
		},
	},
	-- hallway 2
	{
		style = "yrepeat",
		layout = {
			"S","S","S","S",">"," "," "," "," ",
			"S","S","S","S","S","^","S","S"," ",
			"S","S","S","S","S","S","S","S"," ",
			"S","S","S","S","S","S","S","S"," ",
			" "," "," "," "," "," "," "," "," ",
			"S","S","S","S","S","S","S","S"," ",
			"S","S","S","S","S","S","S","S"," ",
			"S","S","S","S","S","v","S","S"," ",
			"S","S","S","S",">"," "," "," "," ",
		},
	},
	-- hallway 3
	{
		style = "yrepeat",
		layout = {
			"S","S","S","S","S"," "," "," "," ",
			"S","S","S","S","s",">"," "," "," ",
			"S","s","S","s","S","s","S"," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			"S","s","S","s","S","s","S"," "," ",
			"S","S","S","S","s",">"," "," "," ",
			"S","S","S","S","S"," "," "," "," ",
		},
	},
	-- hallway 4
	{
		style = "yrepeat",
		layout = {
			"S","S","S","S","S","v","S","S","S",
			"S","S","S","S","S","S","S","S","S",
			"s","S","s","S","s","S","s","S","s",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," ","<",
			" "," "," "," "," "," "," "," "," ",
			"s","S","s","S","s","S","s","S","s",
			"S","S","S","S","S","S","S","S","S",
			"S","S","S","S","S","^","S","S","S",
		},
	},
	-- tiny
	{
		style = "yrepeat",
		layout = {
			"S","S","S","S","S","S","S","S","v",
			"S","S","S","S","S","S","S","S"," ",
			"S","S","S","S","S","S","S","S"," ",
			"S","S","S"," "," "," ","S","S"," ",
			" "," "," "," ","<"," ","S","S"," ",
			"S","S","S"," "," "," ","S","S"," ",
			"S","S","S","S","S","S","S","S"," ",
			"S","S","S","S","S","S","S","S"," ",
			"S","S","S","S","S","S","S","S","^",
		},
	},
	-- small
	{
		style = "yrepeat",
		layout = {
			"S","S","S","S","S","S","S","S","S",
			"S","S","S","S","S","S","S","S","S",
			"S","S"," ","v"," ","v"," ","S","S",
			"S","S",">"," "," "," ","<","S"," ",
			" "," "," "," ","s"," "," ","S"," ",
			"S","S",">"," "," "," ","<","S"," ",
			"S","S"," ","^"," ","^"," ","S","S",
			"S","S","S","S","S","S","S","S","S",
			"S","S","S","S","S","S","S","S","S",
		},
	},
	-- small 2
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" ","S","S","S","S","S","S","S"," ",
			" ","S"," "," ","v"," "," ","S"," ",
			"S","S"," "," "," "," "," ","S"," ",
			" "," "," "," "," "," ","<","S"," ",
			"S","S"," "," "," "," "," ","S"," ",
			" ","S"," "," ","^"," "," ","S"," ",
			" ","S","S","S","S","S","S","S"," ",
			" "," "," "," "," "," "," "," "," ",
		},
	},
	-- big pillar
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," ","^"," "," "," "," ",
			" "," "," ","s","s","s"," "," "," ",
			" "," ","<","s","S","s",">"," "," ",
			" "," "," ","s","s","s"," "," "," ",
			" "," "," "," ","v"," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
		},
		--traps = true,
	},
	-- pacman
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," ","s","s","s"," "," "," ",
			" "," ","s","s","v","s","s"," "," ",
			" "," ","s",">"," "," "," "," "," ",
			" "," ","s","s","^","s","s"," "," ",
			" "," "," ","s","s","s"," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
		},
	},
	-- the wall
	{
		style = "yrepeat",
		layout = {
			"S","S","S","S","S","S","S"," ","<",
			"s","s","s","s","s","S","S"," ","s",
			"s"," "," "," "," ","s","S"," ","<",
			"s"," "," "," "," ","s","S"," ","s",
			" "," "," "," ","<","s","S"," ","<",
			"s"," "," "," "," ","s","S"," ","s",
			"s"," "," "," "," ","s","S"," ","<",
			"s","s","s","s","s","s","S"," ","s",
			"S","S","S","S","S","S","S"," ","<",
		},
	},
	-- split
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," ","^"," ","^"," "," "," ",
			" "," "," ","s"," ","s"," "," "," ",
			" "," "," ","v"," ","v"," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
		},
	},
	-- 4 small pillars
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," ","^"," "," "," "," ",
			" "," "," "," ","s"," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" ","<","s"," "," "," ","s",">"," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," ","s"," "," "," "," ",
			" "," "," "," ","v"," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
		},
	},
	-- 6 pillars
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" "," ","^"," ","^"," ","^"," "," ",
			" "," ","s"," ","s"," ","s"," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," ","s"," ","s"," ","s"," "," ",
			" "," ","v"," ","v"," ","v"," "," ",
			" "," "," "," "," "," "," "," "," ",
		},
		traps = true,
	},
	-- stripes
	{
		style = "yrepeat",
		layout = {
			" ","S","v","S","v","S","v","S","v",
			" ","S"," ","S"," ","S"," ","S"," ",
			" ","s"," ","s"," ","s"," ","s"," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" ","s"," ","s"," ","s"," ","s"," ",
			" ","S"," ","S"," ","S"," ","S"," ",
			" ","S","^","S","^","S","^","S","^",
		},
	},
	-- inside
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" ","s"," "," "," "," "," ","s"," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," ","s","S","s"," "," "," ",
			" "," "," ","S",">"," "," "," "," ",
			" "," "," ","s","S","s"," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" ","s"," "," "," "," "," ","s"," ",
			" "," "," "," "," "," "," "," "," ",
		},
	},
	-- 1 chest
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," ","<"," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
		},
	},
	-- 2 chests
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," ","<",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," ","<",
			" "," "," "," "," "," "," "," "," ",
		},
		traps = true,
	},
	-- X
	{
		style = "yrepeat",
		layout = {
			"s"," "," "," "," "," "," "," ","s",
			"s","s",">"," "," "," ","<","s","s",
			" ","s","s"," "," "," ","s","s"," ",
			" "," ","s","s"," ","s","s"," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," ","s","s"," ","s","s"," "," ",
			" ","s","s"," "," "," ","s","s"," ",
			"s","s",">"," "," "," ","<","s","s",
			"s"," "," "," "," "," "," "," ","s",
		},
	},
	-- split 2
	{
		style = "yrepeat",
		layout = {
			"S","S","S","S","S","S","S","S","S",
			"S","S","S"," "," "," "," "," "," ",
			"S","S","S"," "," "," "," "," "," ",
			"S","S","S"," "," ","^","^","^","^",
			" "," "," "," "," ","s","s","s","s",
			"S","S","S"," "," ","v","v","v","v",
			"S","S","S"," "," "," "," "," "," ",
			"S","S","S"," "," "," "," "," "," ",
			"S","S","S","S","S","S","S","S","S",
		},
	},
	-- split 3
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" ","^"," ","^"," ","^"," ","^"," ",
			" ","s"," ","s"," ","s"," ","s"," ",
			" ","v"," ","v"," ","v"," ","v"," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," "," ",
		},
	},
	-- diamond 2
	{
		style = "yrepeat",
		layout = {
			"S","S"," "," "," "," "," ","S","S",
			"S"," "," "," ","s"," "," "," ","S",
			" "," ","<","S","S","S",">"," "," ",
			" "," ","S","S","S","S","S"," "," ",
			" ","s","S","S","S","S","S","s"," ",
			" "," ","S","S","S","S","S"," "," ",
			" "," ","<","S","S","S",">"," "," ",
			"S"," "," "," ","s"," "," "," ","S",
			"S","S"," "," "," "," "," ","S","S",
		},
	},
	-- ultra pillars
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" ","s","^","s"," ","s","^","s"," ",
			" ","s","s","s"," ","s","s","s"," ",
			" ","s","s","s"," ","s","s","s"," ",
			" "," "," "," "," "," "," "," "," ",
			" ","s","s","s"," ","s","s","s"," ",
			" ","s","s","s"," ","s","s","s"," ",
			" ","s","v","s"," ","s","v","s"," ",
			" "," "," "," "," "," "," "," "," ",
		},
	},
	-- vstripes
	{
		style = "yrepeat",
		layout = {
			"S"," "," "," "," "," "," "," "," ",
			"S"," "," ","^"," "," ","^"," "," ",
			"S"," "," ","s"," "," ","s"," "," ",
			"S"," "," "," "," "," "," "," "," ",
			" "," "," ","s"," "," ","s"," "," ",
			"S"," "," "," "," "," "," "," "," ",
			"S"," "," ","s"," "," ","s"," "," ",
			"S"," "," ","v"," "," ","v"," "," ",
			"S"," "," "," "," "," "," "," "," ",
		},
	},
	-- sides
	{
		style = "yrepeat",
		layout = {
			"s"," ","s"," ","s"," ","s"," ","s",
			" "," ","v"," ","v"," ","v"," "," ",
			"s"," "," "," "," "," "," "," ","s",
			" "," "," "," "," "," "," "," "," ",
			" "," "," "," "," "," "," "," ","s",
			" "," "," "," "," "," "," "," "," ",
			"s"," "," "," "," "," "," "," ","s",
			" "," ","^"," ","^"," ","^"," "," ",
			"s"," ","s"," ","s"," ","s"," ","s",
		},
		traps = true,
	},
	-- 9 pillars
	{
		style = "yrepeat",
		layout = {
			" "," "," "," "," "," "," "," "," ",
			" "," ","^"," ","^"," ","^"," "," ",
			" "," ","s"," ","s"," ","s"," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," ","s"," ","s"," ","s"," "," ",
			" "," "," "," "," "," "," "," "," ",
			" "," ","s"," ","s"," ","s"," "," ",
			" "," ","v"," ","v"," ","v"," "," ",
			" "," "," "," "," "," "," "," "," ",
		},
		--traps = true,
	},



}

local layout_traps
local layout_traps_template = {
	"S","S","S","S","S","S","S","S","S",
	"?","S","?","S","?","S","?","S","S",
	"?","S","?","S","?","S","?","S","S",
	"?","?","?","?","?","?","?","?","S",
	"?","?","?","?","?","?","?","?","S", -- << entrance on left side
	"?","?","?","?","?","?","?","?","S",
	"?","S","?","S","?","S","?","S","S",
	"?","S","?","S","?","S","?","S","S",
	"S","S","S","S","S","S","S","S","S"
}

local code_sandstone = {
	[" "] = "air",
	["s"] = "default:sandstone",
	["S"] = "default:sandstonebrick",
	["1"] = "tsm_pyramids:deco_stone1",
	["2"] = "tsm_pyramids:deco_stone2",
	["3"] = "tsm_pyramids:deco_stone3",
	["^"] = "default:chest",
	["<"] = "default:chest",
	[">"] = "default:chest",
	["v"] = "default:chest",
	["~"] = "default:lava_source",
	["t"] = "tsm_pyramids:trap",
}
local code_desert_sandstone = table.copy(code_sandstone)
code_desert_sandstone["s"] = "default:desert_sandstone"
code_desert_sandstone["1"] = "tsm_pyramids:deco_stone4"
code_desert_sandstone["2"] = "tsm_pyramids:deco_stone5"
code_desert_sandstone["3"] = "tsm_pyramids:deco_stone6"
code_desert_sandstone["S"] = "default:desert_sandstone_brick"
code_desert_sandstone["t"] = "tsm_pyramids:desert_trap"

local code_desert_stone = table.copy(code_sandstone)
code_desert_stone["s"] = "default:desert_stone_block"
code_desert_stone["1"] = "default:desert_stone_block"
code_desert_stone["2"] = "default:desert_stone_block"
code_desert_stone["3"] = "default:desert_stone_block"
code_desert_stone["S"] = "default:desert_stonebrick"
code_desert_stone["t"] = "air"

local function replace(str, iy, code_table, deco, column_style)
	if iy < 4 and (str == "<" or str == ">" or str == "^" or str == "v") then str = " " end
	if column_style == 1 or column_style == 2 then
		if iy == 0 and str == "s" then str = deco[1] end
		if iy == 3 and str == "s" then str = deco[2] end
	elseif column_style == 3 then
		if iy == 0 and str == "s" then str = deco[1] end
		if iy == 2 and str == "s" then str = deco[2] end
	elseif column_style == 4 then
		if iy == 2 and str == "s" then str = deco[1] end
	end
	return code_table[str]
end

local function replace2(str, iy, depth, code_table)
	if iy == depth then
		-- Sandstone at the bottom-most layer
		str = "s"
	elseif iy == depth-1 then
		-- Brick at the layer above
		str = "S"
	elseif iy == 0 and str == "~" then
		-- Trap stones at the top layer
		str = "t"
	elseif iy < depth-3 and str == "~" then
		-- Air below the trap stones
		str = " "
	end
	-- Everything else is untouched (will stay pyramid material)

	return code_table[str]
end

local function get_flat_index(x, y, width)
	return 1 + x + y * width
end

local function rotate_layout_single(layout, width)
	local size = width*width
	local new_layout = {}
	for x=0, width-1 do
		for y=0, width-1 do
			local symbol = layout[get_flat_index((width-1) - y, x, width)]
			-- Rotate chest
			if symbol == "^" then
				symbol = "<"
			elseif symbol == "<" then
				symbol = "v"
			elseif symbol == "v" then
				symbol = ">"
			elseif symbol == ">" then
				symbol = "^"
			end
			new_layout[get_flat_index(x, y, width)] = symbol
		end
	end
	return new_layout
end

local function rotate_layout(layout, width, rotations)
	local new_layout = table.copy(layout)
	for r=1, rotations do
		new_layout = rotate_layout_single(new_layout, width)
	end
	return new_layout
end

-- pos: Position to spawn pyramid
-- stype: Sand type ("sandstone" or "desert")
-- room_id: Room layout identified (see list of rooms above)
-- rotations: Number of times to rotate the room (0-3)
function tsm_pyramids.make_room(pos, stype, room_id, rotations)
	local code_table = code_sandstone
	if stype == "desert_sandstone" then
		code_table = code_desert_sandstone
	elseif stype == "desert_stone" then
		code_table = code_desert_stone
	end
	-- Select random deco block
	local deco_ids = {"1", "2", "3"}
	local deco = {}
	for i=1, 2 do
		local r = math.random(1, #deco_ids)
		table.insert(deco, deco_ids[r])
		table.remove(deco_ids, r)
	end
	local hole = {x=pos.x+7,y=pos.y+5, z=pos.z+7}
	if room_id == nil then
		room_id = math.random(1, #room_types)
	end
	local room
	if room_id < 1 or room_id > #room_types then
		return false, S("Incorrect room type ID: @1", room_id)
	end
	local room = table.copy(room_types[room_id])
	local chests = {}
	local column_style
	local layout = rotate_layout(room.layout, ROOM_WIDTH, rotations)
	if stype == "desert_stone" then
		column_style = 0
	else
		column_style = math.random(0,4)
	end
	if room.style == "yrepeat" then
		for iy=0,4,1 do
			for ix=0,8,1 do
				for iz=0,8,1 do
					local n_str = layout[tonumber(ix*9+iz+1)]
					local p2 = 0
					if n_str == "<" then
						p2 = 0
					elseif n_str == ">" then
						p2 = 2
					elseif n_str == "^" then
						p2 = 1
					elseif n_str == "v" then
						p2 = 3
					end
					local cpos = {x=hole.x+ix,y=hole.y-iy,z=hole.z+iz}
					local nn = replace(n_str, iy, code_table, deco, column_style)
					minetest.set_node(cpos, {name=nn, param2=p2})
					if nn == "default:chest" then
						table.insert(chests, cpos)
					end
				end
			end
		end
	else
		minetest.log("error", "Invalid pyramid room style! room type ID="..r)
	end
	local sanded = room.flood_sand ~= false and stype ~= "desert_stone" and math.random(1,8) == 1
	if #chests > 0 then
		-- Make at least 8 attempts to fill chests
		local filled = 0
		while filled < 8 do
			for c=1, #chests do
				tsm_pyramids.fill_chest(chests[c], stype, sanded)
				filled = filled + 1
			end
		end
	end
	if room.traps then
		tsm_pyramids.make_traps(pos, stype, rotations)
	end
	if sanded then
		tsm_pyramids.flood_sand(pos, stype)
	end
	return true, nil, sanded
end

local shuffle_traps = function(chance)
	layout_traps = table.copy(layout_traps_template)
	for a=1, #layout_traps do
		if layout_traps[a] == "?" then
			if math.random(1,100) <= chance then
				layout_traps[a] = "~"
			else
				layout_traps[a] = "S"
			end
		end
	end
end

function tsm_pyramids.make_traps(pos, stype, rotations)
	local code_table = code_sandstone
	if stype == "desert_sandstone" then
		code_table = code_desert_sandstone
	elseif stype == "desert_stone" then
		code_table = code_desert_stone
	end
	shuffle_traps(math.random(10,100))
	local hole = {x=pos.x+7,y=pos.y, z=pos.z+7}
	local layout = rotate_layout(layout_traps, ROOM_WIDTH, rotations)
	-- Depth is total depth of trap area:
	-- * top layer with trap stones
	-- * followed by air layers
	-- * followed by 2 layer of lava
	-- * and 2 layers of sandstone/brick at the bottom (to prevent lava escaping)
	-- The depth of air between trap stones and lava layer is <depth> - 4
	local depth = 7
	local wmin, wmax = -1,9
	for iy=0,depth,1 do
		for ix=wmin,wmax,1 do
			for iz=wmin,wmax,1 do
				local n_str
				if ix == wmin or ix == wmax or iz == wmin or iz == wmax then
					-- Walls around room
					if iy == depth then
						n_str = code_table["s"]
					else
						n_str = code_table["S"]
					end
					minetest.set_node({x=hole.x+ix,y=hole.y-iy,z=hole.z+iz}, {name=n_str})
				else
					-- Walls below room
					n_str = layout[tonumber(ix*9+iz+1)]
					minetest.set_node({x=hole.x+ix,y=hole.y-iy,z=hole.z+iz}, {name=replace2(n_str, iy, depth, code_table)})
				end
			end
		end
	end
end

function tsm_pyramids.flood_sand(pos, stype)
	local set_to_sand = {}
	local nn = "default:sand"
	if stype == "desert_sandstone" or stype == "desert_stone" then
		nn = "default:desert_sand"
	end
	local hole = {x=pos.x+7,y=pos.y+1, z=pos.z+7}
	local maxh = math.random(1,4)
	local chance = math.random(1,7)
	for ix=0,8,1 do
		for iz=0,8,1 do
			if math.random(1,chance) == 1 then
				local h = math.random(1,maxh)
				for iy=0,h,1 do
					local p = {x=hole.x+ix,y=hole.y+iy,z=hole.z+iz}
					if minetest.get_node(p).name == "air" then
						table.insert(set_to_sand, p)
					end
				end
			end
		end
	end
	minetest.bulk_set_node(set_to_sand, {name=nn})
end

