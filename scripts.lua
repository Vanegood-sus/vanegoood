local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local scriptsModule = {}

function scriptsModule.load(scriptsFrame, screenGui)
    -- Anti-AFK
    local AntiAfkContainer = Instance.new("Frame")
    AntiAfkContainer.Name = "AntiAfk"
    AntiAfkContainer.Size = UDim2.new(1, -20, 0, 40)
    AntiAfkContainer.Position = UDim2.new(0, 10, 0, 10)
    AntiAfkContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    AntiAfkContainer.BackgroundTransparency = 0.5
    AntiAfkContainer.Parent = scriptsFrame

    local AntiAfkCorner = Instance.new("UICorner")
    AntiAfkCorner.CornerRadius = UDim.new(0, 6)
    AntiAfkCorner.Parent = AntiAfkContainer

    local AntiAfkLabel = Instance.new("TextLabel")
    AntiAfkLabel.Name = "Label"
    AntiAfkLabel.Size = UDim2.new(0, 120, 1, 0)
    AntiAfkLabel.Position = UDim2.new(0, 10, 0, 0)
    AntiAfkLabel.BackgroundTransparency = 1
    AntiAfkLabel.Text = "Anti-AFK"
    AntiAfkLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    AntiAfkLabel.Font = Enum.Font.GothamBold
    AntiAfkLabel.TextSize = 14
    AntiAfkLabel.TextXAlignment = Enum.TextXAlignment.Left
    AntiAfkLabel.Parent = AntiAfkContainer

    local AntiAfkToggleFrame = Instance.new("Frame")
    AntiAfkToggleFrame.Name = "ToggleFrame"
    AntiAfkToggleFrame.Size = UDim2.new(0, 50, 0, 25)
    AntiAfkToggleFrame.Position = UDim2.new(1, -60, 0.5, -12)
    AntiAfkToggleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    AntiAfkToggleFrame.Parent = AntiAfkContainer

    local AntiAfkToggleCorner = Instance.new("UICorner")
    AntiAfkToggleCorner.CornerRadius = UDim.new(1, 0)
    AntiAfkToggleCorner.Parent = AntiAfkToggleFrame

    local AntiAfkToggleButton = Instance.new("TextButton")
    AntiAfkToggleButton.Name = "ToggleButton"
    AntiAfkToggleButton.Size = UDim2.new(0, 21, 0, 21)
    AntiAfkToggleButton.Position = UDim2.new(0, 2, 0.5, -10)
    AntiAfkToggleButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    AntiAfkToggleButton.Text = ""
    AntiAfkToggleButton.Parent = AntiAfkToggleFrame

    local AntiAfkButtonCorner = Instance.new("UICorner")
    AntiAfkButtonCorner.CornerRadius = UDim.new(1, 0)
    AntiAfkButtonCorner.Parent = AntiAfkToggleButton

    local afkEnabled = false
    local virtualUser = game:service('VirtualUser')

    local function updateAfkToggle()
        local goal = {
            Position = afkEnabled and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 2, 0.5, -10),
            BackgroundColor3 = afkEnabled and Color3.fromRGB(0, 230, 100) or Color3.fromRGB(220, 220, 220)
        }
        AntiAfkToggleFrame.BackgroundColor3 = afkEnabled and Color3.fromRGB(0, 60, 30) or Color3.fromRGB(50, 50, 60)
        local tween = TweenService:Create(AntiAfkToggleButton, TweenInfo.new(0.2), goal)
        tween:Play()
    end

    AntiAfkToggleButton.MouseButton1Click:Connect(function()
        afkEnabled = not afkEnabled
        updateAfkToggle()
    end)

    Players.LocalPlayer.Idled:Connect(function()
        if afkEnabled then
            virtualUser:CaptureController()
            virtualUser:ClickButton2(Vector2.new())
        end
    end)

    updateAfkToggle()

    -- ESP
    local EspContainer = Instance.new("Frame")
    EspContainer.Name = "ESPSettings"
    EspContainer.Size = UDim2.new(1, -20, 0, 40)
    EspContainer.Position = UDim2.new(0, 10, 0, 60)
    EspContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    EspContainer.BackgroundTransparency = 0.5
    EspContainer.Parent = scriptsFrame

    local EspCorner = Instance.new("UICorner")
    EspCorner.CornerRadius = UDim.new(0, 6)
    EspCorner.Parent = EspContainer

    local EspLabel = Instance.new("TextLabel")
    EspLabel.Name = "Label"
    EspLabel.Size = UDim2.new(0, 120, 1, 0)
    EspLabel.Position = UDim2.new(0, 10, 0, 0)
    EspLabel.BackgroundTransparency = 1
    EspLabel.Text = "ESP"
    EspLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    EspLabel.Font = Enum.Font.GothamBold
    EspLabel.TextSize = 14
    EspLabel.TextXAlignment = Enum.TextXAlignment.Left
    EspLabel.Parent = EspContainer

    local EspToggleFrame = Instance.new("Frame")
    EspToggleFrame.Name = "ToggleFrame"
    EspToggleFrame.Size = UDim2.new(0, 50, 0, 25)
    EspToggleFrame.Position = UDim2.new(1, -60, 0.5, -12)
    EspToggleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    EspToggleFrame.Parent = EspContainer

    local EspToggleCorner = Instance.new("UICorner")
    EspToggleCorner.CornerRadius = UDim.new(1, 0)
    EspToggleCorner.Parent = EspToggleFrame

    local EspToggleButton = Instance.new("TextButton")
    EspToggleButton.Name = "ToggleButton"
    EspToggleButton.Size = UDim2.new(0, 21, 0, 21)
    EspToggleButton.Position = UDim2.new(0, 2, 0.5, -10)
    EspToggleButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    EspToggleButton.Text = ""
    EspToggleButton.Parent = EspToggleFrame

    local EspButtonCorner = Instance.new("UICorner")
    EspButtonCorner.CornerRadius = UDim.new(1, 0)
    EspButtonCorner.Parent = EspToggleButton

    local espEnabled = false
    local espObjects = {}
    local lastUpdate = 0
    local updateInterval = 0.2

    local function updateEspToggle()
        local goal = {
            Position = espEnabled and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 2, 0.5, -10),
            BackgroundColor3 = espEnabled and Color3.fromRGB(0, 230, 100) or Color3.fromRGB(220, 220, 220)
        }
        EspToggleFrame.BackgroundColor3 = espEnabled and Color3.fromRGB(0, 60, 30) or Color3.fromRGB(50, 50, 60)
        local tween = TweenService:Create(EspToggleButton, TweenInfo.new(0.2), goal)
        tween:Play()
    end

    local function clearESP()
        for _, obj in pairs(espObjects) do
            if obj.highlight then obj.highlight:Destroy() end
            if obj.label then obj.label:Destroy() end
        end
        espObjects = {}
    end

    local function isEnemy(player)
        if player:FindFirstChild("Team") and player.Team.Name:lower():find("killer") then
            return true
        end
        if player.Team and LocalPlayer.Team then
            return player.Team ~= LocalPlayer.Team
        end
        if player.Character then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            local tool = player.Character:FindFirstChildOfClass("Tool")
            if tool or (humanoid and humanoid:GetAttribute("CanAttack") == true) then
                return true
            end
        end
        return false
    end

    local function isAlly(player)
        if player.Team and LocalPlayer.Team then
            return player.Team == LocalPlayer.Team
        end
        return false
    end

    local function updateESP()
        if not espEnabled then return end
        local currentTime = os.clock()
        if currentTime - lastUpdate < updateInterval then return end
        lastUpdate = currentTime

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                local humanoid = player.Character:FindFirstChild("Humanoid")
                if rootPart and humanoid and humanoid.Health > 0 then
                    local enemy = isEnemy(player)
                    local ally = isAlly(player)
                    if not espObjects[player] then
                        espObjects[player] = {}
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "ESPHighlight"
                        highlight.Adornee = player.Character
                        highlight.FillTransparency = 0.85
                        highlight.OutlineTransparency = 0
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.Parent = player.Character

                        local label = Instance.new("TextLabel")
                        label.Name = "ESPLabel"
                        label.BackgroundTransparency = 1
                        label.TextColor3 = Color3.new(1, 1, 1)
                        label.Font = Enum.Font.Gotham
                        label.TextSize = 12
                        label.TextStrokeTransparency = 0.7
                        label.TextStrokeColor3 = Color3.new(0, 0, 0)
                        label.Parent = screenGui

                        espObjects[player] = {highlight = highlight, label = label}
                    end

                    local espData = espObjects[player]
                    if enemy then
                        espData.highlight.FillColor = Color3.fromRGB(255, 70, 70)
                        espData.highlight.OutlineColor = Color3.fromRGB(180, 0, 0)
                    elseif ally then
                        espData.highlight.FillColor = Color3.fromRGB(70, 255, 70)
                        espData.highlight.OutlineColor = Color3.fromRGB(0, 180, 0)
                    else
                        espData.highlight.FillColor = Color3.fromRGB(70, 70, 255)
                        espData.highlight.OutlineColor = Color3.fromRGB(0, 0, 180)
                    end

                    local screenPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
                    if onScreen then
                        local distance = (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") 
                            and (rootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude or 0)
                        espData.label.Text = string.format("%s [%d]", player.Name, math.floor(distance))
                        espData.label.Position = UDim2.new(0, screenPos.X, 0, screenPos.Y - 35)
                        espData.label.Visible = true
                    else
                        espData.label.Visible = false
                    end
                else
                    if espObjects[player] then
                        if espObjects[player].highlight then espObjects[player].highlight:Destroy() end
                        if espObjects[player].label then espObjects[player].label:Destroy() end
                        espObjects[player] = nil
                    end
                end
            else
                if espObjects[player] then
                    if espObjects[player].highlight then espObjects[player].highlight:Destroy() end
                    if espObjects[player].label then espObjects[player].label:Destroy() end
                    espObjects[player] = nil
                end
            end
        end
    end

    EspToggleButton.MouseButton1Click:Connect(function()
        espEnabled = not espEnabled
        updateEspToggle()
        if not espEnabled then clearESP() end
    end)

    Players.PlayerRemoving:Connect(function(player)
        if espObjects[player] then
            if espObjects[player].highlight then espObjects[player].highlight:Destroy() end
            if espObjects[player].label then espObjects[player].label:Destroy() end
            espObjects[player] = nil
        end
    end)

    RunService.Heartbeat:Connect(updateESP)

    updateEspToggle()
end

return scriptsModule

-- scripts.lua
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local scriptsModule = {}

function scriptsModule.load(scriptsFrame)
    -- HitBox UI container
    _G.Size = 20
    _G.Disabled = false

    local HitBoxContainer = Instance.new("Frame")
    HitBoxContainer.Name = "HitBoxSettings"
    HitBoxContainer.Size = UDim2.new(1, -20, 0, 40)
    HitBoxContainer.Position = UDim2.new(0, 10, 0, 110)
    HitBoxContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    HitBoxContainer.BackgroundTransparency = 0.5
    HitBoxContainer.Parent = scriptsFrame

    local HitBoxCorner = Instance.new("UICorner")
    HitBoxCorner.CornerRadius = UDim.new(0, 6)
    HitBoxCorner.Parent = HitBoxContainer

    local HitBoxLabel = Instance.new("TextLabel")
    HitBoxLabel.Name = "Label"
    HitBoxLabel.Size = UDim2.new(0, 120, 1, 0)
    HitBoxLabel.Position = UDim2.new(0, 10, 0, 0)
    HitBoxLabel.BackgroundTransparency = 1
    HitBoxLabel.Text = "HitBox"
    HitBoxLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    HitBoxLabel.Font = Enum.Font.GothamBold
    HitBoxLabel.TextSize = 14
    HitBoxLabel.TextXAlignment = Enum.TextXAlignment.Left
    HitBoxLabel.Parent = HitBoxContainer

    local ControlContainer = Instance.new("Frame")
    ControlContainer.Size = UDim2.new(0, 150, 0, 25)
    ControlContainer.Position = UDim2.new(1, -110, 0.5, -12)
    ControlContainer.BackgroundTransparency = 1
    ControlContainer.Parent = HitBoxContainer

    local SizeInput = Instance.new("TextBox")
    SizeInput.Name = "SizeInput"
    SizeInput.Size = UDim2.new(0, 40, 1, 0)
    SizeInput.Position = UDim2.new(0, 0, 0, 0)
    SizeInput.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    SizeInput.TextColor3 = Color3.new(1, 1, 1)
    SizeInput.Font = Enum.Font.Gotham
    SizeInput.TextSize = 14
    SizeInput.Text = tostring(_G.Size)
    SizeInput.Parent = ControlContainer

    local HitBoxToggleFrame = Instance.new("Frame")
    HitBoxToggleFrame.Name = "ToggleFrame"
    HitBoxToggleFrame.Size = UDim2.new(0, 50, 0, 25)
    HitBoxToggleFrame.Position = UDim2.new(0, 50, 0, 0)
    HitBoxToggleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    HitBoxToggleFrame.Parent = ControlContainer

    local HitBoxToggleCorner = Instance.new("UICorner")
    HitBoxToggleCorner.CornerRadius = UDim.new(1, 0)
    HitBoxToggleCorner.Parent = HitBoxToggleFrame

    local HitBoxToggleButton = Instance.new("TextButton")
    HitBoxToggleButton.Name = "ToggleButton"
    HitBoxToggleButton.Size = UDim2.new(0, 21, 0, 21)
    HitBoxToggleButton.Position = UDim2.new(0, 2, 0.5, -10)
    HitBoxToggleButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    HitBoxToggleButton.Text = ""
    HitBoxToggleButton.Parent = HitBoxToggleFrame

    local HitBoxButtonCorner = Instance.new("UICorner")
    HitBoxButtonCorner.CornerRadius = UDim.new(1, 0)
    HitBoxButtonCorner.Parent = HitBoxToggleButton

    local function updateHitBoxToggle()
        local goal = {
            Position = _G.Disabled and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 2, 0.5, -10),
            BackgroundColor3 = _G.Disabled and Color3.fromRGB(0, 230, 100) or Color3.fromRGB(220, 220, 220)
        }

        HitBoxToggleFrame.BackgroundColor3 = _G.Disabled and Color3.fromRGB(0, 60, 30) or Color3.fromRGB(50, 50, 60)
        local tween = TweenService:Create(HitBoxToggleButton, TweenInfo.new(0.2), goal)
        tween:Play()
    end

    local function resetHitboxes()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    rootPart.Size = Vector3.new(2, 2, 1)
                    rootPart.Transparency = 0
                    rootPart.BrickColor = BrickColor.new("Medium stone grey")
                    rootPart.Material = "Plastic"
                    rootPart.CanCollide = true
                end
            end
        end
    end

    SizeInput.FocusLost:Connect(function()
        local num = tonumber(SizeInput.Text)
        if num and num >= 1 and num <= 100 then
            _G.Size = num
        else
            SizeInput.Text = tostring(_G.Size)
        end
    end)

    HitBoxToggleButton.MouseButton1Click:Connect(function()
        _G.Disabled = not _G.Disabled
        updateHitBoxToggle()
        if not _G.Disabled then
            resetHitboxes()
        end
    end)

    RunService.RenderStepped:Connect(function()
        if _G.Disabled then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    pcall(function()
                        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            rootPart.Size = Vector3.new(_G.Size, _G.Size, _G.Size)
                            rootPart.Transparency = 0.7
                            rootPart.BrickColor = BrickColor.new("Really red")
                            rootPart.Material = "Neon"
                            rootPart.CanCollide = false
                        end
                    end)
                end
            end
        end
    end)

    Players.PlayerRemoving:Connect(function(player)
        if player.Character then
            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.Size = Vector3.new(2, 2, 1)
                rootPart.Transparency = 0
                rootPart.BrickColor = BrickColor.new("Medium stone grey")
                rootPart.Material = "Plastic"
                rootPart.CanCollide = true
            end
        end
    end)

    updateHitBoxToggle()
