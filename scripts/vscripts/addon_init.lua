print('\n\nLoading Archers modules...')

--[[function Dynamic_Wrap( mt, name )
    if Convars:GetFloat( 'developer' ) == 1 then
        local function w(...) return mt[name](...) end
		return w
    else
        return mt[name]
    end
end]]--

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

-- Load Frota
-- loadModule('lib.json')         -- Json Library
-- loadModule('Archers')        -- Main program
-- require("moondota/moondota")
-- require("moondota/abilities/Archers_tether_proxy")
-- require("moondota/abilities/Archers_construct")

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


--Convars:RegisterCommand("quell", function(args)
--    local h = Convars:GetCommandClient():GetAssignedHero()
--        local firework = CreateItem("item_quelling_blade", h, h)
--        h:AddItem(firework)
--        end, "Fuck", 0)

--Convars:RegisterCommand("nametest2", function(args)
--    local h = Convars:GetCommandClient():GetAssignedHero()
--        print(h:GetUnitName())
--        end, "Fuck", 0)

--Convars:RegisterCommand("invo2", function(args)
--    local h = Convars:GetCommandClient():GetAssignedHero()
--        local firework = CreateHeroForPlayer( "npc_dota_hero_wisp", Convars:GetCommandClient())
--        FindClearSpaceForUnit(firework, h, false)
--        end, "Fuck", 0)

--Convars:RegisterCommand("invo3", function(args)
--    local h = Convars:GetCommandClient():GetAssignedHero()
--        local firework = CreateHeroForPlayer( "npc_dota_hero_invoker", Convars:GetCommandClient())
--        FindClearSpaceForUnit(firework, h, false)
--        end, "Fuck", 0)

UnitsCustomKV = LoadKeyValues("scripts/npc/npc_units_custom.txt")
ItemsCustomKV = LoadKeyValues("scripts/npc/npc_items_custom.txt")