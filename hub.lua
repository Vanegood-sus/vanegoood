local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local VanegoodHub = {}

-- Создание GUI
local function createGui()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "VanegoodHub"
    ScreenGui.Parent = CoreGui
    ScreenGui.ResetOnSpawn = false

    -- Кнопка с изображением (draggable)
    local TinyImageGui = Instance.new("ScreenGui")
    TinyImageGui.Name = "TinyDraggableImage"
    TinyImageGui.Parent = CoreGui
    TinyImageGui.ResetOnSpawn = false

    local ImageSize = 75
    local ImageFrame = Instance.new("Frame")
    ImageFrame.Name = "TinyRoundedImage"
    ImageFrame.Size = UDim2.new(0, ImageSize, 0, ImageSize)
    ImageFrame.Position = UDim2.new(0, 20, 0, 20)
    ImageFrame.BackgroundTransparency = 1
    ImageFrame.ClipsDescendants = true
    ImageFrame.Parent = TinyImageGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0.25, 0)
    UICorner.Parent = ImageFrame

    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = "Image"
    ImageLabel.Image = "rbxassetid://111084287166716"
    ImageLabel.Size = UDim2.new(1, 0, 1, 0)
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.BorderSizePixel = 0
    ImageLabel.Parent = ImageFrame

    -- Возможность перетаскивания кнопки с изображением
    local dragging, dragStart, startPos = false, nil, nil

    ImageFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = ImageFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    ImageFrame.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            ImageFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- Основное окно хаба
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 500, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    MainFrame.BackgroundTransparency = 0.15
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local MainUICorner = Instance.new("UICorner")
    MainUICorner.CornerRadius = UDim.new(0, 8)
    MainUICorner.Parent = MainFrame

    -- Оранжевая обводка
    local Border = Instance.new("Frame")
    Border.Size = UDim2.new(1, 2, 1, 2)
    Border.Position = UDim2.new(0, -1, 0, -1)
    Border.BackgroundTransparency = 1
    Border.Parent = MainFrame

    local BorderStroke = Instance.new("UIStroke")
    BorderStroke.Color = Color3.fromRGB(255, 165, 50)
    BorderStroke.Thickness = 1.5
    BorderStroke.Transparency = 0.3
    BorderStroke.Parent = Border

    -- Верхняя панель
    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Size = UDim2.new(1, 0, 0, 30)
    TopBar.Position = UDim2.new(0, 0, 0, 0)
    TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    TopBar.Parent = MainFrame

    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 8)
    TopBarCorner.Parent = TopBar

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "Title"
    TitleLabel.Size = UDim2.new(0, 120, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "VANEGOOD HUB"
    TitleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 14
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TopBar

    -- Кнопка закрытия
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 20, 0, 20)
    CloseButton.Position = UDim2.new(1, -25, 0.5, -10)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 165, 50)
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.new(1, 1, 1)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 18
    CloseButton.Parent = TopBar

    -- Кнопка минимизации
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
    MinimizeButton.Position = UDim2.new(1, -50, 0.5, -10)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 165, 50)
    MinimizeButton.Text = "—"
    MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.TextSize = 18
    MinimizeButton.Parent = TopBar

    -- Вкладки
    local TabBar = Instance.new("Frame")
    TabBar.Name = "TabBar"
    TabBar.Size = UDim2.new(1, 0, 0, 30)
    TabBar.Position = UDim2.new(0, 0, 0, 30)
    TabBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    TabBar.Parent = MainFrame

    local ScriptsTab = Instance.new("TextButton")
    ScriptsTab.Name = "ScriptsTab"
    ScriptsTab.Size = UDim2.new(0.33, 0, 1, 0)
    ScriptsTab.Position = UDim2.new(0, 0, 0, 0)
    ScriptsTab.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    ScriptsTab.Text = "СКРИПТЫ"
    ScriptsTab.TextColor3 = Color3.fromRGB(220, 220, 220)
    ScriptsTab.Font = Enum.Font.GothamBold
    ScriptsTab.TextSize = 12
    ScriptsTab.Parent = TabBar

    local GamesTab = Instance.new("TextButton")
    GamesTab.Name = "GamesTab"
    GamesTab.Size = UDim2.new(0.33, 0, 1, 0)
    GamesTab.Position = UDim2.new(0.33, 0, 0, 0)
    GamesTab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    GamesTab.Text = "ИГРЫ"
    GamesTab.TextColor3 = Color3.fromRGB(180, 180, 180)
    GamesTab.Font = Enum.Font.GothamBold
    GamesTab.TextSize = 12
    GamesTab.Parent = TabBar

    local TrollTab = Instance.new("TextButton")
    TrollTab.Name = "TrollTab"
    TrollTab.Size = UDim2.new(0.34, 0, 1, 0)
    TrollTab.Position = UDim2.new(0.66, 0, 0, 0)
    TrollTab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    TrollTab.Text = "ТРОЛЛИНГ"
    TrollTab.TextColor3 = Color3.fromRGB(180, 180, 180)
    TrollTab.Font = Enum.Font.GothamBold
    TrollTab.TextSize = 12
    TrollTab.Parent = TabBar

    local ActiveTabIndicator = Instance.new("Frame")
    ActiveTabIndicator.Name = "ActiveTabIndicator"
    ActiveTabIndicator.Size = UDim2.new(0.33, 0, 0, 2)
    ActiveTabIndicator.Position = UDim2.new(0, 0, 1, -2)
    ActiveTabIndicator.BackgroundColor3 = Color3.fromRGB(255, 165, 50)
    ActiveTabIndicator.Parent = TabBar

    -- Контент
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Size = UDim2.new(1, -20, 1, -70)
    ContentFrame.Position = UDim2.new(0, 10, 0, 65)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.ClipsDescendants = true
    ContentFrame.Parent = MainFrame

    local ScriptsFrame = Instance.new("ScrollingFrame")
    ScriptsFrame.Name = "ScriptsFrame"
    ScriptsFrame.Size = UDim2.new(1, 0, 1, 0)
    ScriptsFrame.Position = UDim2.new(0, 0, 0, 0)
    ScriptsFrame.BackgroundTransparency = 1
    ScriptsFrame.ScrollBarThickness = 3
    ScriptsFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
    ScriptsFrame.Visible = true
    ScriptsFrame.Parent = ContentFrame

    local ListLayout = Instance.new("UIListLayout")
    ListLayout.Padding = UDim.new(0, 10)
    ListLayout.Parent = ScriptsFrame

    local GamesFrame = Instance.new("ScrollingFrame")
    GamesFrame.Name = "GamesFrame"
    GamesFrame.Size = UDim2.new(1, 0, 1, 0)
    GamesFrame.Position = UDim2.new(0, 0, 0, 0)
    GamesFrame.BackgroundTransparency = 1
    GamesFrame.ScrollBarThickness = 3
    GamesFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
    GamesFrame.Visible = false
    GamesFrame.Parent = ContentFrame

    local TrollFrame = Instance.new("ScrollingFrame")
    TrollFrame.Name = "TrollFrame"
    TrollFrame.Size = UDim2.new(1, 0, 1, 0)
    TrollFrame.Position = UDim2.new(0, 0, 0, 0)
    TrollFrame.BackgroundTransparency = 1
    TrollFrame.ScrollBarThickness = 3
    TrollFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
    TrollFrame.Visible = false
    TrollFrame.Parent = ContentFrame

    return {
        screenGui = ScreenGui,
        tinyImageGui = TinyImageGui,
        imageFrame = ImageFrame,
        image = ImageLabel,
        mainFrame = MainFrame,
        closeButton = CloseButton,
        minimizeButton = MinimizeButton,
        tabBar = TabBar,
        scriptsTab = ScriptsTab,
        gamesTab = GamesTab,
        trollTab = TrollTab,
        activeTabIndicator = ActiveTabIndicator,
        scriptsFrame = ScriptsFrame,
        gamesFrame = GamesFrame,
        trollFrame = TrollFrame,
        contentFrame = ContentFrame,
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

    ui.scriptsTab.MouseButton1Click:Connect(function() switchTab("scripts") end)
    ui.gamesTab.MouseButton1Click:Connect(function() switchTab("games") end)
    ui.trollTab.MouseButton1Click:Connect(function() switchTab("troll") end)

    switchTab("scripts")
end

local function main()
    local ui = createGui()

    -- Подключаем скрипты, передавая необходимые фреймы
    local scriptsModule = require(script.Modules.scripts)
    scriptsModule.load(ui.scriptsFrame, ui.screenGui)

    local minimized = false
    ui.minimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            ui.mainFrame.Size = UDim2.new(0, 500, 0, 30)
            ui.contentFrame.Visible = false
            ui.tabBar.Visible = false
            ui.minimizeButton.Text = "+"
        else
            ui.mainFrame.Size = UDim2.new(0, 500, 0, 350)
            ui.contentFrame.Visible = true
            ui.tabBar.Visible = true
            ui.minimizeButton.Text = "-"
        end
    end)

    ui.closeButton.MouseButton1Click:Connect(function()
        local MessageFrame = Instance.new("Frame")
        MessageFrame.Size = UDim2.new(0, 250, 0, 120)
        MessageFrame.Position = UDim2.new(0.5, -125, 0.5, -60)
        MessageFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        MessageFrame.Parent = ui.screenGui

        local MessageLabel = Instance.new("TextLabel")
        MessageLabel.Size = UDim2.new(1, -20, 0, 60)
        MessageLabel.Position = UDim2.new(0, 10, 0, 10)
        MessageLabel.BackgroundTransparency = 1
        MessageLabel.Text = "Закрыть Vanegood Hub?"
        MessageLabel.TextColor3 = Color3.new(1, 1, 1)
        MessageLabel.Font = Enum.Font.GothamBold
        MessageLabel.TextSize = 14
        MessageLabel.TextWrapped = true
        MessageLabel.Parent = MessageFrame

        local YesButton = Instance.new("TextButton")
        YesButton.Size = UDim2.new(0, 100, 0, 30)
        YesButton.Position = UDim2.new(0.5, -105, 1, -40)
        YesButton.BackgroundColor3 = Color3.fromRGB(255, 165, 50)
        YesButton.Text = "Да"
        YesButton.TextColor3 = Color3.new(1, 1, 1)
        YesButton.Font = Enum.Font.GothamBold
        YesButton.TextSize = 14
        YesButton.Parent = MessageFrame

        local NoButton = Instance.new("TextButton")
        NoButton.Size = UDim2.new(0, 100, 0, 30)
        NoButton.Position = UDim2.new(0.5, 5, 1, -40)
        NoButton.BackgroundColor3 = Color3.fromRGB(80, 80, 90)
        NoButton.Text = "Нет"
        NoButton.TextColor3 = Color3.new(1, 1, 1)
        NoButton.Font = Enum.Font.GothamBold
        NoButton.TextSize = 14
        NoButton.Parent = MessageFrame

        YesButton.MouseButton1Click:Connect(function()
            ui.screenGui:Destroy()
            ui.tinyImageGui:Destroy()
        end)

        NoButton.MouseButton1Click:Connect(function()
            MessageFrame:Destroy()
        end)
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