end

return scriptsModule

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local scriptsModule = {}

function scriptsModule.load(scriptsFrame)
    -- Fly UI container
    local FlyContainer = Instance.new("Frame")
    FlyContainer.Name = "FlySettings"
    FlyContainer.Size = UDim2.new(1, -20, 0, 40)
    FlyContainer.Position = UDim2.new(0, 10, 0, 160) -- Ниже HitBox
    FlyContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    FlyContainer.BackgroundTransparency = 0.5
    FlyContainer.Parent = scriptsFrame

    local FlyCorner = Instance.new("UICorner")
    FlyCorner.CornerRadius = UDim.new(0, 6)
    FlyCorner.Parent = FlyContainer

    local FlyLabel = Instance.new("TextLabel")
    FlyLabel.Name = "Label"
    FlyLabel.Size = UDim2.new(0, 120, 1, 0)
    FlyLabel.Position = UDim2.new(0, 10, 0, 0)
    FlyLabel.BackgroundTransparency = 1
    FlyLabel.Text = "Fly"
    FlyLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    FlyLabel.Font = Enum.Font.GothamBold
    FlyLabel.TextSize = 14
    FlyLabel.TextXAlignment = Enum.TextXAlignment.Left
    FlyLabel.Parent = FlyContainer

    local FlyControlContainer = Instance.new("Frame")
    FlyControlContainer.Size = UDim2.new(0, 150, 0, 25)
    FlyControlContainer.Position = UDim2.new(1, -110, 0.5, -12)
    FlyControlContainer.BackgroundTransparency = 1
    FlyControlContainer.Parent = FlyContainer

    local FlySpeedInput = Instance.new("TextBox")
    FlySpeedInput.Name = "SpeedInput"
    FlySpeedInput.Size = UDim2.new(0, 40, 1, 0)
    FlySpeedInput.Position = UDim2.new(0, 0, 0, 0)
    FlySpeedInput.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    FlySpeedInput.TextColor3 = Color3.new(1, 1, 1)
    FlySpeedInput.Font = Enum.Font.Gotham
    FlySpeedInput.TextSize = 14
    FlySpeedInput.Text = "50"
    FlySpeedInput.Parent = FlyControlContainer

    local FlyToggleFrame = Instance.new("Frame")
    FlyToggleFrame.Name = "ToggleFrame"
    FlyToggleFrame.Size = UDim2.new(0, 50, 0, 25)
    FlyToggleFrame.Position = UDim2.new(0, 50, 0, 0)
    FlyToggleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    FlyToggleFrame.Parent = FlyControlContainer

    local FlyToggleCorner = Instance.new("UICorner")
    FlyToggleCorner.CornerRadius = UDim.new(1, 0)
    FlyToggleCorner.Parent = FlyToggleFrame

    local FlyToggleButton = Instance.new("TextButton")
    FlyToggleButton.Name = "ToggleButton"
    FlyToggleButton.Size = UDim2.new(0, 21, 0, 21)
    FlyToggleButton.Position = UDim2.new(0, 2, 0.5, -10)
    FlyToggleButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    FlyToggleButton.Text = ""
    FlyToggleButton.Parent = FlyToggleFrame

    local FlyButtonCorner = Instance.new("UICorner")
    FlyButtonCorner.CornerRadius = UDim.new(1, 0)
    FlyButtonCorner.Parent = FlyToggleButton

    -- Fly logic
    local flyEnabled = false
    local flySpeed = 50
    local bv, bg
    local flyConnections = {}

    local function updateFlyToggle()
        local goal = {
            Position = flyEnabled and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 2, 0.5, -10),
            BackgroundColor3 = flyEnabled and Color3.fromRGB(0, 230, 100) or Color3.fromRGB(220, 220, 220)
        }

        FlyToggleFrame.BackgroundColor3 = flyEnabled and Color3.fromRGB(0, 60, 30) or Color3.fromRGB(50, 50, 60)

        local tween = TweenService:Create(FlyToggleButton, TweenInfo.new(0.2), goal)
        tween:Play()
    end

    local function setupCharacter(character)
        if flyEnabled then
            if character:FindFirstChild("HumanoidRootPart") then
                if character.HumanoidRootPart:FindFirstChild("VelocityHandler") then
                    character.HumanoidRootPart.VelocityHandler:Destroy()
                end
                if character.HumanoidRootPart:FindFirstChild("GyroHandler") then
                    character.HumanoidRootPart.GyroHandler:Destroy()
                end

                bv = Instance.new("BodyVelocity")
                bv.Name = "VelocityHandler"
                bv.Parent = character.HumanoidRootPart
                bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                bv.Velocity = Vector3.new(0,0,0)

                bg = Instance.new("BodyGyro")
                bg.Name = "GyroHandler"
                bg.Parent = character.HumanoidRootPart
                bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                bg.P = 1000
                bg.D = 50

                character.Humanoid.PlatformStand = true
            end
        end
    end

    local function disableFly()
        flyEnabled = false
        updateFlyToggle()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.PlatformStand = false
            if LocalPlayer.Character.HumanoidRootPart then
                if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") then
                    LocalPlayer.Character.HumanoidRootPart.VelocityHandler:Destroy()
                end
                if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then
                    LocalPlayer.Character.HumanoidRootPart.GyroHandler:Destroy()
                end
            end
        end

        for _, connection in pairs(flyConnections) do
            connection:Disconnect()
        end
        flyConnections = {}
    end

    local function enableFly()
        flyEnabled = true
        updateFlyToggle()

        if #flyConnections == 0 then
            table.insert(flyConnections, LocalPlayer.CharacterAdded:Connect(function(character)
                setupCharacter(character)

                character:WaitForChild("Humanoid").Died:Connect(function()
                    if flyEnabled then
                        task.wait()
                        if LocalPlayer.Character then
                            setupCharacter(LocalPlayer.Character)
                        end
                    end
                end)
            end))

            table.insert(flyConnections, RunService.RenderStepped:Connect(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and
                    LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                    LocalPlayer.Character.HumanoidRootPart:FindFirstChild("VelocityHandler") and
                    LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GyroHandler") then

                    if flyEnabled then
                        LocalPlayer.Character.HumanoidRootPart.VelocityHandler.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                        LocalPlayer.Character.HumanoidRootPart.GyroHandler.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                        LocalPlayer.Character.Humanoid.PlatformStand = true

                        local camera = workspace.CurrentCamera
                        LocalPlayer.Character.HumanoidRootPart.GyroHandler.CFrame = camera.CFrame

                        local controlModule = require(LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
                        local direction = controlModule:GetMoveVector()
                        LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity = Vector3.new()

                        if direction.X ~= 0 then
                            LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity += camera.CFrame.RightVector * (direction.X * flySpeed)
                        end
                        if direction.Z ~= 0 then
                            LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity -= camera.CFrame.LookVector * (direction.Z * flySpeed)
                        end
                    end
                end
            end))

            table.insert(flyConnections, FlySpeedInput:GetPropertyChangedSignal("Text"):Connect(function()
                local val = tonumber(FlySpeedInput.Text)
                if val then
                    flySpeed = val
                end
            end))
        end

        if LocalPlayer.Character then
            setupCharacter(LocalPlayer.Character)
        end
    end

    FlyToggleButton.MouseButton1Click:Connect(function()
        if flyEnabled then
            disableFly()
        else
            enableFly()
        end
    end)

    FlySpeedInput.FocusLost:Connect(function()
        local num = tonumber(FlySpeedInput.Text)
        if num and num >= 1 and num <= 500 then
            flySpeed = num
        else
            FlySpeedInput.Text = tostring(flySpeed)
        end
    end)

    Players.PlayerRemoving:Connect(function(player)
        if player == LocalPlayer then
            disableFly()
        end
    end)

    updateFlyToggle()
end

return scriptsModule

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local scriptsModule = {}

function scriptsModule.load(scriptsFrame)
    -- Speed UI container
    local SpeedContainer = Instance.new("Frame")
    SpeedContainer.Name = "SpeedSettings"
    SpeedContainer.Size = UDim2.new(1, -20, 0, 40)
    SpeedContainer.Position = UDim2.new(0, 10, 0, 260) -- Ниже Fly
    SpeedContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    SpeedContainer.BackgroundTransparency = 0.5
    SpeedContainer.Parent = scriptsFrame

    local SpeedCorner = Instance.new("UICorner")
    SpeedCorner.CornerRadius = UDim.new(0, 6)
    SpeedCorner.Parent = SpeedContainer

    local SpeedLabel = Instance.new("TextLabel")
    SpeedLabel.Name = "Label"
    SpeedLabel.Size = UDim2.new(0, 120, 1, 0)
    SpeedLabel.Position = UDim2.new(0, 10, 0, 0)
    SpeedLabel.BackgroundTransparency = 1
    SpeedLabel.Text = "Speed"
    SpeedLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    SpeedLabel.Font = Enum.Font.GothamBold
    SpeedLabel.TextSize = 14
    SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
    SpeedLabel.Parent = SpeedContainer

    local SpeedControlContainer = Instance.new("Frame")
    SpeedControlContainer.Size = UDim2.new(0, 150, 0, 25)
    SpeedControlContainer.Position = UDim2.new(1, -110, 0.5, -12)
    SpeedControlContainer.BackgroundTransparency = 1
    SpeedControlContainer.Parent = SpeedContainer

    local SpeedValueInput = Instance.new("TextBox")
    SpeedValueInput.Name = "SpeedInput"
    SpeedValueInput.Size = UDim2.new(0, 40, 1, 0)
    SpeedValueInput.Position = UDim2.new(0, 0, 0, 0)
    SpeedValueInput.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    SpeedValueInput.TextColor3 = Color3.new(1, 1, 1)
    SpeedValueInput.Font = Enum.Font.Gotham
    SpeedValueInput.TextSize = 14
    SpeedValueInput.Text = "16"
    SpeedValueInput.Parent = SpeedControlContainer

    local SpeedToggleFrame = Instance.new("Frame")
    SpeedToggleFrame.Name = "ToggleFrame"
    SpeedToggleFrame.Size = UDim2.new(0, 50, 0, 25)
    SpeedToggleFrame.Position = UDim2.new(0, 50, 0, 0)
    SpeedToggleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    SpeedToggleFrame.Parent = SpeedControlContainer

    local SpeedToggleCorner = Instance.new("UICorner")
    SpeedToggleCorner.CornerRadius = UDim.new(1, 0)
    SpeedToggleCorner.Parent = SpeedToggleFrame

    local SpeedToggleButton = Instance.new("TextButton")
    SpeedToggleButton.Name = "ToggleButton"
    SpeedToggleButton.Size = UDim2.new(0, 21, 0, 21)
    SpeedToggleButton.Position = UDim2.new(0, 2, 0.5, -10)
    SpeedToggleButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    SpeedToggleButton.Text = ""
    SpeedToggleButton.Parent = SpeedToggleFrame

    local SpeedButtonCorner = Instance.new("UICorner")
    SpeedButtonCorner.CornerRadius = UDim.new(1, 0)
    SpeedButtonCorner.Parent = SpeedToggleButton

    local speedEnabled = false
    local currentSpeed = 16
    local speedConnection = nil

    local function updateSpeedToggle()
        local goal = {
            Position = speedEnabled and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 2, 0.5, -10),
            BackgroundColor3 = speedEnabled and Color3.fromRGB(0, 230, 100) or Color3.fromRGB(220, 220, 220)
        }
        SpeedToggleFrame.BackgroundColor3 = speedEnabled and Color3.fromRGB(0, 60, 30) or Color3.fromRGB(50, 50, 60)
        TweenService:Create(SpeedToggleButton, TweenInfo.new(0.2), goal):Play()
    end

    local function setCharacterSpeed(character, speed)
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.WalkSpeed = speed
        end
    end

    local function enableSpeed()
        speedEnabled = true
        updateSpeedToggle()

        if not speedConnection then
            speedConnection = RunService.Heartbeat:Connect(function()
                if speedEnabled and LocalPlayer.Character then
                    setCharacterSpeed(LocalPlayer.Character, currentSpeed)
                end
            end)
        end

        if LocalPlayer.Character then
            setCharacterSpeed(LocalPlayer.Character, currentSpeed)
        end
    end

    local function disableSpeed()
        speedEnabled = false
        updateSpeedToggle()

        if speedConnection then
            speedConnection:Disconnect()
            speedConnection = nil
        end

        if LocalPlayer.Character then
            setCharacterSpeed(LocalPlayer.Character, 16)
        end
    end

    SpeedToggleButton.MouseButton1Click:Connect(function()
        if speedEnabled then
            disableSpeed()
        else
            enableSpeed()
        end
    end)

    SpeedValueInput.FocusLost:Connect(function()
        local num = tonumber(SpeedValueInput.Text)
        if num and num >= 16 and num <= 500 then
            currentSpeed = num
            if speedEnabled and LocalPlayer.Character then
                setCharacterSpeed(LocalPlayer.Character, currentSpeed)
            end
        else
            SpeedValueInput.Text = tostring(currentSpeed)
        end
    end)

    LocalPlayer.CharacterAdded:Connect(function(character)
        if speedEnabled then
            setCharacterSpeed(character, currentSpeed)
        end
    end)

    Players.PlayerRemoving:Connect(function(player)
        if player == LocalPlayer then
            disableSpeed()
        end
    end)

    updateSpeedToggle()
