require("prototypes.equipment-grid-updates")


--Inserter Immunity
if settings.startup["inserter-immunity"].value == true then
    table.insert(data.raw["car"]["better-cargo-plane"].flags, "no-automated-item-removal")
    table.insert(data.raw["car"]["better-cargo-plane"].flags, "no-automated-item-insertion")
    table.insert(data.raw["car"]["even-better-cargo-plane"].flags, "no-automated-item-removal")
    table.insert(data.raw["car"]["even-better-cargo-plane"].flags, "no-automated-item-insertion")
end

