-- !!  This ModuleScript exists inside of ReplicatedStorage, and is used to better organise code. I'll consider merging this into a different script
-- !!  later, but for now this is good as is.

local util = {}

function util:OpenBracket(LBracket: GuiObject,RBracket: GuiObject)
	LBracket:TweenSize(UDim2.new(0.003,0,0.15,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.4)
	RBracket:TweenSize(UDim2.new(0.003,0,0.15,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.4)
	wait(0.5) 
	LBracket:TweenPosition(UDim2.new(0.3,0,0.1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.4)
	RBracket:TweenPosition(UDim2.new(0.7,0,0.1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.4)
end	

function util:CloseBracket(LBracket: GuiObject,RBracket: GuiObject)
	LBracket:TweenPosition(UDim2.new(0.5,0,0.1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.4)
	RBracket:TweenPosition(UDim2.new(0.5,0,0.1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.4)
	wait(0.5) 
	LBracket:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.4)
	RBracket:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.4)
end

function util:Typewrite(textField: GuiObject, desiredText: string, speed: number)
	local start, finish, step, text
	if desiredText == "" then
		text = textField.Text
		start, finish, step = #text, 0, -1
	else
		text = desiredText
		start, finish, step = 1, #text, 1
	end

	for i = start, finish, step do
		textField.Text = string.sub(text, math.min(start, finish), i)
		task.wait(speed or 0.001)
	end
end

function util:AnnounceFullOpen(LBracket: GuiObject, RBracket: GuiObject, contentField: GuiObject, headerField: GuiObject, header: string, content: string, duration: number)
	local sound = game.ReplicatedStorage["Bell 3"] -- \ Sound used for my example
	sound:Play() 
	
	util:OpenBracket(LBracket,RBracket)
	util:Typewrite(headerField,header)
	util:Typewrite(contentField,content)
	
	wait(duration or 5)
	util:AnnounceFullClose(LBracket,RBracket,contentField,headerField)
end

function util:AnnounceFullClose(LBracket: GuiObject, RBracket: GuiObject, contentField: GuiObject, headerField: GuiObject)
	util:Typewrite(contentField,"")
	util:Typewrite(headerField,"")
	util:CloseBracket(LBracket,RBracket)
end

return util
