if settings.startup["non-combat-mode"].value == false then
	
	--Updates equipment grids to support the various bob's vehicle grids, within reason.
	if data.raw["equipment-category"]["armoured-vehicle"] then 
		table.insert(data.raw["equipment-grid"]["Cargo-Plane-Equipment-Grid"].equipment_categories,"vehicle")
		table.insert(data.raw["equipment-grid"]["Better-Cargo-Plane-Equipment-Grid"].equipment_categories,"vehicle")
		table.insert(data.raw["equipment-grid"]["Even-Better-Cargo-Plane-Equipment-Grid"].equipment_categories,"vehicle")

		if settings.startup["aircraftCargoPlane-equipment-armoured"].value == true then
			table.insert(data.raw["equipment-grid"]["Cargo-Plane-Equipment-Grid"].equipment_categories,"armoured-vehicle")
			table.insert(data.raw["equipment-grid"]["Better-Cargo-Plane-Equipment-Grid"].equipment_categories,"armoured-vehicle")
			table.insert(data.raw["equipment-grid"]["Even-Better-Cargo-Plane-Equipment-Grid"].equipment_categories,"armoured-vehicle")
		end
	end
end