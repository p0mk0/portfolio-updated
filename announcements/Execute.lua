-- \ This is a LocalScript inside the ScreenGui which contains the brackets and other stuff used in the actual UI animation

local util, Execute = require(game.ReplicatedStorage.ModuleScript), game.ReplicatedStorage.ExecuteAnnouncement

-- \Executes requests verified by the server

Execute.OnClientEvent:Connect(function(header, content, duration)
	-- Add special symbols
	header = ("◈ " .. header .. " ◈")
	
	util:AnnounceFullOpen(script.Parent.BracketLeft,script.Parent.BracketRight,script.Parent.Content,script.Parent.Header,header,content,duration)
end)
