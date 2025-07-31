-- Загрузка библиотеки Elerium
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library/main/Library", true))()

-- Создание главного окна
local window = library:AddWindow("Vanegood Hub", {
    main_color = Color3.fromRGB(200, 200, 200),
    min_size = Vector2.new(500, 400),
    can_resize = true
})

-- Основная вкладка
local mainTab = window:AddTab("Меню")
mainTab:Show()

-- Переменные для авто-фарма
local Silent = false
local player = game.Players.LocalPlayer
local Nplayer = player.Name
local FcMaster = true

-- Секция авто-фарма
local autoFarmSection = mainTab:AddSection("Авто-Фарм лучший")

-- Тоггл авто-фарма
local autoFarmToggle = mainTab:AddToggle({
    text = "Авто-Фарм",
    flag = "auto_farm_toggle",
    callback = function(Value)
        getgenv().AF = Value
        local isFarming = false

        local function startAutoFarm()
            if Value == false then return end

            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            local newPart = Instance.new("Part")
            newPart.Size = Vector3.new(5, 1, 5)
            newPart.Transparency = 1
            newPart.CanCollide = true
            newPart.Anchored = true
            newPart.Parent = workspace

            local decal = Instance.new("Decal")
            decal.Texture = "rbxassetid://139953968294114"
            decal.Face = Enum.NormalId.Top 
            decal.Parent = newPart

            local function TPAF(iteration)
                if not Silent then
                    if Value == false then return end
                    if iteration == 5 then
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger, 0)
                        task.delay(0.8, function()
                            workspace.ClaimRiverResultsGold:FireServer()
                        end)

                        humanoidRootPart.CFrame = CFrame.new(-51, 65, 984 + (iteration - 1) * 770)
                    else
                        if iteration == 1 then
                            humanoidRootPart.CFrame = CFrame.new(160.16104125976562, 29.595888137817383, 973.813720703125)
                        else
                            humanoidRootPart.CFrame = CFrame.new(-51, 65, 984 + (iteration - 1) * 770)
                        end
                    end
                    newPart.Position = humanoidRootPart.Position - Vector3.new(0, 2, 0)

                    wait(2.3)
                    if iteration == 1 then
                        wait(2.3)
                    end
                    if iteration == 4 then
                    else
                        workspace.ClaimRiverResultsGold:FireServer()
                    end
                else
                    if Value == false then return end
                    if iteration == 1 then
                        humanoidRootPart.CFrame = CFrame.new(160.16104125976562, 29.595888137817383, 973.813720703125)
                    elseif iteration == 5 then
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger, 0)
                        task.delay(0.8, function()
                            workspace.ClaimRiverResultsGold:FireServer()
                        end)
                        
                        humanoidRootPart.CFrame = CFrame.new(70.02417755126953, 138.9026336669922, 1371.6341552734375 + (iteration - 2) * 770)
                    else
                        humanoidRootPart.CFrame = CFrame.new(70.02417755126953, 138.9026336669922, 1371.6341552734375 + (iteration - 2) * 770)
                    end
                    newPart.Position = humanoidRootPart.Position - Vector3.new(0, 2, 0)

                    wait(2.3)
                    if iteration == 1 then
                        wait(2.3)
                    end
                    if iteration == 4 then
                    else
                        workspace.ClaimRiverResultsGold:FireServer()
                    end
                end
            end

            for i = 1, 10 do
                if not Value then
                    break
                end
                TPAF(i)
            end

            newPart:Destroy()
        end

        local function onCharacterRespawned()
            if getgenv().AF == true then
                if FcMaster == false then return end
                local character = player.Character or player.CharacterAdded:Wait()
                character:WaitForChild("HumanoidRootPart")
                startAutoFarm()
            end
        end

        if Value then
            library:Notification("Auto Farm", "Авто-фарм включен", "ОК")
            game.Players.LocalPlayer.Character:BreakJoints()
            wait(1)
            game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterRespawned)
        else
            library:Notification("Auto Farm", "Авто-фарм выключен", "ОК")
            game.Players.LocalPlayer.CharacterAdded:Connect(function() end)
        end
    end
})

-- Тоггл тихого режима
local silentToggle = mainTab:AddToggle({
    text = "Тихий режим",
    flag = "silent_mode_toggle",
    callback = function(Value)
        Silent = Value
    end
})

-- Секция статистики
local statsSection = mainTab:AddSection("Статистика")

-- Переменные для статистики
local clockTime = 0
local running = false
local totalGoldGained = 0
local Ftime = 0 
local totalGoldBlock = 0
local GoldPerHour = 0
local lastGoldValue = game:GetService("Players").LocalPlayer.Data.Gold.Value
local IGBLOCK = game:GetService("Players").LocalPlayer.Data.GoldBlock.Value

-- Функция форматирования времени
local function formatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local sec = seconds % 60
    return string.format("%02d:%02d:%02d", hours, minutes, sec)
end

-- Функция запуска таймера
local function startClock()
    if running then return end
    running = true

    while running do
        if getgenv().AF then
            clockTime = clockTime + 1
        else
            running = false
        end
        task.wait(1) 
    end
end

-- Создание текстового поля для статистики
local statsText = mainTab:AddLabel("Статистика:\nВремя работы: 00:00:00\nЗолотые блоки: 0\nЗолото: 0\nЗолото/час: 0")

-- Функция обновления статистики
local function updateStats()
    local FinalGold = game:GetService("Players").LocalPlayer.Data.Gold.Value
    Ftime = formatTime(clockTime)
    local GoldGained = FinalGold - lastGoldValue
    totalGoldGained = totalGoldGained + GoldGained
    local FGBLOCK = game:GetService("Players").LocalPlayer.Data.GoldBlock.Value
    totalGoldBlock = FGBLOCK - IGBLOCK

    GoldPerHour = (totalGoldGained / clockTime) * 3600

    statsText:Set("Статистика:\nВремя работы: "..Ftime..
                  "\nЗолотые блоки: "..totalGoldBlock..
                  "\nЗолото: "..totalGoldGained..
                  "\nЗолото/час: "..math.floor(GoldPerHour))

    lastGoldValue = FinalGold
end

-- Запуск обновления статистики
game:GetService("RunService").Stepped:Connect(function()
    if getgenv().AF and not running then
        wait(5)
        startClock()
    end
end)

-- Вкладка "Создатель"
local creatorTab = window:AddTab("Создатель")
creatorTab:AddLabel("Private Script")
creatorTab:AddLabel("")
creatorTab:AddLabel("Создано vanegood")

-- Проверка игры
if game.PlaceId ~= 537413528 then
    library:Notification("Ошибка", "Этот скрипт работает только в Build A Boat For Treasure", "ОК")
    return
end

-- Цикл обновления статистики
while true do
    if getgenv().AF then
        updateStats()
    end
    wait(1)
end
