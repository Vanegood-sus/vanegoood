local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local VanegoodHub = {}

-- Создание GUI
local function createGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "VanegoodHub"
    screenGui.Parent = CoreGui
    screenGui.ResetOnSpawn = false

    -- Кнопка с изображением (draggable)
    local tinyImageGui = Instance.new("ScreenGui")
    tinyImageGui.Name = "TinyDraggableImage"
    tinyImageGui.Parent = CoreGui
    tinyImageGui.ResetOnSpawn = false

    local imageSize = 75
    local imageFrame = Instance.new("Frame")
    imageFrame.Name = "tinyRoundedImage"
    imageFrame.Size = UDim2.new(0, imageSize, 0, imageSize)
    imageFrame.Position = UDim2.new(0, 20, 0, 20)
    imageFrame.BackgroundTransparency = 1
    imageFrame.ClipsDescendants = true
    imageFrame.Parent = tinyImageGui

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0.25, 0)
    uiCorner.Parent = imageFrame

    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Name = "image"
    imageLabel.Image = "rbxassetid://111084287166716"
    imageLabel.Size = UDim2.new(1, 0, 1, 0)
    imageLabel.BackgroundTransparency = 1
    imageLabel.BorderSizePixel = 0
    imageLabel.Parent = imageFrame

    -- Dragging logic for tiny image
    local dragging = false
    local dragStart = nil
    local startPos = nil

    imageFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = imageFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    imageFrame.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            imageFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "mainFrame"
    mainFrame.Size = UDim2.new(0, 500, 0, 350)
    mainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
    mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    mainFrame.BackgroundTransparency = 0.15
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui

    local mainUICorner = Instance.new("UICorner")
    mainUICorner.CornerRadius = UDim.new(0, 8)
    mainUICorner.Parent = mainFrame

    -- Border
    local border = Instance.new("Frame")
    border.Size = UDim2.new(1, 2, 1, 2)
    border.Position = UDim2.new(0, -1, 0, -1)
    border.BackgroundTransparency = 1
    border.Parent = mainFrame

    local borderStroke = Instance.new("UIStroke")
    borderStroke.Color = Color3.fromRGB(255, 165, 50)
    borderStroke.Thickness = 1.5
    borderStroke.Transparency = 0.3
    borderStroke.Parent = border

    -- Top Bar
    local topBar = Instance.new("Frame")
    topBar.Name = "topBar"
    topBar.Size = UDim2.new(1, 0, 0, 30)
    topBar.Position = UDim2.new(0, 0, 0, 0)
    topBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    topBar.Parent = mainFrame

    local topBarCorner = Instance.new("UICorner")
    topBarCorner.CornerRadius = UDim.new(0, 8)
    topBarCorner.Parent = topBar

    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "title"
    titleLabel.Size = UDim2.new(0, 120, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "VANEGOOD HUB"
    titleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = topBar

    -- Close Button
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "closeButton"
    closeButton.Size = UDim2.new(0, 20, 0, 20)
    closeButton.Position = UDim2.new(1, -25, 0.5, -10)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 165, 50)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.new(1, 1, 1)
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 18
    closeButton.Parent = topBar

    -- Minimize Button
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "minimizeButton"
    minimizeButton.Size = UDim2.new(0, 20, 0, 20)
    minimizeButton.Position = UDim2.new(1, -50, 0.5, -10)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 165, 50)
    minimizeButton.Text = "—"
    minimizeButton.TextColor3 = Color3.new(1, 1, 1)
    minimizeButton.Font = Enum.Font.GothamBold
    minimizeButton.TextSize = 18
    minimizeButton.Parent = topBar

    -- Tab Bar
    local tabBar = Instance.new("Frame")
    tabBar.Name = "tabBar"
    tabBar.Size = UDim2.new(1, 0, 0, 30)
    tabBar.Position = UDim2.new(0, 0, 0, 30)
    tabBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    tabBar.Parent = mainFrame

    local scriptsTab = Instance.new("TextButton")
    scriptsTab.Name = "scriptsTab"
    scriptsTab.Size = UDim2.new(0.33, 0, 1, 0)
    scriptsTab.Position = UDim2.new(0, 0, 0, 0)
    scriptsTab.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    scriptsTab.Text = "СКРИПТЫ"
    scriptsTab.TextColor3 = Color3.fromRGB(220, 220, 220)
    scriptsTab.Font = Enum.Font.GothamBold
    scriptsTab.TextSize = 12
    scriptsTab.Parent = tabBar

    local gamesTab = Instance.new("TextButton")
    gamesTab.Name = "gamesTab"
    gamesTab.Size = UDim2.new(0.33, 0, 1, 0)
    gamesTab.Position = UDim2.new(0.33, 0, 0, 0)
    gamesTab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    gamesTab.Text = "ИГРЫ"
    gamesTab.TextColor3 = Color3.fromRGB(180, 180, 180)
    gamesTab.Font = Enum.Font.GothamBold
    gamesTab.TextSize = 12
    gamesTab.Parent = tabBar

    local trollTab = Instance.new("TextButton")
    trollTab.Name = "trollTab"
    trollTab.Size = UDim2.new(0.34, 0, 1, 0)
    trollTab.Position = UDim2.new(0.66, 0, 0, 0)
    trollTab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    trollTab.Text = "ТРОЛЛИНГ"
    trollTab.TextColor3 = Color3.fromRGB(180, 180, 180)
    trollTab.Font = Enum.Font.GothamBold
    trollTab.TextSize = 12
    trollTab.Parent = tabBar

    local activeTabIndicator = Instance.new("Frame")
    activeTabIndicator.Name = "activeTabIndicator"
    activeTabIndicator.Size = UDim2.new(0.33, 0, 0, 2)
    activeTabIndicator.Position = UDim2.new(0, 0, 1, -2)
    activeTabIndicator.BackgroundColor3 = Color3.fromRGB(255, 165, 50)
    activeTabIndicator.Parent = tabBar

    -- Content Frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "contentFrame"
    contentFrame.Size = UDim2.new(1, -20, 1, -70)
    contentFrame.Position = UDim2.new(0, 10, 0, 65)
    contentFrame.BackgroundTransparency = 1
    contentFrame.ClipsDescendants = true
    contentFrame.Parent = mainFrame

    local scriptsFrame = Instance.new("ScrollingFrame")
    scriptsFrame.Name = "scriptsFrame"
    scriptsFrame.Size = UDim2.new(1, 0, 1, 0)
    scriptsFrame.Position = UDim2.new(0, 0, 0, 0)
    scriptsFrame.BackgroundTransparency = 1
    scriptsFrame.ScrollBarThickness = 3
    scriptsFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
    scriptsFrame.Visible = true
    scriptsFrame.Parent = contentFrame

    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 10)
    listLayout.Parent = scriptsFrame

    local gamesFrame = Instance.new("ScrollingFrame")
    gamesFrame.Name = "gamesFrame"
    gamesFrame.Size = UDim2.new(1, 0, 1, 0)
    gamesFrame.Position = UDim2.new(0, 0, 0, 0)
    gamesFrame.BackgroundTransparency = 1
    gamesFrame.ScrollBarThickness = 3
    gamesFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
    gamesFrame.Visible = false
    gamesFrame.Parent = contentFrame

    local trollFrame = Instance.new("ScrollingFrame")
    trollFrame.Name = "trollFrame"
    trollFrame.Size = UDim2.new(1, 0, 1, 0)
    trollFrame.Position = UDim2.new(0, 0, 0, 0)
    trollFrame.BackgroundTransparency = 1
    trollFrame.ScrollBarThickness = 3
    trollFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
    trollFrame.Visible = false
    trollFrame.Parent = contentFrame

    return {
        screenGui = screenGui,
        tinyImageGui = tinyImageGui,
        imageFrame = imageFrame,
        image = imageLabel,
        mainFrame = mainFrame,
        closeButton = closeButton,
        minimizeButton = minimizeButton,
        tabBar = tabBar,
        scriptsTab = scriptsTab,
        gamesTab = gamesTab,
        trollTab = trollTab,
        activeTabIndicator = activeTabIndicator,
        scriptsFrame = scriptsFrame,
        gamesFrame = gamesFrame,
        trollFrame = trollFrame,
        contentFrame = contentFrame,
    }
