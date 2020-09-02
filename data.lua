require("prototypes.entities")
require("prototypes.equipment-grid")
require("prototypes.items")
require("prototypes.recipes")
require("prototypes.technologies")
require("prototypes.recipe-updates") --Mod Compatibility
require("prototypes.technologies-updates") --Mod Compatibility



data.raw.car["better-cargo-plane"].inventory_size = settings.startup["betterCargoPlanes-inventorySizeT2"].value;
data.raw.car["cargo-plane"].inventory_size = settings.startup["betterCargoPlanes-inventorySizeT1"].value;
data.raw.car["even-better-cargo-plane"].inventory_size = settings.startup["betterCargoPlanes-inventorySizeT3"].value;