end

return scriptsModule

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local scriptsModule = {}

function scriptsModule.load(scriptsFrame)
-- InfJump UI container
local InfJumpContainer = Instance.new("Frame")
InfJumpContainer.Name = "InfJump"
InfJumpContainer.Size = UDim2.new(1, -20, 0, 40)
InfJumpContainer.Position = UDim2.new(0, 10, 0, 210) -- Ниже Fly
InfJumpContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
InfJumpContainer.BackgroundTransparency = 0.5
InfJumpContainer.Parent = scriptsFrame

text
local InfJumpCorner = Instance.new("UICorner")
InfJumpCorner.CornerRadius = UDim.new(0, 6)
InfJumpCorner.Parent = InfJumpContainer

local InfJumpLabel = Instance.new("TextLabel")
InfJumpLabel.Name = "Label"
InfJumpLabel.Size = UDim2.new(0, 120, 1, 0)
InfJumpLabel.Position = UDim2.new(0, 10, 0, 0)
InfJumpLabel.BackgroundTransparency = 1
InfJumpLabel.Text = "Inf Jump"
InfJumpLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
InfJumpLabel.Font = Enum.Font.GothamBold
InfJumpLabel.TextSize = 14
InfJumpLabel.TextXAlignment = Enum.TextXAlignment.Left
InfJumpLabel.Parent = InfJumpContainer

