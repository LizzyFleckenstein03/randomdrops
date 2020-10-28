local max_drop_count = 64 * 5

minetest.register_on_mods_loaded(function()
	local item_list = {}
	for itemname, itemdef in pairs(minetest.registered_items) do
		if minetest.get_item_group(itemname, "not_in_creative_inventory") <= 0 then
			table.insert(item_list, itemname)
		end
	end
	for nodename, nodedef in pairs(minetest.registered_nodes) do
		if nodedef.diggable then
			minetest.override_item(nodename, {
				drop = item_list[math.random(#item_list)] .. " " .. math.random(max_drop_count)
			})
		end
	end
end) 
