local GRAPHICSPATH = "__betterCargoPlanes__/graphics/"
local ICONPATH = GRAPHICSPATH .. "/icons/"
local ENTITYPATH = GRAPHICSPATH .. "/entity/"


--region Copy-Pasta code

local function addCommonAimLines(anim)
    for _, layer in pairs(anim.layers) do
        layer.width, layer.height = 224, 224
        layer.hr_version.width, layer.hr_version.height = 448, 448
        layer.hr_version.scale = 0.5
        layer.frame_count, layer.hr_version.frame_count = 1, 1
        layer.direction_count, layer.hr_version.direction_count = 36, 36
        layer.line_length, layer.hr_version.line_length = 6, 6
        layer.max_advance, layer.hr_version.max_advance = 1, 1
    end
    return anim
end

local function airplaneAnimation(name)
    local anim = {}
    anim.layers = {
        {
            filename = ENTITYPATH .. name .. "/" .. name .. "_spritesheet.png",
            shift = util.by_pixel(9, -10),
            hr_version = {
                filename = ENTITYPATH .. name .. "/hr-" .. name .. "_spritesheet.png",
                shift = util.by_pixel(9, -10),
            }
        },
        {
            filename = ENTITYPATH .. name .. "/" .. name .. "_spritesheet-shadow.png",
            shift = util.by_pixel(54, 35),
            draw_as_shadow = true,
            hr_version = {
                filename = ENTITYPATH .. name .. "/hr-" .. name .. "_spritesheet-shadow.png",
                shift = util.by_pixel(54, 35),
                draw_as_shadow = true,
            }
        }
    }
    addCommonAimLines(anim)
    return anim
end

local function resist(type, decrease, percent)
    return {
        type = type,
        decrease = decrease,
        percent = percent
    }
end
--endregion

local planes = {
    ["better-cargo-plane"] = { volume = 0.4, belt_immunity = true },
    ["even-better-cargo-plane"] = { volume = 0.4, belt_immunity = true }
}

--region Old Cargo plane creation
--
local betterCargoPlane = {
    type = "car",
    name = "better-cargo-plane",
    icon = "__betterCargoPlanes__/graphics/icons/better_cargo_plane_icon.png",
    icon_size = 32,
    flags = { "placeable-neutral", "player-creation", "placeable-off-grid" },
    has_belt_immunity = false,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    energy_per_hit_point = 0.5,
    terrain_friction_modifier = 0,


    -- Stats
    max_health = 1000,
    consumption = "1875kW", -- How much power the engine can use.
    effectivity = 1, -- Engine Effectiveness (kW => Speed..)
    braking_power = "3000kW", -- How effective the brakes are
    acceleration_per_energy = 0.15, -- How much acceleration one kW adds.
    inventory_size = 180, -- Inventory Size
    rotation_speed = 0.01, -- How quickly it rotates
    friction = 0.005, -- How much speed it loses over time. (Severely affects top-speed)
    breaking_speed = 0.5,


    weight = 3000, -- How much it weighs (Mostly used for collisions, which airplanes don't)

    minable = { mining_time = 5, result = "better-cargo-plane" }, -- How long it takes to mine it, and which item to return when it's mined.


    burner = { --- Various Burner Engine stats
               effectivity = 1, -- How effective the burner engine is at turning fuel into energy
               fuel_inventory_size = 8, -- Fuel inventory size
               smoke = {
                   {
                       name = "smoke",
                       deviation = { 0.25, 0.25 },
                       frequency = 50,
                       position = { 0, 1.5 },
                       starting_frame = 3,
                       starting_frame_deviation = 5,
                       starting_frame_speed = 0,
                       starting_frame_speed_deviation = 5
                   }
               }
    },

    -- Resistances
    resistances = {
        {
            type = "fire",
            decrease = 5,
            percent = 60
        },
        {
            type = "physical",
            decrease = 5,
            percent = 40
        },
        {
            type = "impact",
            decrease = 10,
            percent = 70
        },
        {
            type = "explosion",
            decrease = 5,
            percent = 40
        },
        {
            type = "acid",
            decrease = 0,
            percent = 30
        }
    },
    stop_trigger_speed = 0.2,
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume = 0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    tank_driving = true,
    equipment_grid = "Better-Cargo-Plane-Equipment-Grid",
    guns = { "aircraft-machine-gun" },
    collision_box = { { -0.9, -1.3 }, { 0.9, 1.3 } },
    collision_mask = {},
    selection_box = { { -0.9, -1.3 }, { 0.9, 1.3 } },
    selection_priority = 60,
    light = {
        {
            type = "oriented",
            minimum_darkness = 0.3,
            picture = {
                filename = "__core__/graphics/light-cone.png",
                priority = "medium",
                scale = 2,
                width = 200,
                height = 200
            },
            shift = { -0.1, -12 },
            size = 2,
            intensity = 0.8
        }
    },
    render_layer = "air-object",
    final_render_layer = "air-object",
    animation = {
        filename = "__betterCargoPlanes__/graphics/entity/better_cargo_plane_spritesheet.png",
        priority = "high",
        width = 224,
        height = 224,
        frame_count = 1,
        direction_count = 36,
        line_length = 6,
        line_height = 6,
        shift = { 0, 0 },
        max_advance = 1,
    },
    sound_no_fuel = {
        {
            filename = "__base__/sound/fight/tank-no-fuel-1.ogg",
            volume = 0.6
        },
    },
    sound_minimum_speed = 0.15;
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
        sound = {
            filename = "__base__/sound/car-engine.ogg",
            volume = 0.6
        },
        activate_sound = {
            filename = "__base__/sound/car-engine-start.ogg",
            volume = 0.6
        },
        deactivate_sound = {
            filename = "__base__/sound/car-engine-stop.ogg",
            volume = 0.6
        },
        match_speed_to_activity = true,
    }
}