local InfJumpToggleFrame = Instance.new("Frame")
InfJumpToggleFrame.Name = "ToggleFrame"
InfJumpToggleFrame.Size = UDim2.new(0, 50, 0, 25)
InfJumpToggleFrame.Position = UDim2.new(1, -60, 0.5, -12)
InfJumpToggleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
InfJumpToggleFrame.Parent = InfJumpContainer

local InfJumpToggleCorner = Instance.new("UICorner")
InfJumpToggleCorner.CornerRadius = UDim.new(1, 0)
InfJumpToggleCorner.Parent = InfJumpToggleFrame

local InfJumpToggleButton = Instance.new("TextButton")
InfJumpToggleButton.Name = "ToggleButton"
InfJumpToggleButton.Size = UDim2.new(0, 21, 0, 21)
InfJumpToggleButton.Position = UDim2.new(0, 2, 0.5, -10)
InfJumpToggleButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
InfJumpToggleButton.Text = ""
InfJumpToggleButton.Parent = InfJumpToggleFrame

local InfJumpButtonCorner = Instance.new("UICorner")
InfJumpButtonCorner.CornerRadius = UDim.new(1, 0)
InfJumpButtonCorner.Parent = InfJumpToggleButton

-- InfJump logic
local infJumpEnabled = false
local infJumpConnection = nil

