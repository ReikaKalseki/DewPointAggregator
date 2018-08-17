local function onEntityAdded(event)
	local entity = event.created_entity
	if entity.name == "dpa" then
		entity.set_recipe("dpa-action")
		entity.operable = false
	end
end

script.on_event(defines.events.on_built_entity, onEntityAdded)
script.on_event(defines.events.on_robot_built_entity, onEntityAdded)