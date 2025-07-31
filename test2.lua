-- Загрузка библиотеки Elerium
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library/main/Library", true))()

-- Проверка игры
if game.PlaceId ~= 537413528 then
    warn("Этот скрипт работает только в Build A Boat For Treasure!")
    return
end

-- Создание главного окна
local window = library:AddWindow("Vanegood Hub", {
    main_color = Color3.fromRGB(70, 130, 180),
    min_size = Vector2.new(500, 400),
    can_resize = true
})

-- Основная вкладка
local mainTab = window:AddTab("Меню")
mainTab:Show()

-- Переменные для авто-фарма
local player = game.Players.LocalPlayer
local Silent = false
local AF = false
local clockTime = 0
local totalGoldGained = 0
local totalGoldBlock = 0
local lastGoldValue = player.Data.Gold.Value
local lastGoldBlockValue = player.Data.GoldBlock.Value

-- Функция форматирования времени
local function formatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local seconds = seconds % 60
    return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

-- Создаем секции
local autoFarmSection = mainTab:AddSection("Авто-Фарм")
local statsSection = mainTab:AddSection("Статистика")

-- Тоггл авто-фарма
local autoFarmToggle = mainTab:AddToggle({
    text = "Включить авто-фарм",
    flag = "auto_farm_toggle",
    callback = function(value)
        AF = value
        
        if value then
            library:Notification("Авто-Фарм", "Авто-фарм включен!", "ОК")
            
            -- Создаем платформу для фарма
            local platform = Instance.new("Part")
            platform.Size = Vector3.new(10, 1, 10)
            platform.Transparency = 0.5
            platform.Anchored = true
            platform.CanCollide = true
            platform.Position = Vector3.new(0, 50, 0)
            platform.Parent = workspace
            
            -- Основной цикл фарма
            spawn(function()
                while AF do
                    -- Телепортация к чекпоинтам
                    local checkpoints = {
                        Vector3.new(160.16, 29.60, 973.81),
                        Vector3.new(-51, 65, 984),
                        Vector3.new(-51, 65, 1754),
                        Vector3.new(-51, 65, 2524),
                        Vector3.new(70.02, 138.90, 1371.63)
                    }
                    
                    for i, checkpoint in ipairs(checkpoints) do
                        if not AF then break end
                        
                        -- Телепортация
                        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(checkpoint)
                            
                            -- Взаимодействие с сундуком на последнем чекпоинте
                            if i == 5 then
                                firetouchinterest(player.Character.HumanoidRootPart, workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger, 0)
                                wait(0.5)
                            end
                            
                            -- Сбор награды
                            workspace.ClaimRiverResultsGold:FireServer()
                            wait(2)
                        else
                            player.CharacterAdded:Wait()
                        end
                    end
                end
                
                -- Удаляем платформу при выключении
                if platform then
                    platform:Destroy()
                end
            end)
        else
            library:Notification("Авто-Фарм", "Авто-фарм выключен!", "ОК")
        end
    end
})

-- Тоггл тихого режима
mainTab:AddToggle({
    text = "Тихий режим",
    flag = "silent_mode",
    callback = function(value)
        Silent = value
    end
})

-- Элементы статистики
local statsLabel = mainTab:AddLabel("Время работы: 00:00:00")
local goldLabel = mainTab:AddLabel("Золото: 0")
local blocksLabel = mainTab:AddLabel("Золотые блоки: 0")
local goldPerHourLabel = mainTab:AddLabel("Золото/час: 0")

-- Функция обновления статистики
local function updateStats()
    local currentGold = player.Data.Gold.Value
    local currentBlocks = player.Data.GoldBlock.Value
    
    -- Рассчет статистики
    local goldGained = currentGold - lastGoldValue
    local blocksGained = currentBlocks - lastGoldBlockValue
    local goldPerHour = (goldGained / math.max(1, clockTime)) * 3600
    
    -- Обновление UI
    statsLabel:Set("Время работы: "..formatTime(clockTime))
    goldLabel:Set("Золото: "..goldGained)
    blocksLabel:Set("Золотые блоки: "..blocksGained)
    goldPerHourLabel:Set("Золото/час: "..math.floor(goldPerHour))
    
    -- Обновление последних значений
    lastGoldValue = currentGold
    lastGoldBlockValue = currentBlocks
end

-- Таймер для статистики
spawn(function()
    while wait(1) do
        if AF then
            clockTime = clockTime + 1
            updateStats()
        end
    end
end)

-- Вкладка "Создатель"
local noteTab = window:AddTab("Создатель")
noteTab:AddLabel("Private Script"):SetTextSize(16)
noteTab:AddSeparator()
noteTab:AddLabel("Создано vanegood"):SetTextSize(14)

-- Уведомление о запуске
library:Notification("Vanegood Hub", "Скрипт успешно запущен!", "ОК")
