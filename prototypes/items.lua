data:extend({
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    { -- Better Cargo Plane
        type = "item-with-entity-data",
        name = "better-cargo-plane",
        icon = "__Aircraft__/graphics/Cargo_Plane_Icon.png", -- Temporary visual
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
    icon = "__Aircraft__/graphics/Cargo_Plane_Icon.png", -- Temporary visual
    icon_size = 32,
    flags = {},
    subgroup = "transport",
    order = "b[personal-transport]-j[even-better-cargo-plane]",
    place_result= "even-better-cargo-plane",
    stack_size= 1,
    }
})