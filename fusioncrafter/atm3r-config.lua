-- This file contains configuration for the fusioncrafter

local config = {}

-- Specify the inventories here
--
-- Keys:
--   input:     Inventory where items are input into the autocraftin system
--   injectors: Inventory where items for the Fusion Crafting Injectors should be put
--   core:      Inventory where items for the Fusion Crafting Core should be put
--   output:    Inventory where items should be put after crafting is finished
--   result:    Inventory where items go after the fusion crafting finished
--
-- Values:
--   0: down
--   1: up
--   2: north
--   3: south
--   4: west
--   5: east
--
--   Hint: If you have waila just press Shift while 
--     looking at the side and it'll show the value
config.inventories = {
  input = 3,
  result = 2,
  injectors = 5,
  core = 4,
  output = 1
}

-- Specify recipes here
--
-- Foramt:
-- {
--   input = {  -- Items needed to craft; This includes the item put into the core
--     [<item id>.<damage value] = <item amount>,
--     [<item id>.<damage value] = <item amount>,
--     ...
--   },
--   core = { [<item id>.<damage value] = <item amount>,  -- Item to be put into the fusion crafting core, and it's amount
--   output = {  -- Items that result from the crafting
--     [<item id>.<damage value] = <item amount>,
--     [<item id>.<damage value] = <item amount>,
--     ...
--   }
-- }
--
-- Hint: To display item id's press F3+H
config.recipes = {
  {
    output = { ["draconicevolution:wyvern_core/0"] = 1 },
    input = {
      ["draconicevolution:draconic_core/0"] = 5,
      ["draconicevolution:draconium_block/0"] = 2,
      ["minecraft:nether_star/0"] = 2,
      ["minecraft:emerald_block/0"] = 1
    },
    core = { ["minecraft:emerald_block/0"] = 1 },
    name = "Wyvern Core"
  },
  {
    output = { ["draconicevolution:draconic_block/0"] = 4 },
    input = {
      ["draconicevolution:wyvern_core/0"] = 6,
      ["draconicevolution:dragon_heart/0"] = 1,
      ["draconicevolution:draconium_block/0"] = 4
    },
    core = { ["draconicevolution:draconium_block/0"] = 4 },
    name = "Awakened Draconium Block"
  },
  {
    output = { ["draconicevolution:awakened_core/0"] = 1 },
    input = {
      ["draconicevolution:wyvern_core/0"] = 5,
      ["draconicevolution:draconic_block/0"] = 4,
      ["minecraft:nether_star/0"] = 1
    },
    core = { ["minecraft:nether_star/0"] = 1 },
    name = "Awakened Core"
  },
  {
    output = { ["draconicevolution:chaotic_core/0"] = 1 },
    input = {
      ["draconicevolution:chaos_shard/0"] = 5,
      ["draconicevolution:draconic_block/0"] = 6,
      ["draconicevolution:awakened_core/0"] = 4
    },
    core = { ["draconicevolution:chaos_shard/0"] = 1 },
    name = "Chaotic Core"
  },
  {
    output = { ["draconicevolution:draconic_energy_core/0"] = 1 },
    input = {
      ["minecraft:redstone_block/0"] = 5,
      ["draconicevolution:draconic_ingot/0"] = 4,
      ["draconicevolution:wyvern_energy_core/0"] = 1,
      ["draconicevolution:awakened_core/0"] = 1
    },
    core = { ["draconicevolution:wyvern_energy_core/0"] = 1 },
    name = "Draconic Energy Core"
  },
  {
    output = { ["draconicevolution:energy_crystal/2"] = 4 },  -- Draconic energy relay crystal
    input = {
      ["minecraft:diamond/0"] = 4,
      ["draconicevolution:wyvern_energy_core/0"] = 4,
      ["draconicevolution:draconic_energy_core/0"] = 1,
      ["draconicevolution:wyvern_core/0"] = 1,
      ["draconicevolution:energy_crystal/1"] = 4
    },
    core = { ["draconicevolution:energy_crystal/1"] = 4 },
    name = "Draconic Energy Relay Crystal"
  },
  {
    output = { ["draconicevolution:particle_generator/2"] = 1 },  -- Energy core stabilizer
    input = {
      ["minecraft:diamond/0"] = 4,
      ["draconicevolution:wyvern_core/0"] = 2,
      ["draconicevolution:particle_generator/0"] = 1
    },
    core = { ["draconicevolution:particle_generator/0"] = 1 },
    name = "Energy Core Stabilizer"
  },
  {
    output = { ["draconicevolution:infused_obsidian/0"] = 1 },
    input = {
      ["minecraft:diamond/0"] = 2,
      ["draconicevolution:draconium_dust/0"] = 4,
      ["draconicevolution:draconium_ingot/0"] = 2,
      ["minecraft:blaze_powder/0"] = 2,
      ["minecraft:obsidian/0"] = 1
    },
    core = { ["minecraft:obsidian/0"] = 1 },
    name = "Infused Obsidian"
  },
  {
    output = { ["draconicevolution:crafting_injector/1"] = 1 },  -- Wyvern crafting injector
    input = {
      ["draconicevolution:wyvern_core/0"] = 1,
      ["minecraft:nether_star/0"] = 4,
      ["draconicevolution:draconium_block/0"] = 1,
      ["draconicevolution:draconic_core/0"] = 2,
      ["draconicevolution:crafting_injector/0"] = 1
    },
    core = { ["draconicevolution:crafting_injector/0"] = 1 },
    name = "Wyvern Fusion Crafting Injector"
  },
  {
    output = { ["draconicevolution:crafting_injector/2"] = 1 },  -- Draconic crafting injector
    input = {
      ["draconicevolution:wyvern_core/0"] = 2,
      ["minecraft:nether_star/0"] = 4,
      ["draconicevolution:draconic_block/0"] = 1,
      ["minecraft:dragon_egg/0"] = 1,
      ["draconicevolution:crafting_injector/1"] = 1
    },
    core = { ["draconicevolution:crafting_injector/1"] = 1 },
    name = "Draconic Fusion Crafting Injector"
  },
  {
    output = { ["draconicevolution:crafting_injector/3"] = 1 },  -- Chaotic crafting injector
    input = {
      ["draconicevolution:chaotic_core/0"] = 2,
      ["minecraft:nether_star/0"] = 4,
      ["draconicevolution:chaos_shard/0"] = 1,
      ["minecraft:dragon_egg/0"] = 1,
      ["draconicevolution:crafting_injector/2"] = 1
    },
    core = { ["draconicevolution:crafting_injector/2"] = 1 },
    name = "Chaotic Fusion Crafting Injector"
  },
  {
    output = { ["draconicevolution:reactor_core/0"] = 1 },
    input = {
      ["draconicevolution:draconic_ingot/0"] = 2,
      ["draconicevolution:draconic_block/0"] = 2,
      ["draconicevolution:chaos_shard/0"] = 1,
      ["draconicevolution:draconium_ingot/0"] = 3
    },
    core = { ["draconicevolution:chaos_shard/0"] = 1 },
    name = "Draconic Reactor Core"
  },
  {
    output = { ["draconicevolution:reactor_component/1"] = 1 },  -- Reactor energy injector
    input = {
      ["draconicevolution:draconic_ingot/0"] = 4,
      ["draconicevolution:awakened_core/0"] = 1,
      ["draconicevolution:reactor_part/1"] = 4,
      ["minecraft:iron_ingot/0"] = 1
    },
    core = { ["draconicevolution:awakened_core/0"] = 1 },
    name = "Reactor Energy Injector"
  },
  {
    output = { ["draconicevolution:draconium_chest/0"] = 1 },
    input = {
      ["minecraft:furnace/0"] = 5,
      ["draconicevolution:draconic_core/0"] = 2,
      ["draconicevolution:draconium_block/0"] = 1,
      ["minecraft:chest/0"] = 1,
      ["minecraft:crafting_table/0"] = 2
    },
    core = { ["minecraft:chest/0"] = 1 },
    name = "Draconium Chest"
  },
  {
    output = { ["draconicevolution:ender_energy_manipulator/0"] = 1 },
    input = {
      ["minecraft:skull/1"] = 1,
      ["draconicevolution:draconic_core/0"] = 4,
      ["draconicevolution:wyvern_core/0"] = 3,
      ["minecraft:ender_eye/0"] = 3
    },
    core = { ["minecraft:skull/1"] = 1 },
    name = "Ender Energy Manipulator"
  },
  {
    output = { ["draconicevolution:draconic_pick/0"] = 1 },
    input = {
      ["draconicevolution:draconic_block/0"] = 2,
      ["draconicevolution:awakened_core/0"] = 1,
      ["draconicevolution:wyvern_pick/0"] = 1,
      ["draconicevolution:draconic_energy_core/0"] = 1
    },
    core = { ["draconicevolution:wyvern_pick/0"] = 1 },
    name = "Draconic Pickaxe"
  },
  {
    output = { ["draconicevolution:draconic_shovel/0"] = 1 },
    input = {
      ["draconicevolution:draconic_block/0"] = 2,
      ["draconicevolution:awakened_core/0"] = 1,
      ["draconicevolution:wyvern_shovel/0"] = 1,
      ["draconicevolution:draconic_energy_core/0"] = 1
    },
    core = { ["draconicevolution:wyvern_shovel/0"] = 1 },
    name = "Draconic Shovel"
  },
  {
    output = { ["draconicevolution:draconic_axe/0"] = 1 },
    input = {
      ["draconicevolution:draconic_block/0"] = 2,
      ["draconicevolution:awakened_core/0"] = 1,
      ["draconicevolution:wyvern_axe/0"] = 1,
      ["draconicevolution:draconic_energy_core/0"] = 1
    },
    core = { ["draconicevolution:wyvern_axe/0"] = 1 },
    name = "Draconic Axe"
  },
  {
    output = { ["draconicevolution:draconic_bow/0"] = 1 },
    input = {
      ["draconicevolution:draconic_block/0"] = 2,
      ["draconicevolution:awakened_core/0"] = 1,
      ["draconicevolution:wyvern_bow/0"] = 1,
      ["draconicevolution:draconic_energy_core/0"] = 1
    },
    core = { ["draconicevolution:wyvern_bow/0"] = 1 },
    name = "Draconic Bow"
  },
  {
    output = { ["draconicevolution:draconic_sword/0"] = 1 },
    input = {
      ["draconicevolution:draconic_block/0"] = 2,
      ["draconicevolution:awakened_core/0"] = 1,
      ["draconicevolution:wyvern_sword/0"] = 1,
      ["draconicevolution:draconic_energy_core/0"] = 1
    },
    core = { ["draconicevolution:wyvern_sword/0"] = 1 },
    name = "Draconic Sword"
  },
  {
    output = { ["draconicevolution:draconic_hoe/0"] = 1 },
    input = {
      ["draconicevolution:draconic_block/0"] = 2,
      ["draconicevolution:awakened_core/0"] = 1,
      ["minecraft:diamond_hoe/0"] = 1,
      ["draconicevolution:draconic_energy_core/0"] = 1
    },
    core = { ["minecraft:diamond_hoe/0"] = 1 },
    name = "Draconic Hoe"
  },
  {
    output = { ["draconicevolution:draconic_staff_of_power/0"] = 1 },
    input = {
      ["draconicevolution:draconic_block/0"] = 5,
      ["draconicevolution:awakened_core/0"] = 1,
      ["draconicevolution:draconic_pick/0"] = 1,
      ["draconicevolution:draconic_shovel/0"] = 1,
      ["draconicevolution:draconic_sword/0"] = 1
    },
    core = { ["draconicevolution:draconic_pick/0"] = 1 },
    name = "Draconic Staff of Power"
  },
  {
    output = { ["draconicevolution:dislocator_advanced/0"] = 1 },
    input = {
      ["minecraft:ender_pearl/0"] = 3,
      ["minecraft:dragon_egg/0"] = 1,
      ["draconicevolution:draconium_ingot/0"] = 4,
      ["draconicevolution:dislocator/0"] = 1
    },
    core = { ["draconicevolution:dislocator/0"] = 1 },
    name = "Advanced Dislocator"
  },
  {
    output = { ["draconicevolution:draconic_helm/0"] = 1 },
    input = {
      ["draconicevolution:draconic_block/0"] = 1,
      ["draconicevolution:awakened_core/0"] = 1,
      ["draconicevolution:draconic_energy_core/0"] = 1,
      ["draconicevolution:wyvern_helm/0"] = 1
    },
    core = { ["draconicevolution:wyvern_helm/0"] = 1 },
    name = "Draconic Helm"
  },
  {
    output = { ["draconicevolution:draconic_legs/0"] = 1 },
    input = {
      ["draconicevolution:draconic_block/0"] = 1,
      ["draconicevolution:awakened_core/0"] = 1,
      ["draconicevolution:draconic_energy_core/0"] = 1,
      ["draconicevolution:wyvern_legs/0"] = 1
    },
    core = { ["draconicevolution:wyvern_legs/0"] = 1 },
    name = "Draconic Legs"
  },
  {
    output = { ["draconicevolution:draconic_boots/0"] = 1 },
    input = {
      ["draconicevolution:draconic_block/0"] = 1,
      ["draconicevolution:awakened_core/0"] = 1,
      ["draconicevolution:draconic_energy_core/0"] = 1,
      ["draconicevolution:wyvern_boots/0"] = 1
    },
    core = { ["draconicevolution:wyvern_boots/0"] = 1 },
    name = "Draconic Boots"
  },
  {
    output = { ["draconicevolution:draconic_chest/0"] = 1 },
    input = {
      ["draconicevolution:draconic_block/0"] = 1,
      ["draconicevolution:awakened_core/0"] = 1,
      ["draconicevolution:draconic_energy_core/0"] = 1,
      ["draconicevolution:wyvern_chest/0"] = 1
    },
    core = { ["draconicevolution:wyvern_chest/0"] = 1 },
    name = "Draconic Chestplate"
  },
  {
    output = { ["atmtweaks:item_material/1"] = 1 },  -- Growth essence
    input = {
      ["forestry:royal_jelly/0"] = 1,
      ["actuallyadditions:item_fertilizer/0"] = 1,
      ["thermalfoundation:fertilizer/2"] = 1,
      ["minecraft:dye/15"] = 1,
      ["botania:manaresource/23"] = 1
    },
    core = { ["forestry:royal_jelly/0"] = 1 },
	name = "Growth Essence"
  }
}

return config