local function updateInfJumpToggle()
    local goal = {
        Position = infJumpEnabled and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 2, 0.5, -10),
        BackgroundColor3 = infJumpEnabled and Color3.fromRGB(0, 230, 100) or Color3.fromRGB(220, 220, 220)
    }
    InfJumpToggleFrame.BackgroundColor3 = infJumpEnabled and Color3.fromRGB(0, 60, 30) or Color3.fromRGB(50, 50, 60)
    TweenService:Create(InfJumpToggleButton, TweenInfo.new(0.2), goal):Play()
end

local function enableInfJump()
    infJumpEnabled = true
    updateInfJumpToggle()

    infJumpConnection = UserInputService.JumpRequest:Connect(function()
        if infJumpEnabled and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
end

local function disableInfJump()
    infJumpEnabled = false
    updateInfJumpToggle()

    if infJumpConnection then
        infJumpConnection:Disconnect()
        infJumpConnection = nil
    end
end

InfJumpToggleButton.MouseButton1Click:Connect(function()
    if infJumpEnabled then
        disableInfJump()
    else
        enableInfJump()
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if player == LocalPlayer then
        disableInfJump()
    end
end)

updateInfJumpToggle()
end

return scriptsModule

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local SpectateContainer = Instance.new("Frame")
SpectateContainer.Name = "SpectateSettings"
SpectateContainer.Size = UDim2.new(1, -20, 0, 40)
SpectateContainer.Position = UDim2.new(0, 10, 0, 610)
SpectateContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
SpectateContainer.BackgroundTransparency = 0.5
SpectateContainer.Parent = ScriptsFrame

local SpectateCorner = Instance.new("UICorner")
SpectateCorner.CornerRadius = UDim.new(0, 6)
SpectateCorner.Parent = SpectateContainer

local SpectateLabel = Instance.new("TextLabel")
SpectateLabel.Name = "Label"
SpectateLabel.Size = UDim2.new(0, 120, 1, 0)
SpectateLabel.Position = UDim2.new(0, 10, 0, 0)
SpectateLabel.BackgroundTransparency = 1
SpectateLabel.Text = "Spectate"
SpectateLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
SpectateLabel.Font = Enum.Font.GothamBold
SpectateLabel.TextSize = 14
SpectateLabel.TextXAlignment = Enum.TextXAlignment.Left
SpectateLabel.Parent = SpectateContainer

local SpectateToggleButton = Instance.new("TextButton")
SpectateToggleButton.Name = "SpectateToggle"
SpectateToggleButton.Size = UDim2.new(0, 120, 0, 25)
SpectateToggleButton.Position = UDim2.new(1, -130, 0.5, -12)
SpectateToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
SpectateToggleButton.Text = "Select ▷"
SpectateToggleButton.TextColor3 = Color3.fromRGB(220, 220, 220)
SpectateToggleButton.Font = Enum.Font.Gotham
SpectateToggleButton.TextSize = 12
SpectateToggleButton.Parent = SpectateContainer

local SpectateButtonCorner = Instance.new("UICorner")
SpectateButtonCorner.CornerRadius = UDim.new(0, 4)
SpectateButtonCorner.Parent = SpectateToggleButton

local PlayersSideMenu = Instance.new("Frame")
PlayersSideMenu.Name = "PlayersSideMenu"
PlayersSideMenu.Size = UDim2.new(0, 150, 0, 0)
PlayersSideMenu.Position = UDim2.new(0, SpectateContainer.AbsolutePosition.X + SpectateContainer.AbsoluteSize.X + 5, 0, SpectateContainer.AbsolutePosition.Y - 110)
PlayersSideMenu.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
PlayersSideMenu.BorderSizePixel = 0
PlayersSideMenu.Visible = false
PlayersSideMenu.ClipsDescendants = true
PlayersSideMenu.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = PlayersSideMenu

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(80, 80, 80)
UIStroke.Thickness = 1
UIStroke.Parent = PlayersSideMenu

local PlayersList = Instance.new("ScrollingFrame")
PlayersList.Size = UDim2.new(1, -5, 1, -5)
PlayersList.Position = UDim2.new(0, 5, 0, 5)
PlayersList.BackgroundTransparency = 1
PlayersList.ScrollBarThickness = 3
PlayersList.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
PlayersList.Parent = PlayersSideMenu

local PlayersListLayout = Instance.new("UIListLayout")
PlayersListLayout.Padding = UDim.new(0, 5)
PlayersListLayout.Parent = PlayersList

PlayersListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
PlayersList.CanvasSize = UDim2.new(0, 0, 0, PlayersListLayout.AbsoluteContentSize.Y)
PlayersSideMenu.Size = UDim2.new(0, 150, 0, math.min(PlayersListLayout.AbsoluteContentSize.Y + 10, 300))
end)

