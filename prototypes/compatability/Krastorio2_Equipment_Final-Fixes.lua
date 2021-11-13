cargoPlaneGridName = "kr-cargo-plane-grid"

if data.raw["equipment-grid"][cargoPlaneGridName] then
	data.raw["equipment-grid"][cargoPlaneGridName].width = data.raw["equipment-grid"]["Cargo-Plane-Equipment-Grid"].width
	data.raw["equipment-grid"][cargoPlaneGridName].height = data.raw["equipment-grid"]["Cargo-Plane-Equipment-Grid"].height
	data.raw["equipment-grid"][cargoPlaneGridName].equipment_categories = data.raw["equipment-grid"]["Cargo-Plane-Equipment-Grid"].equipment_categories
end