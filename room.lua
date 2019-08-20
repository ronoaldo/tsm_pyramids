local S = minetest.get_translator("tsm_pyramids")

-- ROOM LAYOUTS

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
	["s"] = "sandstone",
	["S"] = "sandstonebrick",
	["1"] = "deco_stone1",
	["2"] = "deco_stone2",
	["3"] = "deco_stone3",
	["^"] = "chest",
	["<"] = "chest",
	[">"] = "chest",
	["v"] = "chest",
	["~"] = "lava_source",
	["t"] = "trap",
}
local code_desert = table.copy(code_sandstone)
code_desert["s"] = "desert_sandstone"
code_desert["1"] = "deco_stone4"
code_desert["2"] = "deco_stone5"
code_desert["3"] = "deco_stone6"
code_desert["S"] = "desert_sandstone_brick"
code_desert["t"] = "desert_trap"

local function replace(str, iy, code_table, deco, column_style)
	local out = "default:"
	if iy < 4 and (str == "<" or str == ">" or str == "^" or str == "v") then str = " " end
	if column_style == 1 or column_style == 2 then
		if iy == 0 and str == "s" then out = "tsm_pyramids:" str = deco[1] end
		if iy == 3 and str == "s" then out = "tsm_pyramids:" str = deco[2] end
	elseif column_style == 3 then
		if iy == 0 and str == "s" then out = "tsm_pyramids:" str = deco[1] end
		if iy == 2 and str == "s" then out = "tsm_pyramids:" str = deco[2] end
	elseif column_style == 4 then
		if iy == 2 and str == "s" then out = "tsm_pyramids:" str = deco[1] end
	end
	if str == " " then out = "" end
	return out..code_table[str]
end

local function replace2(str, iy, code_table)
	local out = "default:"
	if iy == 0 and str == "~" then out = "tsm_pyramids:" str = "t"
	elseif iy < 3 and str == "~" then str = " " end

	if str == " " then out = "" end
	return out..code_table[str]
end

function tsm_pyramids.make_room(pos, stype, room_id)
	local code_table = code_sandstone
	if stype == "desert" then
		code_table = code_desert
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
	local room = room_types[room_id]
	local chests = {}
	local column_style = math.random(0,4)
	if room.style == "yrepeat" then
		for iy=0,4,1 do
			for ix=0,8,1 do
				for iz=0,8,1 do
					local n_str = room.layout[tonumber(ix*9+iz+1)]
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
	local sanded = room.flood_sand ~= false and math.random(1,8) == 1
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
		tsm_pyramids.make_traps(pos, stype)
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

function tsm_pyramids.make_traps(pos, stype)
	local code_table = code_sandstone
	if stype == "desert" then
		code_table = code_desert
	end
	shuffle_traps(math.random(10,100))
	local hole = {x=pos.x+7,y=pos.y, z=pos.z+7}
	for iy=0,4,1 do
		for ix=0,8,1 do
			for iz=0,8,1 do
				local n_str = layout_traps[tonumber(ix*9+iz+1)]
				local p2 = 0
				minetest.set_node({x=hole.x+ix,y=hole.y-iy,z=hole.z+iz}, {name=replace2(n_str, iy, code_table), param2=p2})
			end
		end
	end
end

function tsm_pyramids.flood_sand(pos, stype)
	local set_to_sand = {}
	local nn = "default:sand"
	if stype == "desert" then
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

