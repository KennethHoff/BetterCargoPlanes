if data.raw.gun["rifle"] then
  if data.raw.technology["military-3"] then
    bobmods.lib.tech.add_prerequisite ("better-cargo-planes", "military-3")
  end
end