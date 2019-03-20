if settings.startup["non-combat-mode"].value == false then
	
	--Updates equipment grids to support the various bob's vehicle grids, within reason.
	if data.raw["equipment-category"]["armoured-vehicle"] then 
		table.insert(data.raw["equipment-grid"]["CargoPlane-equipment-grid"].equipment_categories,"vehicle")
		if settings.startup["aircraftCargoPlane-equipment-armoured"].value == true then
			table.insert(data.raw["equipment-grid"]["CargoPlane-equipment-grid"].equipment_categories,"armoured-vehicle")
		end
	end
end