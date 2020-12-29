local function AddEquipmentCategories(equipment_category)
	if data.raw["equipment-category"][equipment_category] then
		table.insert(data.raw["equipment-grid"]["Cargo-Plane-Equipment-Grid"].equipment_categories, equipment_category)
		table.insert(data.raw["equipment-grid"]["Better-Cargo-Plane-Equipment-Grid"].equipment_categories, equipment_category)
		table.insert(data.raw["equipment-grid"]["Even-Better-Cargo-Plane-Equipment-Grid"].equipment_categories, equipment_category)

		if data.raw["equipment-grid"]["kr-cargo-plane-grid"] then
			table.insert(data.raw["equipment-grid"]["kr-cargo-plane-grid"].equipment_categories, equipment_category)
		end
	end
end

AddEquipmentCategories("vehicle-motor");
AddEquipmentCategories("vehicle-robot-interaction-equipment");
AddEquipmentCategories("robot-interaction-equipment");
AddEquipmentCategories("universal-equipment");