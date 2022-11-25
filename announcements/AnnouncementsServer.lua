-- \ This is a Script inside ServerScriptService

local Request, Execute, mainID, minRank = game.ReplicatedStorage.RequestAnnouncement, game.ReplicatedStorage.ExecuteAnnouncement, 0, 0

-- \ This code wouldn't actually work if you just put it in as the mainID and minRank are blanked out
-- \ Acts as a redirect for announcement requests, also verifies requests

Request.OnServerEvent:Connect(function(plr,header,content,duration)
	if plr:GetRankInGroup(mainID) >= minRank then
		Execute:FireAllClients(header,content,duration)
	end
end)