local function updateMenuPosition()
PlayersSideMenu.Position = UDim2.new(
0, SpectateContainer.AbsolutePosition.X + SpectateContainer.AbsoluteSize.X + 5,
0, SpectateContainer.AbsolutePosition.Y - 110
)
end

SpectateContainer:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateMenuPosition)
SpectateContainer:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateMenuPosition)

local currentSubject = nil

local function spectatePlayer(player)
if player.Character and player.Character:FindFirstChild("Humanoid") then
currentSubject = player
workspace.CurrentCamera.CameraSubject = player.Character.Humanoid
return true
end
return false
end

local function stopSpectating()
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
currentSubject = nil
workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
end
end

local function createPlayerButton(player)
local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -10, 0, 30)
button.Position = UDim2.new(0, 5, 0, 0)
button.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
button.TextColor3 = Color3.fromRGB(220, 220, 220)
button.Font = Enum.Font.Gotham
button.TextSize = 12
button.Text = player.Name
button.TextXAlignment = Enum.TextXAlignment.Left
button.Parent = PlayersList

text
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 4)
buttonCorner.Parent = button

local spectateButton = Instance.new("TextButton")
spectateButton.Size = UDim2.new(0.4, -5, 0.8, 0)
spectateButton.Position = UDim2.new(0.6, 5, 0.1, 0)
spectateButton.BackgroundColor3 = Color3.fromRGB(65, 65, 80)
spectateButton.TextColor3 = Color3.fromRGB(220, 220, 220)
spectateButton.Font = Enum.Font.Gotham
spectateButton.TextSize = 10
spectateButton.Text = "Spectate"
spectateButton.Parent = button

local spectateCorner = Instance.new("UICorner")
spectateCorner.CornerRadius = UDim.new(0, 4)
spectateCorner.Parent = spectateButton

local function updateButtonState()
    if currentSubject == player then
        spectateButton.Text = "Stop"
        spectateButton.BackgroundColor3 = Color3.fromRGB(80, 40, 40)
    else
        spectateButton.Text = "Spectate"
        spectateButton.BackgroundColor3 = Color3.fromRGB(65, 65, 80)
    end
end

spectateButton.MouseButton1Click:Connect(function()
    if currentSubject == player then
        stopSpectating()
    else
        spectatePlayer(player)
    end
    updateButtonState()
end)

button.MouseButton1Click:Connect(function()
    if currentSubject ~= player then
        spectatePlayer(player)
        updateButtonState()
    end
end)

button.MouseEnter:Connect(function()
    TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 95)}):Play()
end)

button.MouseLeave:Connect(function()
    TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 75)}):Play()
end)

return button
end

local isMenuOpen = false
SpectateToggleButton.MouseButton1Click:Connect(function()
isMenuOpen = not isMenuOpen

text
if isMenuOpen then
    SpectateToggleButton.Text = "Select ◁"
    updateMenuPosition()
    PlayersSideMenu.Visible = true
else
    SpectateToggleButton.Text = "Select ▷"
    PlayersSideMenu.Visible = false
end
end)

for _, player in ipairs(Players:GetPlayers()) do
if player ~= LocalPlayer then
createPlayerButton(player)
end
end

Players.PlayerAdded:Connect(function(player)
if player ~= LocalPlayer then
createPlayerButton(player)
end
end)

Players.PlayerRemoving:Connect(function(player)
if currentSubject == player then
stopSpectating()
end

text
for _, child in ipairs(PlayersList:GetChildren()) do
    if child:IsA("TextButton") and child.Text == player.Name then
        child:Destroy()
        break
    end
end
end)

UserInputService.InputBegan:Connect(function(input, processed)
if not processed and input.UserInputType == Enum.UserInputType.MouseButton1 then
local mousePos = UserInputService:GetMouseLocation()
local menuPos = PlayersSideMenu.AbsolutePosition
local menuSize = PlayersSideMenu.AbsoluteSize
local buttonPos = SpectateToggleButton.AbsolutePosition
local buttonSize = SpectateToggleButton.AbsoluteSize

text
    if isMenuOpen and
       (mousePos.X < menuPos.X or mousePos.X > menuPos.X + menuSize.X or
        mousePos.Y < menuPos.Y or mousePos.Y > menuPos.Y + menuSize.Y) and
       (mousePos.X < buttonPos.X or mousePos.X > buttonPos.X + buttonSize.X or
        mousePos.Y < buttonPos.Y or mousePos.Y > buttonPos.Y + buttonSize.Y) then
        isMenuOpen = false
        PlayersSideMenu.Visible = false
        SpectateToggleButton.Text = "Select ▷"
    end
end
end)

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

