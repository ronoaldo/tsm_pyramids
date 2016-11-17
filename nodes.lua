-- Boilerplate to support localized strings if intllib mod is installed.
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end

local desc = {S("Sandstone with eye engraving"), S("Sandstone with man engraving"), S("Sandstone with sun engraving")}
local img = {"eye", "men", "sun"}

for i=1,3 do
	minetest.register_node("tsm_pyramids:deco_stone"..i, {
		description = desc[i],
		tiles = {"default_sandstone.png", "default_sandstone.png", "default_sandstone.png^tsm_pyramids_"..img[i]..".png"},
		is_ground_content = false,
		groups = minetest.registered_nodes["default:sandstone"].groups,
		sounds = default.node_sound_stone_defaults(),
	})
end

local trap_on_timer = function (pos, elapsed)
	local objs = minetest.env:get_objects_inside_radius(pos, 2)
	for i, obj in pairs(objs) do
		if obj:is_player() then
			local n = minetest.get_node(pos)
			if n and n.name then
				if minetest.registered_nodes[n.name]._tsm_pyramids_crack and minetest.registered_nodes[n.name]._tsm_pyramids_crack < 2 then
					minetest.set_node(pos, {name="tsm_pyramids:trap_2"})
					nodeupdate(pos)
				end
			end
		end
	end
	return true
end

minetest.register_node("tsm_pyramids:trap", {
	description = S("Cracked sandstone brick"),
	tiles = {"default_sandstone_brick.png^tsm_pyramids_crack.png"},
	is_ground_content = false,
	groups = {crumbly=3,cracky=3},
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		minetest.env:get_node_timer(pos):start(0.1)
	end,
	_tsm_pyramids_crack = 1,
	on_timer = trap_on_timer,
	drop = "",
})

minetest.register_node("tsm_pyramids:trap_2", {
	description = S("Fallen cracked sandstone brick"),
	tiles = {"default_sandstone_brick.png^tsm_pyramids_crack.png^[transformR90"},
	is_ground_content = false,
	groups = {crumbly=3,cracky=3,falling_node=1,not_in_creative_inventory=1},
	sounds = default.node_sound_stone_defaults(),
	drop = "",
})
