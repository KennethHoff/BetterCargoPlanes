data:extend({
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{ -- Better Cargo Planes
		type = "technology",
		name = "better-cargo-planes",
		icon = "__betterCargoPlanes__/graphics/icons/better_cargo_plane_icon.png",
		icon_size = 64,
		prerequisites = { "cargo-planes" },
		effects = {
			{
				type = "unlock-recipe",
				recipe = "better-cargo-plane"
			}
		},
		unit = {
			count = 1500,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 }

			},
			time = 45
		},
		order = "c-i-a"
	},
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{ -- Even Better Cargo Planes
		type = "technology",
		name = "even-better-cargo-planes",
		icon = "__betterCargoPlanes__/graphics/icons/even_better_cargo_plane_icon.png",
		icon_size = 64,
		prerequisites = { "better-cargo-planes", "space-science-pack" },
		effects = {
			{
				type = "unlock-recipe",
				recipe = "even-better-cargo-plane"
			}
		},
		unit = {
			count = 3000,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "production-science-pack", 1 },
				{ "utility-science-pack", 1 },
				{ "space-science-pack", 1 }

			},
			time = 75
		},
		order = "c-i-b"
	}
})