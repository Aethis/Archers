print('\n\nLoading Archers modules...')

-- Module loading system (it reports errors)
local totalErrors = 0
local function loadModule(name)
    local status, err = pcall(function()
        -- Load the module
        require(name)
    end)

    if not status then
        -- Add to the total errors
        totalErrors = totalErrors+1

        -- Tell the user about it
        print('WARNING: '..name..' failed to load!')
        print(err)
    end
end

-- Load Archers
loadModule('lib.json')         -- Json Library
loadModule('Archers')        -- Main program
--require("moondota/moondota")

if totalErrors == 0 then
    -- No loading issues
    print('Loaded Archers modules successfully!\n')
elseif totalErrors == 1 then
    -- One loading error
    print('1 Archers module failed to load!\n')
else
    -- More than one loading error
    print(totalErrors..' Archers modules failed to load!\n')
end

UnitsCustomKV = LoadKeyValues("scripts/npc/npc_units_custom.txt")
ItemsCustomKV = LoadKeyValues("scripts/npc/npc_items_custom.txt")