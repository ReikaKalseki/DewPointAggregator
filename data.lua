local pump = table.deepcopy(data.raw["offshore-pump"]["offshore-pump"])
pump.name = "dpa"
pump.icon = "__DewPointAggregator__/graphics/icon.png"
pump.max_health = 200
pump.minable.result = "dpa"
pump.collision_box = {{-2.3, -2.3}, {2.3, 2.3}}
pump.selection_box = {{-2.5, -2.5}, {2.5, 2.5}}
pump.collision_mask = {"water-tile", "object-layer", "player-layer", "item-layer"}
pump.adjacent_tile_collision_test = {"ground-tile"}
local conn = {}
for i = -1,1,2 do
	table.insert(conn, {position = {i, 3}, type = "output"})
	table.insert(conn, {position = {i, -3}, type = "output"})
	table.insert(conn, {position = {3, i}, type = "output"})
	table.insert(conn, {position = {-3, i}, type = "output"})
end
pump.fluid_box.pipe_connections = conn
pump.pumping_speed = 8
pump.flags = {"placeable-neutral", "player-creation"}
pump.placeable_position_visualization = nil
pump.circuit_wire_connection_points = circuit_connector_definitions["storage-tank"].points
pump.circuit_connector_sprites = circuit_connector_definitions["storage-tank"].sprites

for i,d in ipairs({"north", "east", "south", "west"}) do
	pump.picture[d] = 
	{
		filename = "__DewPointAggregator__/graphics/sprite-src.png",
		priority = "extra-high",
		shift = {0.3, 0.8},
		width = 256,
		height = 256,
		x = (i-1)*256
	}
end

data:extend(
{
	pump,
	{
		type = "recipe",
		name = "dpa",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"iron-stick", 36},
			{"iron-gear-wheel", 12},
			{"engine-unit", 8},
			{"pipe", 6},
		},
		result = "dpa"
	},
	{
		type = "item",
		name = "dpa",
		icon = "__DewPointAggregator__/graphics/icon.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "extraction-machine",
		order = "b[fluids]-a[dpa]",
		place_result = "dpa",
		stack_size = 10
	},
	{
		type = "technology",
		name = "dpa",
		icon = "__DewPointAggregator__/graphics/tech.png",
		icon_size = 128,
		prerequisites =
		{
		  "fluid-handling",
		  "engine",
		},
		effects =
		{
		  {
			type = "unlock-recipe",
			recipe = "dpa"
		  },
		},
		unit =
		{
		  count = 40,
		  ingredients =
		  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
		  },
		  time = 30
		},
		upgrade = true,
		order = "a-f",
	}
})
