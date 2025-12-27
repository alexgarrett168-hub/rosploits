-- Avatar Cloner GUI (Client-Side)
-- Put this LocalScript in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "AvatarClonerGui"
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromScale(0.3, 0.25)
frame.Position = UDim2.fromScale(0.35, 0.35)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Parent = gui

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.fromScale(1, 0.25)
title.BackgroundTransparency = 1
title.Text = "Avatar Cloner"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = frame

local box = Instance.new("TextBox")
box.Size = UDim2.fromScale(0.8, 0.25)
box.Position = UDim2.fromScale(0.1, 0.35)
box.PlaceholderText = "Enter UserId"
box.Text = ""
box.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
box.TextColor3 = Color3.new(1, 1, 1)
box.Font = Enum.Font.Gotham
box.TextScaled = true
box.Parent = frame

local boxCorner = Instance.new("UICorner", box)
boxCorner.CornerRadius = UDim.new(0, 8)

local button = Instance.new("TextButton")
button.Size = UDim2.fromScale(0.6, 0.2)
button.Position = UDim2.fromScale(0.2, 0.7)
button.Text = "Clone Avatar"
button.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.GothamBold
button.TextScaled = true
button.Parent = frame

local btnCorner = Instance.new("UICorner", button)
btnCorner.CornerRadius = UDim.new(0, 8)

-- Avatar cloning logic
button.MouseButton1Click:Connect(function()
	local userId = tonumber(box.Text)
	if not userId then
		button.Text = "Invalid ID"
		task.wait(1)
		button.Text = "Clone Avatar"
		return
	end

	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	local success, description = pcall(function()
		return Players:GetHumanoidDescriptionFromUserId(userId)
	end)

	if success and description then
		humanoid:ApplyDescription(description)
		button.Text = "Cloned!"
	else
		button.Text = "Failed"
	end

	task.wait(1.5)
	button.Text = "Clone Avatar"
end)
