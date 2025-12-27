-- CLIENT-SIDE TELEPORT SCRIPT (LocalPlayer only)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- CHANGE THIS TO THE PLAYER YOU WANT TO TP TO
local TARGET_PLAYER_NAME = "PlayerNameHere"

local function teleportToPlayer(targetName)
    local targetPlayer = Players:FindFirstChild(targetName)
    if not targetPlayer then
        warn("Player not found")
        return
    end

    if not targetPlayer.Character then
        warn("Target has no character")
        return
    end

    local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not targetRoot then
        warn("Target has no HumanoidRootPart")
        return
    end

    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local root = character:WaitForChild("HumanoidRootPart")

    -- Teleport slightly above target
    root.CFrame = targetRoot.CFrame * CFrame.new(0, 0, -3)
end

teleportToPlayer(TARGET_PLAYER_NAME)
