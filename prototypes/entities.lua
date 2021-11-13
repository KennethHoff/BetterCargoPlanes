local graphicsPath = "__betterCargoPlanes__/graphics/"
local iconPath = graphicsPath .. "icons/"
local entityPath = graphicsPath .. "entity/"


--region Copy-Pasta code

local function resist(type, decrease, percent)
    return {
        type = type,
        decrease = decrease,
        percent = percent
    }
end

--endregion

local function createPlane(planeNameWithDashes, guns, maxHealth, powerConsumption, powerEffectivity, accelPerEnergy, breakingPower, resistances)
    newPlane = table.deepcopy(data.raw["car"]["cargo-plane"])

    planeNameWithUnderscores = string.gsub(planeNameWithDashes, "-", "_");

    -- Metadata
    newPlane.icon = iconPath .. planeNameWithUnderscores .. "_icon.png"

    -- Equipment and guns
    newPlane.equipment_grid = planeNameWithDashes .. "equipment-grid"
    newPlane.guns = guns

    -- Stats
    newPlane.max_health = maxHealth
    newPlane.minable = { mining_time = 5, result = planeNameWithDashes}

    newPlane.consumption = tostring(powerConsumption) .. "kw"
    newPlane.effectivity = powerEffectivity
    newPlane.acceleration_per_energy = accelPerEnergy

    -- Movement
    newPlane.braking_power = tostring(breakingPower) .. "kw"

    -- Resistances
    newPlane.resistances = resistances

    -- Animation
    newPlaneBaseEntityPath = entityPath .. planeNameWithUnderscores

    newPlane.animation.layers[1].filename = newPlaneBaseEntityPath .. "/" .. planeNameWithUnderscores .. "_spritesheet_shadowless.png"
    newPlane.animation.layers[2].filename = newPlaneBaseEntityPath .. "/" .. planeNameWithUnderscores .. "_spritesheet.png"

    return newPlane;
end

--region Better Cargo Plane

betterCargoPlane = table.deepcopy(data.raw["car"]["cargo-plane"])

-- Metadata
betterCargoPlane.icon = "__betterCargoPlanes__/graphics/icons/better_cargo_plane_icon.png";

-- Equipment and guns
betterCargoPlane.equipment_grid = "Better-Cargo-Plane-Equipment-Grid"
betterCargoPlane.guns = { "flying-fortress-machine-gun" }

betterCargoPlane.animation.filename = "__betterCargoPlanes__/graphics/entity/better_cargo_plane_spritesheet.png"

-- Stats
betterCargoPlane.max_health = 1000
betterCargoPlane.minable = { mining_time = 5, result = "better-cargo-plane" } -- How long it takes to mine it, and which item to return when it's mined.

betterCargoPlane.consumption = "1875kW" -- How much power the engine can use.
betterCargoPlane.effectivity = 1 -- Engine Effectiveness (kW => Speed..)
betterCargoPlane.acceleration_per_energy = 0.15 -- How much acceleration one kW adds.

-- Movement
betterCargoPlane.braking_power = "3000kW" -- How effective the brakes are
betterCargoPlane.rotation_speed = 0.01 -- How quickly it rotates
betterCargoPlane.friction = 0.005 -- How much speed it loses over time. (Severely affects top-speed)
betterCargoPlane.breaking_speed = 0.5

betterCargoPlane.inventory_size = 180

-- Resistances

betterCargoPlane.resistances = {
    resist("fire", 10, 70),
    resist("physical", 10, 50),
    resist("impact", 20, 80),
    resist("explosion", 10, 50),
    resist("acid", 0, 40)
}

--endregion


betterCargoPlaneResistances = {
    resist("fire", 5, 60),
    resist("physical", 5, 40),
    resist("impact", 20, 70),
    resist("explosion", 6, 40),
    resist("acid", 0, 30)
}
betterCargoPlane = createPlane("better-cargo-plane", { "flying-fortress-machine-gun" }, 1000, 1875, 1, 0.15, 3000, betterCargoPlaneResistances)

evenBetterCargoPlaneResistances = {
    resist("fire", 10, 70),
    resist("physical", 10, 50),
    resist("impact", 20, 80),
    resist("explosion", 10, 50),
    resist("acid", 0, 40)
}
evenBetterCargoPlane = createPlane("even-better-cargo-plane", { "flying-fortress-machine-gun" }, 2000, 2500, 1.25, 1, 10000, evenBetterCargoPlaneResistances)

data:extend({betterCargoPlane, evenBetterCargoPlane})