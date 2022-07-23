local modname = "cattail_flour"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")
local S = minetest.get_translator(minetest.get_current_modname())


--[[
	cattail_flour:cattail_root
	cattail_flour:cattail_flour
	cattail_flour:cattail_bread
--]]

minetest.override_item("dryplants:reedmace_height_3_spikes", {
	description = S("Cattail Plant"),
	drop = {
		items = {
			{items = {"cattail_flour:cattail_root"}, rarity = 2},
			{items = {"dryplants:reedmace_sapling"}, rarity = 2},
		},
	},
})

minetest.register_craftitem("cattail_flour:cattail_root", {
	description = S("Cattail Root"),
	inventory_image = "dryplants_root.png",
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "shapeless",
	output = "cattail_flour:cattail_flour",
	recipe = {
		"cattail_flour:cattail_root",
		"cattail_flour:cattail_root",
		"cattail_flour:cattail_root",
		"cattail_flour:cattail_root",
		"farming:mortar_pestle",
	},
	replacements = {{"farming:mortar_pestle", "farming:mortar_pestle"}},
})

minetest.register_craftitem("cattail_flour:cattail_flour", {
	description = S("Cattail Flour"),
	inventory_image = "farming_flour.png^[colorize:#876d2a:175",
	groups = {flammable = 2, food_flour = 1},
})

minetest.register_craft({
	type = "cooking",
	output = "cattail_flour:cattail_bread",
	recipe = "cattail_flour:cattail_flour",
	cooktime = 10,
})

minetest.register_craftitem("cattail_flour:cattail_bread", {
	description = S("Cattail Bread"),
	inventory_image = "farming_bread.png^[colorize:#876d2a:150",
	groups = {flammable = 2},
	on_use = minetest.item_eat(10),
})