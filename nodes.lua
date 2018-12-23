-- Boilerplate to support localized strings if intllib mod is installed.
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end

local desc = {S("Sandstone with eye engraving"), S("Sandstone with man engraving"), S("Sandstone with sun engraving")}
local img = {"eye", "men", "sun"}

local decodesc = ""
if minetest.get_modpath("doc_items") then
	decodesc = doc.sub.items.temp.deco
end

for i=1,3 do
	minetest.register_node("tsm_pyramids:deco_stone"..i, {
		description = desc[i],
		_doc_items_longdesc = decodesc,
		tiles = {"default_sandstone.png", "default_sandstone.png", "default_sandstone.png^tsm_pyramids_"..img[i]..".png"},
		is_ground_content = false,
		groups = {unbreakable=1},
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
					minetest.check_for_falling(pos)
				end
			end
		end
	end
	return true
end

minetest.register_node("tsm_pyramids:trap", {
	description = S("Cracked sandstone brick"),
	_doc_items_longdesc = S("This brick is old, porous and unstable and is barely able to hold itself. One should be careful not to disturb it."),
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
	_doc_items_longdesc = S("This old and porous brick fell to the ground. It does not hold itself anymore."),
	tiles = {"default_sandstone_brick.png^tsm_pyramids_crack.png^[transformR90"},
	is_ground_content = false,
	groups = {crumbly=3,cracky=3,falling_node=1,not_in_creative_inventory=1},
	sounds = default.node_sound_stone_defaults(),
	drop = "",
})

local function get_chest_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," .. pos.z
	local formspec =
		"size[8,9]" ..
		default.gui_bg ..
		default.gui_bg_img ..
		default.gui_slots ..
		"list[nodemeta:" .. spos .. ";main;0,0.3;8,4;]" ..
		"list[current_player;main;0,4.85;8,1;]" ..
		"list[current_player;main;0,6.08;8,3;8]" ..
		"listring[nodemeta:" .. spos .. ";main]" ..
		"listring[current_player;main]" ..
		default.get_hotbar_bg(0,4.85)
	return formspec
end

local chestdef = minetest.registered_nodes["default:chest"]
minetest.register_node(
	"tsm_pyramids:chest", {
		description = "tsm_pyramids Chest auto refilled",
		tiles = chestdef.tiles,
		stack_max = 1000,
		paramtype2 = "facedir",
		is_ground_content = false,
		on_construct = function(pos)
			chestdef.on_construct(pos)
			minetest.get_node_timer(pos):start(pyramids.max_time)
			pyramids.fill_chest(pos)
		end,
		on_metadata_inventory_move = chestdef.on_metadata_inventory_move,
		on_metadata_inventory_put = chestdef.on_metadata_inventory_put,
		on_metadata_inventory_take = chestdef.on_metadata_inventory_take,
		groups = {unbreakable = 1, not_in_creative_inventory = 1},
		on_timer = function(pos, elapsed)
			pyramids.fill_chest(pos)
			return true
		end,
		on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			if not default.can_interact_with_node(clicker, pos) then
				return itemstack
			end

			minetest.after(
				0.2,
				minetest.show_formspec,
				clicker:get_player_name(),
				"default:chest", get_chest_formspec(pos))
		end,
})