-- Server Hop UI container
local ServerHopContainer = Instance.new("Frame")
ServerHopContainer.Name = "ServerHop"
ServerHopContainer.Size = UDim2.new(1, -20, 0, 40)
ServerHopContainer.Position = UDim2.new(0, 10, 0, 460)
ServerHopContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
ServerHopContainer.BackgroundTransparency = 0.5
ServerHopContainer.Parent = ScriptsFrame

local ServerHopCorner = Instance.new("UICorner")
ServerHopCorner.CornerRadius = UDim.new(0, 6)
ServerHopCorner.Parent = ServerHopContainer

local ServerHopLabel = Instance.new("TextLabel")
ServerHopLabel.Name = "Label"
ServerHopLabel.Size = UDim2.new(0, 120, 1, 0)
ServerHopLabel.Position = UDim2.new(0, 10, 0, 0)
ServerHopLabel.BackgroundTransparency = 1
ServerHopLabel.Text = "Server Hop"
ServerHopLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
ServerHopLabel.Font = Enum.Font.GothamBold
ServerHopLabel.TextSize = 14
ServerHopLabel.TextXAlignment = Enum.TextXAlignment.Left
ServerHopLabel.Parent = ServerHopContainer

local FingerprintButton = Instance.new("ImageButton")
FingerprintButton.Name = "FingerprintButton"
FingerprintButton.Size = UDim2.new(0, 30, 0, 30)
FingerprintButton.Position = UDim2.new(1, -35, 0.5, -15)
FingerprintButton.BackgroundTransparency = 1
FingerprintButton.Image = "rbxassetid://132055134833572"
FingerprintButton.Parent = ServerHopContainer

local function serverHop()
local PlaceId = game.PlaceId
local JobId = game.JobId
local servers = {}

text
local success, result = pcall(function()
    return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true"))
end)

if success and result and result.data then
    for _, v in pairs(result.data) do
        if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
            table.insert(servers, 1, v.id)
        end
    end
end

if #servers > 0 then
    TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], LocalPlayer)
else
    warn("Server Hop: Couldn't find a server.")
end
end

FingerprintButton.MouseEnter:Connect(function()
TweenService:Create(FingerprintButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 32, 0, 32)}):Play()
end)

FingerprintButton.MouseLeave:Connect(function()
TweenService:Create(FingerprintButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 30, 0, 30)}):Play()
end)

FingerprintButton.MouseButton1Click:Connect(serverHop)

-- Server Low UI container
local ServerLowContainer = Instance.new("Frame")
ServerLowContainer.Name = "ServerLow"
ServerLowContainer.Size = UDim2.new(1, -20, 0, 40)
ServerLowContainer.Position = UDim2.new(0, 10, 0, 510)
ServerLowContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
ServerLowContainer.BackgroundTransparency = 0.5
ServerLowContainer.Parent = ScriptsFrame

local ServerLowCorner = Instance.new("UICorner")
ServerLowCorner.CornerRadius = UDim.new(0, 6)
ServerLowCorner.Parent = ServerLowContainer

local ServerLowLabel = Instance.new("TextLabel")
ServerLowLabel.Name = "Label"
ServerLowLabel.Size = UDim2.new(0, 120, 1, 0)
ServerLowLabel.Position = UDim2.new(0, 10, 0, 0)
ServerLowLabel.BackgroundTransparency = 1
ServerLowLabel.Text = "Server Low"
ServerLowLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
ServerLowLabel.Font = Enum.Font.GothamBold
ServerLowLabel.TextSize = 14
ServerLowLabel.TextXAlignment = Enum.TextXAlignment.Left
ServerLowLabel.Parent = ServerLowContainer

local LowFingerprintButton = Instance.new("ImageButton")
LowFingerprintButton.Name = "LowFingerprintButton"
LowFingerprintButton.Size = UDim2.new(0, 30, 0, 30)
LowFingerprintButton.Position = UDim2.new(1, -35, 0.5, -15)
LowFingerprintButton.BackgroundTransparency = 1
LowFingerprintButton.Image = "rbxassetid://132055134833572"
LowFingerprintButton.Parent = ServerLowContainer

local function serverLow()
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour

text
local function TPReturner()
    local Site
    if foundAnything == "" then
        Site = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    
    local num = 0
    for _, v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _, Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        AllIDs = {}
                        table.insert(AllIDs, actualHour)
                    end
                end
                num = num + 1
            end
            
            if Possible then
                table.insert(AllIDs, ID)
                task.wait()
                pcall(function()
                    task.wait()
                    TeleportService:TeleportToPlaceInstance(PlaceID, ID, LocalPlayer)
                end)
                task.wait(4)
            end
        end
    end
end

local connection
connection = RunService.Heartbeat:Connect(function()
    pcall(function()
        TPReturner()
        if foundAnything ~= "" then
            TPReturner()
        end
    end)
end)

delay(30, function()
    if connection then
        connection:Disconnect()
    end
end)
end

LowFingerprintButton.MouseEnter:Connect(function()
TweenService:Create(LowFingerprintButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 32, 0, 32)}):Play()
end)

LowFingerprintButton.MouseLeave:Connect(function()
TweenService:Create(LowFingerprintButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 30, 0, 30)}):Play()
end)

LowFingerprintButton.MouseButton1Click:Connect(serverLow)

-- Rejoin UI container
local RejoinContainer = Instance.new("Frame")
RejoinContainer.Name = "RejoinSettings"
RejoinContainer.Size = UDim2.new(1, -20, 0, 40)
RejoinContainer.Position = UDim2.new(0, 10, 0, 560)
RejoinContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
RejoinContainer.BackgroundTransparency = 0.5
RejoinContainer.Parent = ScriptsFrame

local RejoinCorner = Instance.new("UICorner")
RejoinCorner.CornerRadius = UDim.new(0, 6)
RejoinCorner.Parent = RejoinContainer

local RejoinLabel = Instance.new("TextLabel")
RejoinLabel.Name = "Label"
RejoinLabel.Size = UDim2.new(0, 120, 1, 0)
RejoinLabel.Position = UDim2.new(0, 10, 0, 0)
RejoinLabel.BackgroundTransparency = 1
RejoinLabel.Text = "Rejoin"
RejoinLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
RejoinLabel.Font = Enum.Font.GothamBold
RejoinLabel.TextSize = 14
RejoinLabel.TextXAlignment = Enum.TextXAlignment.Left
RejoinLabel.Parent = RejoinContainer

local RejoinButton = Instance.new("ImageButton")
RejoinButton.Name = "RejoinButton"
RejoinButton.Size = UDim2.new(0, 30, 0, 30)
RejoinButton.Position = UDim2.new(1, -35, 0.5, -15)
RejoinButton.BackgroundTransparency = 1
RejoinButton.Image = "rbxassetid://132055134833572"
RejoinButton.Parent = RejoinContainer

local function rejoin()
TweenService:Create(RejoinButton, TweenInfo.new(0.3), {Rotation = 360}):Play()
task.delay(0.3, function()
TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)
end

RejoinButton.MouseEnter:Connect(function()
TweenService:Create(RejoinButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 32, 0, 32)}):Play()
end)

