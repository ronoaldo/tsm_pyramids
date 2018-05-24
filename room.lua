local room = {"a","a","a","a","a","a","a","a","a",
	"a","c","a","c","a","c","a","c","a",
	"a","s","a","s","a","s","a","s","a",
	"a","a","a","a","a","a","a","a","a",
	"a","a","a","a","a","a","a","a","a",
	"a","a","a","a","a","a","a","a","a",
	"a","s","a","s","a","s","a","s","a",
	"a","c","a","c","a","c","a","c","a",
	"a","a","a","a","a","a","a","a","a"}

local trap = {"b","b","b","b","b","b","b","b","b",
	"l","b","l","b","l","b","l","b","b",
	"l","b","l","b","l","b","l","b","b",
	"l","b","l","l","l","b","l","l","b",
	"l","l","b","l","b","l","l","b","b",
	"l","b","l","l","l","l","l","l","b",
	"l","b","l","b","l","b","l","b","b",
	"l","b","l","b","l","b","l","b","b",
	"b","b","b","b","b","b","b","b","b"}

local code_sandstone = {
	["s"] = "sandstone",
	["1"] = "deco_stone1",
	["2"] = "deco_stone2",
	["3"] = "deco_stone3",
	["c"] = "chest",
	["b"] = "sandstonebrick",
	["a"] = "air",
	["l"] = "lava_source",
	["t"] = "trap",
}
local code_desert = table.copy(code_sandstone)
code_desert["s"] = "desert_sandstone"
code_desert["1"] = "deco_stone4"
code_desert["2"] = "deco_stone5"
code_desert["3"] = "deco_stone6"
code_desert["b"] = "desert_sandstone_brick"

local function replace(str, iy, code_table)
	local out = "default:"
	if iy < 4 and str == "c" then str = "a" end
	if iy == 0 and str == "s" then out = "tsm_pyramids:" str = "3" end
	if iy == 3 and str == "s" then out = "tsm_pyramids:" str = "2" end
	if str == "a" then out = "" end
	return out..code_table[str]
end

local function replace2(str, iy, code_table)
	local out = "default:"
	if iy == 0 and str == "l" then out = "tsm_pyramids:" str = "t"
	elseif iy < 3 and str == "l" then str = "a" end

	if str == "a" then out = "" end
	return out..code_table[str]
end

function pyramids.make_room(pos, stype)
	local code_table = code_sandstone
	if stype == "desert" then
		code_table = code_desert
	end
	local hole = {x=pos.x+7,y=pos.y+5, z=pos.z+7}
	for iy=0,4,1 do
		for ix=0,8,1 do
			for iz=0,8,1 do
				local n_str = room[tonumber(ix*9+iz+1)]
				local p2 = 0
				if n_str == "c" then
					if ix < 3 then p2 = 1 else p2 = 3 end
					pyramids.fill_chest({x=hole.x+ix,y=hole.y-iy,z=hole.z+iz})
				end
				minetest.set_node({x=hole.x+ix,y=hole.y-iy,z=hole.z+iz}, {name=replace(n_str, iy, code_table), param2=p2})
			end
		end
	end
end

function pyramids.make_traps(pos, stype)
	local code_table = code_sandstone
	if stype == "desert" then
		code_table = code_desert
	end
	local hole = {x=pos.x+7,y=pos.y, z=pos.z+7}
	for iy=0,4,1 do
		for ix=0,8,1 do
			for iz=0,8,1 do
				local n_str = trap[tonumber(ix*9+iz+1)]
				local p2 = 0
				minetest.set_node({x=hole.x+ix,y=hole.y-iy,z=hole.z+iz}, {name=replace2(n_str, iy, code_table), param2=p2})
			end
		end
	end
end
