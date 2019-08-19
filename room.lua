local layout_room = {
	" "," "," "," "," "," "," "," "," ",
	" ","c"," ","c"," ","c"," ","c"," ",
	" ","s"," ","s"," ","s"," ","s"," ",
	" "," "," "," "," "," "," "," "," ",
	" "," "," "," "," "," "," "," "," ", -- << entrance on left side
	" "," "," "," "," "," "," "," "," ",
	" ","s"," ","s"," ","s"," ","s"," ",
	" ","c"," ","c"," ","c"," ","c"," ",
	" "," "," "," "," "," "," "," "," "
}

local layout_traps = {
	"S","S","S","S","S","S","S","S","S",
	"~","S","~","S","~","S","~","S","S",
	"~","S","~","S","~","S","~","S","S",
	"~","S","~","~","~","S","~","~","S",
	"~","~","S","~","S","~","~","S","S", -- << entrance on left side
	"~","S","~","~","~","~","~","~","S",
	"~","S","~","S","~","S","~","S","S",
	"~","S","~","S","~","S","~","S","S",
	"S","S","S","S","S","S","S","S","S"
}

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
	["c"] = "chest",
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

local function replace(str, iy, code_table, deco)
	local out = "default:"
	if iy < 4 and str == "c" then str = " " end
	if iy == 0 and str == "s" then out = "tsm_pyramids:" str = deco[1] end
	if iy == 3 and str == "s" then out = "tsm_pyramids:" str = deco[2] end
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

function tsm_pyramids.make_room(pos, stype)
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
	for iy=0,4,1 do
		for ix=0,8,1 do
			for iz=0,8,1 do
				local n_str = layout_room[tonumber(ix*9+iz+1)]
				local p2 = 0
				if n_str == "c" then
					if ix < 3 then p2 = 1 else p2 = 3 end
					tsm_pyramids.fill_chest({x=hole.x+ix,y=hole.y-iy,z=hole.z+iz})
				end
				minetest.set_node({x=hole.x+ix,y=hole.y-iy,z=hole.z+iz}, {name=replace(n_str, iy, code_table, deco), param2=p2})
			end
		end
	end
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