RejoinButton.MouseLeave:Connect(function()
TweenService:Create(RejoinButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 30, 0, 30)}):Play()
end)

RejoinButton.MouseButton1Click:Connect(rejoin)

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local TeleportContainer = Instance.new("Frame")
TeleportContainer.Name = "TeleportSettings"
TeleportContainer.Size = UDim2.new(1, -20, 0, 40)
TeleportContainer.Position = UDim2.new(0, 10, 0, 610)
TeleportContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
TeleportContainer.BackgroundTransparency = 0.5
TeleportContainer.Parent = ScriptsFrame

local TeleportCorner = Instance.new("UICorner")
TeleportCorner.CornerRadius = UDim.new(0, 6)
TeleportCorner.Parent = TeleportContainer

local TeleportLabel = Instance.new("TextLabel")
TeleportLabel.Name = "Label"
TeleportLabel.Size = UDim2.new(0, 120, 1, 0)
TeleportLabel.Position = UDim2.new(0, 10, 0, 0)
TeleportLabel.BackgroundTransparency = 1
TeleportLabel.Text = "Teleport"
TeleportLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
TeleportLabel.Font = Enum.Font.GothamBold
TeleportLabel.TextSize = 14
TeleportLabel.TextXAlignment = Enum.TextXAlignment.Left
TeleportLabel.Parent = TeleportContainer

local TeleportToggleButton = Instance.new("TextButton")
TeleportToggleButton.Name = "TeleportToggle"
TeleportToggleButton.Size = UDim2.new(0, 120, 0, 25)
TeleportToggleButton.Position = UDim2.new(1, -130, 0.5, -12)
TeleportToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
TeleportToggleButton.Text = "Select ▷"
TeleportToggleButton.TextColor3 = Color3.fromRGB(220, 220, 220)
TeleportToggleButton.Font = Enum.Font.Gotham
TeleportToggleButton.TextSize = 12
TeleportToggleButton.Parent = TeleportContainer

local TeleportButtonCorner = Instance.new("UICorner")
TeleportButtonCorner.CornerRadius = UDim.new(0, 4)
TeleportButtonCorner.Parent = TeleportToggleButton

local PlayersSideMenu = Instance.new("Frame")
PlayersSideMenu.Name = "PlayersSideMenu"
PlayersSideMenu.Size = UDim2.new(0, 150, 0, 0)
PlayersSideMenu.Position = UDim2.new(0, TeleportContainer.AbsolutePosition.X + TeleportContainer.AbsoluteSize.X + 5, 0, TeleportContainer.AbsolutePosition.Y - 135)
PlayersSideMenu.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
PlayersSideMenu.BorderSizePixel = 0
PlayersSideMenu.Visible = false
PlayersSideMenu.ClipsDescendants = true
PlayersSideMenu.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = PlayersSideMenu

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(80, 80, 80)
UIStroke.Thickness = 1
UIStroke.Parent = PlayersSideMenu

local PlayersList = Instance.new("ScrollingFrame")
PlayersList.Size = UDim2.new(1, -5, 1, -5)
PlayersList.Position = UDim2.new(0, 5, 0, 5)
PlayersList.BackgroundTransparency = 1
PlayersList.ScrollBarThickness = 3
PlayersList.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
PlayersList.Parent = PlayersSideMenu

local PlayersListLayout = Instance.new("UIListLayout")
PlayersListLayout.Padding = UDim.new(0, 5)
PlayersListLayout.Parent = PlayersList

PlayersListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
PlayersList.CanvasSize = UDim2.new(0, 0, 0, PlayersListLayout.AbsoluteContentSize.Y)
PlayersSideMenu.Size = UDim2.new(0, 150, 0, math.min(PlayersListLayout.AbsoluteContentSize.Y + 10, 300))
end)

local function updateMenuPosition()
PlayersSideMenu.Position = UDim2.new(
0, TeleportContainer.AbsolutePosition.X + TeleportContainer.AbsoluteSize.X + 5,
0, TeleportContainer.AbsolutePosition.Y - 135
)
end

TeleportContainer:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateMenuPosition)
TeleportContainer:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateMenuPosition)

local function teleportToPlayer(player)
if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
local char = LocalPlayer.Character
if char and char:FindFirstChild("HumanoidRootPart") then
char.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
end
end
end

local function createPlayerButton(player)
local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -10, 0, 30)
button.Position = UDim2.new(0, 5, 0, 0)
button.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
button.TextColor3 = Color3.fromRGB(220, 220, 220)
button.Font = Enum.Font.Gotham
button.TextSize = 12
button.Text = player.Name
button.TextXAlignment = Enum.TextXAlignment.Left
button.Parent = PlayersList

text
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 4)
buttonCorner.Parent = button

button.MouseButton1Click:Connect(function()
    teleportToPlayer(player)
    PlayersSideMenu.Visible = false
    TeleportToggleButton.Text = "Select ▷"
end)

button.MouseEnter:Connect(function()
    TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 95)}):Play()
end)

button.MouseLeave:Connect(function()
    TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 75)}):Play()
end)

return button
end

local isMenuOpen = false
TeleportToggleButton.MouseButton1Click:Connect(function()
isMenuOpen = not isMenuOpen

text
if isMenuOpen then
    TeleportToggleButton.Text = "Select ◁"
    updateMenuPosition()
    PlayersSideMenu.Visible = true
else
    TeleportToggleButton.Text = "Select ▷"
    PlayersSideMenu.Visible = false
end
end)

for _, player in ipairs(Players:GetPlayers()) do
if player ~= LocalPlayer then
createPlayerButton(player)
end
end

Players.PlayerAdded:Connect(function(player)
if player ~= LocalPlayer then
createPlayerButton(player)
end
end)

Players.PlayerRemoving:Connect(function(player)
for _, child in ipairs(PlayersList:GetChildren()) do
if child:IsA("TextButton") and child.Text == player.Name then
child:Destroy()
break
end
end
end)

UserInputService.InputBegan:Connect(function(input, processed)
if not processed and input.UserInputType == Enum.UserInputType.MouseButton1 then
local mousePos = UserInputService:GetMouseLocation()
local menuPos = PlayersSideMenu.AbsolutePosition
local menuSize = PlayersSideMenu.AbsoluteSize
local buttonPos = TeleportToggleButton.AbsolutePosition
local buttonSize = TeleportToggleButton.AbsoluteSize

text
    if isMenuOpen and 
       (mousePos.X < menuPos.X or mousePos.X > menuPos.X + menuSize.X or
        mousePos.Y < menuPos.Y or mousePos.Y > menuPos.Y + menuSize.Y) and
       (mousePos.X < buttonPos.X or mousePos.X > buttonPos.X + buttonSize.X or
        mousePos.Y < buttonPos.Y or mousePos.Y > buttonPos.Y + buttonSize.Y) then
        isMenuOpen = false
        PlayersSideMenu.Visible = false
        TeleportToggleButton.Text = "Select ▷"
    end
end
end)



