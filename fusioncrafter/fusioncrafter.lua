-- fusioncrafter.lua
-- Author: sedlak477
-- This program automates Draconic Evolution Fusion Crafting

local thread = require("thread")
local transposer = require("component").transposer
local config = require("config")
local event = require("event")
local str = require("str")

-- Load side mappings from config
local input = config.inventories.input
local core = config.inventories.core
local injectors = config.inventories.injectors
local output = config.inventories.output
local result = config.inventories.result

-- Load recipes from config
local recipes = config.recipes

-- Greet user with a friendly message
local function printHello()
  print("FusionCrafter v1.0 by sedlak477")
  print()
end

-- Retrun amount of item in inventory
local function getItemAmount(item, side)
  local t = str.split(item, "%/")
  local name = t[1]
  local variant = tonumber(t[2])
  
  -- Look through all items to see if the requested exists
  for stack in transposer.getAllStacks(side) do
    if stack.name == name and stack.damage == variant then
      return stack.size
    end
  end
  return 0
end

-- Check if recipe is craftable with
-- current items
local function canCraft(recipe)
  for item, neededAmount in pairs(recipe.input) do
    local availableAmount = getItemAmount(item, input)

    if availableAmount < neededAmount then
      return false
    end
  end
  return true
end

-- Find item slot in inventory
-- Pass nil for item to find empty slot
-- Returns nil if no slot is found
local function find(inventory, item)
  local name = ""
  local variant = 0
  
  if item ~= nil then
    local t = str.split(item, "%/")
    name = t[1]
    variant = tonumber(t[2])
  end
    
  for slot = 1, transposer.getInventorySize(inventory), 1 do
    if item == nil then
      if transposer.getSlotStackSize(inventory, slot) == 0 then
        return slot
      end
    else
      local stack = transposer.getStackInSlot(inventory, slot)
      if stack ~= nil and stack.name == name and stack.damage == variant then
        return slot
      end
    end
  end
end

-- Transfer 'amount' of item 'id' from 'from' to a free slot in 'to'
local function transfer(item, amount, from, to)
  -- Get slots with items
  local slotFrom = find(from, item)
  local slotTo = find(to, nil)

  -- Do some error checking
  if slotFrom == nil then
    print("Error: transfer: No item '" .. item .. "' in source inventory")
    return
  end

  if slotTo == nil then
    print("Error: transfer: No free slot in target inventory")
    return
  end

  transposer.transferItem(from, to, amount, slotFrom, slotTo)
end

-- Wait until items are in inventory
local function waitItems(inventory, items)
  while true do
    local itemsExist = true
    for item, amount in pairs(items) do
      local slot = find(inventory, item)
      if slot == nil then
        itemsExist = false
        break
      end
      if transposer.getSlotStackSize(inventory, slot) < amount then
        itemsExist = false
        break
      end
    end

    if itemsExist then
      return
    end
    
    os.sleep(1)
  end
end

-- Craft provided recipe
local function craft(recipe)
  -- Tell the user what we are doing
  local resultString = ""
  local coreItem = ""
  local coreAmount = 0
  io.write("Crafting " .. recipe.name .. "...")

  for item, amount in pairs(recipe.core) do
    coreItem = item
    coreAmount = amount
    transfer(item, amount, input, core)
  end

  -- Put input items into their places
  for item, amount in pairs(recipe.input) do
    -- If the item is a core item, and has been moved to the core completely, just skip it and move on
    if item == coreItem and amount == coreAmount then
    else  -- Else put it into the injectors
      transfer(item, amount, input, injectors)
    end
  end

  -- Wait for output
  waitItems(result, recipe.output)

  -- Transfer items to output inventory
  for item, amount in pairs(recipe.output) do
    transfer(item, amount, result, output)
  end

  print(" Done")
end

-- Check if a valid recipe is in the input
local function checkCrafting()
  -- Check all recipes if one is craftable
  for i, recipe in pairs(recipes) do
    -- If we can craft it, we craft it
    if canCraft(recipe) then
      craft(recipe)
      return
    end
  end

  os.sleep(2)
end

-- The fun starts here
local main = thread.create(function()
  printHello()

  print("Ready! Waiting for craftable recipes")
  while true do
    checkCrafting()
  end
end)

local userInputThread = thread.create(function()  
  io.read()
end)

thread.waitForAny({main, userInputThread})
io.write("Program closing\n")
os.exit(0) -- kills all remaining threads