local evenBetterCargoPlane = {
    type = "car",
    name = "even-better-cargo-plane",
    icon = "__betterCargoPlanes__/graphics/icons/even_better_cargo_plane_icon.png",
    icon_size = 32,
    flags = { "placeable-neutral", "player-creation", "placeable-off-grid" },
    has_belt_immunity = false,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    energy_per_hit_point = 0.5,
    terrain_friction_modifier = 0,


    -- Stats
    max_health = 2000,
    consumption = "2500kW", -- How much power the engine can use.
    effectivity = 1.25, -- Engine Effectiveness (kW => Speed..)
    braking_power = "10000kW", -- How effective the brakes are
    acceleration_per_energy = 1, -- How much acceleration one kW adds.
    inventory_size = 240, -- Inventory Size
    rotation_speed = 0.015, -- How quickly it rotates
    friction = 0.0025, -- How much speed it loses over time. (Severely affects top-speed)
    breaking_speed = 1,


    weight = 2500, -- How much it weighs (Mostly used for collisions, which airplanes don't)

    minable = { mining_time = 5, result = "even-better-cargo-plane" }, -- How long it takes to mine it, and which item to return when it's mined.


    burner = { --- Various Burner Engine stats
               effectivity = 1, -- How effective the burner engine is at turning fuel into energy
               fuel_inventory_size = 10, -- Fuel inventory size
               smoke = {
                   {
                       name = "smoke",
                       deviation = { 0.25, 0.25 },
                       frequency = 50,
                       position = { 0, 1.5 },
                       starting_frame = 3,
                       starting_frame_deviation = 5,
                       starting_frame_speed = 0,
                       starting_frame_speed_deviation = 5
                   }
               }
    },

    -- Resistances
    resistances = {
        {
            type = "fire",
            decrease = 10,
            percent = 70
        },
        {
            type = "physical",
            decrease = 10,
            percent = 50
        },
        {
            type = "impact",
            decrease = 20,
            percent = 80
        },
        {
            type = "explosion",
            decrease = 10,
            percent = 50
        },
        {
            type = "acid",
            decrease = 0,
            percent = 40
        }
    },
    collision_box = { { -0.9, -1.3 }, { 0.9, 1.3 } },
    collision_mask = {},
    selection_box = { { -0.9, -1.3 }, { 0.9, 1.3 } },
    selection_priority = 60,
    stop_trigger_speed = 0.2,
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume = 0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    tank_driving = true,
    equipment_grid = "Even-Better-Cargo-Plane-Equipment-Grid",
    guns = { "flying-fortress-machine-gun" },

    light = {
        {
            type = "oriented",
            minimum_darkness = 0.3,
            picture = {
                filename = "__core__/graphics/light-cone.png",
                priority = "medium",
                scale = 2,
                width = 200,
                height = 200
            },
            shift = { -0.1, -12 },
            size = 2,
            intensity = 0.8
        }
    },
    render_layer = "air-object",
    final_render_layer = "air-object",
    animation = {
        filename = "__betterCargoPlanes__/graphics/entity/even_better_cargo_plane_spritesheet.png",
        priority = "high",
        width = 224,
        height = 224,
        frame_count = 1,
        direction_count = 36,
        line_length = 6,
        line_height = 6,
        shift = { 0, 0 },
        max_advance = 1,
    },
    sound_no_fuel = {
        {
            filename = "__base__/sound/fight/tank-no-fuel-1.ogg",
            volume = 0.6
        },
    },
    sound_minimum_speed = 0.15;
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
        sound = {
            filename = "__base__/sound/car-engine.ogg",
            volume = 0.6
        },
        activate_sound = {
            filename = "__base__/sound/car-engine-start.ogg",
            volume = 0.6
        },
        deactivate_sound = {
            filename = "__base__/sound/car-engine-stop.ogg",
            volume = 0.6
        },
        match_speed_to_activity = true,
    }
}

