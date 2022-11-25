-- \ This is a LocalScript inside the Frame of a ScreenGui used to select/create the content, header & duration of the announcement

script.Parent.Header.Changed:Connect(function()
	script.Parent.Header.Text = script.Parent.Header.Text:sub(1,46)
	print(script.Parent.Header.Text)
end)

script.Parent.Content.Changed:Connect(function()
	script.Parent.Content.Text = script.Parent.Content.Text:sub(1,110)
	print(script.Parent.Content.Text)
end)

script.Parent.Content.FocusLost:Connect(function()
	script.Parent.Content.Text = script.Parent.Content.Text
end)

script.Parent.Header.FocusLost:Connect(function()
	script.Parent.Header.Text = script.Parent.Header.Text
end)

for i, v in pairs(script.Parent.Folder:GetChildren()) do
	v.MouseButton1Click:Connect(function()
		script.Parent.SelectedTime.Value = tonumber(v.Text)
	end)
end

-- \ Sends a request with the content, header and player info to the server

local event = game.ReplicatedStorage.RequestAnnouncement
local button = script.Parent.TextButton

button.MouseButton1Click:Connect(function()
	local headerToSend = script.Parent.Header.Text
	local contentToSend = script.Parent.Content.Text
	event:FireServer(headerToSend,contentToSend,script.Parent.SelectedTime.Value)
end)
