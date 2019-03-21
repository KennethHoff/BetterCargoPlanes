data:extend({
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    { -- Better Cargo Plane
        type = "item-with-entity-data",
        name = "better-cargo-plane",
        icon = "__betterCargoPlanes__/graphics/icons/better_cargo_plane_icon.png", -- Temporary visual
        icon_size = 32,
        flags = {},
        subgroup = "transport",
        order = "b[personal-transport]-i[better-cargo-plane]",
        place_result= "better-cargo-plane",
        stack_size= 1,
    },
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    { -- Even Better Cargo Plane
    type = "item-with-entity-data",
    name = "even-better-cargo-plane",
    icon = "__betterCargoPlanes__/graphics/icons/even_better_cargo_plane_icon.png", -- Temporary visual
    icon_size = 32,
    flags = {},
    subgroup = "transport",
    order = "b[personal-transport]-j[even-better-cargo-plane]",
    place_result= "even-better-cargo-plane",
    stack_size= 1,
    },
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 { -- Better Cargo Plane Rifle
    type = "gun",
    name = "better-cargo-planes-rifle",
    icon = "__betterCargoPlanes__/graphics/icons/rifle_icon.png", -- Temporary visual
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "gun",
    order = "a[basic-clips]-c[better-cargo-plane-rifle]",
    attack_parameters = {
        type = "projectile",
        ammo_category = "bullet",
        cooldown = 30,
        range = 25,
        damage_modifier = 7,
        movement_slow_down_factor = 0.5,
        shell_particle = {
            name = "shell-particle",
            direction_deviation = 0.1,
            speed = 0.1,
            speed_deviation = 0.03,
            center = {0, 0},
            creation_distance = -0.6875,
            starting_frame_speed = 0.4,
            starting_frame_speed_deviation = 0.1
        },
        projectile_creation_distance = 0.65,
        sound = make_heavy_gunshot_sounds(),
    },
    stack_size = 1
  },
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 { -- Even Better Cargo Plane Sniper-Rifle
    type = "gun",
    name = "better-cargo-planes-sniper-rifle",
    icon = "__betterCargoPlanes__/graphics/icons/sniper-rifle_icon.png", -- Temporary visual
    icon_size = 32,
    flags = {"hidden"},
    subgroup = "gun",
    order = "a[basic-clips]-c[better-cargo-plane-rifle]",
    attack_parameters = {
        type = "projectile",
        ammo_category = "bullet",
        cooldown = 120,
        range = 40,
        damage_modifier = 25,
        -- movement_slow_down_factor = 0.5,
        shell_particle = {
            name = "shell-particle",
            direction_deviation = 0.1,
            speed = 0.1,
            speed_deviation = 0.03,
            center = {0, 0},
            creation_distance = -0.6875,
            starting_frame_speed = 0.4,
            starting_frame_speed_deviation = 0.1
        },
        projectile_creation_distance = 0.65,
        sound = make_heavy_gunshot_sounds()
    },
    stack_size = 1
  },
})