--endregion

--region Better Cargo Plane
--betterCargoPlane = table.deepcopy(data.raw["car"]["cargo-plane"])
--
---- Metadata
--betterCargoPlane.icon = "__betterCargoPlanes__/graphics/icons/better_cargo_plane_icon.png";
--
---- Equipment and guns
--betterCargoPlane.equipment_grid = "Better-Cargo-Plane-Equipment-Grid"
--betterCargoPlane.guns = { "flying-fortress-machine-gun" }
--
--betterCargoPlane.animation = airplaneAnimation("better_cargo_plane")
--
---- Stats
--betterCargoPlane.max_health = 1000
--betterCargoPlane.minable = { mining_time = 5, result = "better-cargo-plane" } -- How long it takes to mine it, and which item to return when it's mined.
--
--betterCargoPlane.consumption = "1875kW" -- How much power the engine can use.
--betterCargoPlane.effectivity = 1 -- Engine Effectiveness (kW => Speed..)
--betterCargoPlane.acceleration_per_energy = 0.15 -- How much acceleration one kW adds.
--
---- Movement
--betterCargoPlane.braking_power = "3000kW" -- How effective the brakes are
--betterCargoPlane.rotation_speed = 0.01 -- How quickly it rotates
--betterCargoPlane.friction = 0.005 -- How much speed it loses over time. (Severely affects top-speed)
--betterCargoPlane.breaking_speed = 0.5
--
--betterCargoPlane.inventory_size = 180
--
---- Resistances
--betterCargoPlane.resistances = {
--    resist("fire", 10, 70),
--    resist("physical", 10, 50),
--    resist("impact", 20, 80),
--    resist("explosion", 10, 50),
--    resist("acid", 0, 40)
--}

--endregion



data:extend({betterCargoPlane, evenBetterCargoPlane})


-- Copied straight from the Aircraft mod.
for k, v in pairs(planes) do
    local plane = data.raw["car"][k]
    if plane then
        -- insert jet sounds
        if settings.startup["aircraft-sound-setting"].value == true then
            plane.working_sound = {
                sound = {
                    filename = "__Aircraft__/sounds/jet-loop.ogg",
                    volume = v.volume
                },
                activate_sound = {
                    filename = "__Aircraft__/sounds/jet-start.ogg",
                    volume = v.volume
                },
                deactivate_sound = {
                    filename = "__Aircraft__/sounds/jet-stop.ogg",
                    volume = v.volume
                },
                match_speed_to_activity = false,
            }
        end

        -- insert belt immunity
        if settings.startup["aircraft-belt-immunity"].value == true then
            plane.has_belt_immunity = v.belt_immunity
        end
    end
end