end

local function connectTabs(ui)
    local function switchTab(tab)
        ui.scriptsTab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        ui.gamesTab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        ui.trollTab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)

        ui.scriptsTab.TextColor3 = Color3.fromRGB(180, 180, 180)
        ui.gamesTab.TextColor3 = Color3.fromRGB(180, 180, 180)
        ui.trollTab.TextColor3 = Color3.fromRGB(180, 180, 180)

        ui.scriptsFrame.Visible = false
        ui.gamesFrame.Visible = false
        ui.trollFrame.Visible = false

        if tab == "scripts" then
            ui.scriptsTab.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            ui.scriptsTab.TextColor3 = Color3.fromRGB(220, 220, 220)
            TweenService:Create(ui.activeTabIndicator, TweenInfo.new(0.2), {Position = UDim2.new(0, 0, 1, -2)}):Play()
            ui.scriptsFrame.Visible = true
        elseif tab == "games" then
            ui.gamesTab.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            ui.gamesTab.TextColor3 = Color3.fromRGB(220, 220, 220)
            TweenService:Create(ui.activeTabIndicator, TweenInfo.new(0.2), {Position = UDim2.new(0.33, 0, 1, -2)}):Play()
            ui.gamesFrame.Visible = true
        elseif tab == "troll" then
            ui.trollTab.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            ui.trollTab.TextColor3 = Color3.fromRGB(220, 220, 220)
            TweenService:Create(ui.activeTabIndicator, TweenInfo.new(0.2), {Position = UDim2.new(0.66, 0, 1, -2)}):Play()
            ui.trollFrame.Visible = true
        end
    end

    ui.scriptsTab.MouseButton1Click:Connect(function()
        switchTab("scripts")
    end)
    ui.gamesTab.MouseButton1Click:Connect(function()
        switchTab("games")
    end)
    ui.trollTab.MouseButton1Click:Connect(function()
        switchTab("troll")
    end)

    switchTab("scripts")
end

local function main()
    local ui = createGui()

    -- Подключаем модуль скриптов (укажите правильный путь)
    local scriptsModule = require(script.Modules.scripts)
    scriptsModule.load(ui.scriptsFrame, ui.screenGui)

    local minimized = false
    ui.minimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            ui.screenGui.Enabled = false
            ui.tinyImageGui.Enabled = true
            ui.minimizeButton.Text = "+"
        else
            ui.screenGui.Enabled = true
            ui.tinyImageGui.Enabled = true
            ui.minimizeButton.Text = "—"
        end
    end)

    ui.closeButton.MouseButton1Click:Connect(function()
        ui.screenGui:Destroy()
        ui.tinyImageGui:Destroy()
    end)

    local hubVisible = true
    ui.imageFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            hubVisible = not hubVisible
            ui.screenGui.Enabled = hubVisible

            if hubVisible then
                TweenService:Create(ui.image, TweenInfo.new(0.2), {ImageTransparency = 0}):Play()
            else
                TweenService:Create(ui.image, TweenInfo.new(0.2), {ImageTransparency = 0.5}):Play()
            end
        end
    end)

    connectTabs(ui)
end

main()

return VanegoodHub
