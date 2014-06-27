if ArchersGameMode == nil then
    ArchersGameMode = {}
    ArchersGameMode.__index = ArchersGameMode
end


function ArchersGameMode:new (o)
	o = o or {}
	setmetatable(o, self)
	return o
end

function ArchersGameMode:InitGameMode()
	print(" --- Archers Hello World! --- ")
	ListenToGameEvent('player_connect_full', Dynamic_Wrap(ArchersGameMode,"onPlayerConnect"), self)
end

function ArchersGameMode:onPlayerConnect(keys)
	player = EntIndexToHScript(self.index + 1)
	player:SetTeam(DOTA_TEAM_GOODGUYS)
end