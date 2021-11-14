cargoPlaneGridName = "kr-cargo-plane-grid"

if data.raw["equipment-grid"][cargoPlaneGridName] then
	data.raw["equipment-grid"][cargoPlaneGridName].width = data.raw["equipment-grid"]["cargo-plane-equipment-grid"].width
	data.raw["equipment-grid"][cargoPlaneGridName].height = data.raw["equipment-grid"]["cargo-plane-equipment-grid"].height
	data.raw["equipment-grid"][cargoPlaneGridName].equipment_categories = data.raw["equipment-grid"]["cargo-plane-equipment-grid"].equipment_categories
end