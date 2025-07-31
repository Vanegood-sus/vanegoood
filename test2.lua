local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library/main/Library", true))()

-- Создание главного окна со светло-серым цветом
local window = library:AddWindow("Vanegood Hub", {
    main_color = Color3.fromRGB(200, 200, 200), -- светло-серый
    min_size = Vector2.new(500, 400),
    can_resize = true
})

-- Основная вкладка 
local mainTab = window:AddTab("Меню")
mainTab:Show()

-- Вкладка "Создатель"
local noteTab = window:AddTab("Создатель")
noteTab:AddLabel("Private Script")
noteTab:AddLabel("")
noteTab:AddLabel("Созданно vanegood")

-- Принудительное отображение интерфейса
if game:GetService("CoreGui"):FindFirstChild("Elerium") then
    game:GetService("CoreGui").Elerium.Enabled = true
end

-- Проверка игры
if game.PlaceId ~= 537413528 then
    return
end

-- Инициализация скрипта
task.spawn(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/MessageIssue.lua'))()
end)

-- Создание папок
if not isfolder("BABFT") then
    makefolder("BABFT")
end

if not isfolder("BABFT/Image") then
    makefolder("BABFT/Image")
end

if not isfolder("BABFT/Build") then
    makefolder("BABFT/Build")
end

local FcMaster = true
local folderName = "Превью арта"
local previewFolder = Workspace:FindFirstChild(folderName) or Instance.new("Folder", Workspace)
previewFolder.Name = folderName

-- Очистка превью
for _, v in ipairs(previewFolder:GetChildren()) do
    v:Destroy()
end

-- Удаление сообщения через 10 секунд
task.delay(10, function()
    if game:GetService("CoreGui"):FindFirstChild("MSGISSUE") then
        game:GetService("CoreGui").MSGISSUE:Destroy()
    end
end)

-- Инициализация Rayfield
local Rayfield
local success

success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not success then
    success, Rayfield = pcall(function()
        return loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/ab965bf9a6f9890e6447c9b377678f5bffd8a379/source.lua'))()
    end)
end

if not success then
    success, Rayfield = pcall(function()
        return loadstring(game:HttpGet('https://github.com/SiriusSoftwareLtd/Rayfield/blob/28c7c270669c16a2ae1526eaaac1dbf927aa881e/source.lua'))()
    end)
end

-- Сервисы
local HttpService = cloneref(game:GetService("HttpService"))
local TeleportService = cloneref(game:GetService("TeleportService"))
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local JobId = game.JobId
local PlaceId = game.PlaceId
local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local RunService = game:GetService("RunService")

-- Создание окна Rayfield
local Window = Rayfield:CreateWindow({
    Name = "Build A Boat For Treasure",
    Icon = 85108798400826,
    LoadingTitle = "Build A Boat For Treasure",
    LoadingSubtitle = "Созданно vanegood",
    Theme = "DarkBlue",
    DisableRayfieldPrompts = true,
    DisableBuildWarnings = true,
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "Big Hub"
    },
})

-- Вкладки
local Global = Window:CreateTab("Меню", 125428076789049)
local ImageLoader = Window:CreateTab("Арт", 91865122737183)
local Miscellaneous = Window:CreateTab("Другое", 90305619538335)

-- Приветственное сообщение
local Paragraph = Global:CreateParagraph({Title = "Добро Пожаловать!", Content = "Тут фармилка"})

-- Игрок
local player = game.Players.LocalPlayer
local Nplayer = game.Players.LocalPlayer.Name

-- Секция авто-фарма
local Section = Global:CreateSection("Авто-Фарм")
local AutoFarm1 = Global:CreateToggle({
    Name = "Авто Фарм",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
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
            Rayfield:Notify({
                Title = "Авто-Фарм - Включен",
                Content = "Рекомендую в изоляции",
                Duration = 6.5,
                Image = 124144713366592,
            })
            game.Players.LocalPlayer.Character:BreakJoints()
            wait(1)
            game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterRespawned)
        else
            Rayfield:Notify({
                Title = "Авто-Фарм - Выключен",
                Content = "Подожди немного,и выключи изоляцию",
                Duration = 6.5,
                Image = 124144713366592,
            })
            game.Players.LocalPlayer.CharacterAdded:Connect(function() end)
        end
    end,
})

-- Статистика фарма
local FStats = Global:CreateParagraph({Title = "Stats", Content = "Elapsed time: -".."\n".."GoldBlock Gained: -".."\n".."Gold Gained: -".."\n".."\n".."Gold per hour: -"})

local clockTime = 0
local running = false
local totalGoldGained = 0
local Ftime = 0 
local totalGoldBlock = 0
local GoldPerHour = 0
local lastGoldValue = game:GetService("Players").LocalPlayer.Data.Gold.Value
local IGBLOCK = game:GetService("Players").LocalPlayer.Data.GoldBlock.Value

-- Форматирование времени
local function formatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local sec = seconds % 60
    return hours .. " hours " .. minutes .. " minutes " .. sec .. " seconds"
end

-- Запуск таймера
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

-- Обновление статистики
game:GetService("RunService").Stepped:Connect(function()
    if getgenv().AF and not running then
        wait(5)
        startClock()
    end
end)

function initclock()
    while true do
        local FinalGold = game:GetService("Players").LocalPlayer.Data.Gold.Value
        Ftime = formatTime(clockTime)
        local GoldGained = FinalGold - lastGoldValue
        totalGoldGained = totalGoldGained + GoldGained
        local FGBLOCK = game:GetService("Players").LocalPlayer.Data.GoldBlock.Value
        totalGoldBlock = FGBLOCK - IGBLOCK

        GoldPerHour = (totalGoldGained / clockTime) * 3600

        FStats:Set({
            Title = "Stats",
            Content = "Elapsed time: " .. Ftime .. "\n" ..
                      "GoldBlock Gained: " .. totalGoldBlock .. "\n" ..
                      "Gold Gained: " .. totalGoldGained .. "\n" ..
                      "Gold per hour: " .. math.floor(GoldPerHour),
        })

        lastGoldValue = FinalGold

        wait(1)
    end
end

GoldPerHour = 0

-- Функция для отправки сообщений в Discord
function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = {
                    ["text"] = embed.footer.text
                },
                ["thumbnail"] = {
                    ["url"] = embed.thumbnail_url
                }
            }
        }
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

local WebHook = "a"
local interval = 1800

-- Отправка информации о фарме
function SendAUTOFARMInfo(Ftime, totalGoldBlock, totalGoldGained, GoldPerHour)
    local embed = {
        ["title"] = "BABFT | Auto Farm",
        ["description"] = "Stats",
        ["color"] = 16777215,
        ["fields"] = {
            {
                ["name"] = "Время:",
                ["value"] = Ftime or 0
            },
            {
                ["name"] = "Золотой блок:",
                ["value"] = tostring(totalGoldBlock) or 0
            },
            {
                ["name"] = "Золото:",
                ["value"] = tostring(totalGoldGained) or 0
            },
            {
                ["name"] = "Золото в час:",
                ["value"] = tostring(math.floor(GoldPerHour)) or 0
            },
            {
                ["name"] = "Всего золота:",
                ["value"] = game:GetService("Players").LocalPlayer.Data.Gold.Value or 0
            }
        },
        ["footer"] = {
            ["text"] = "Vanegood Hub"
        },
        ["thumbnail_url"] = "https://example.com/thumbnail.png"
    }
    SendMessageEMBED(WebHook, embed)
end

-- Загрузка ID блоков
local BlockId = loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/BlockId.lua'))()

-- Работа с изображениями
local ImageFiles = {}

local function updateImageFiles()
    local files = listfiles("BABFT/Image")
    ImageFiles = {}

    for _, file in ipairs(files) do
        if isfile(file) then
            table.insert(ImageFiles, file)
        end
    end
end

-- Функции для работы с командой игрока
local function LPTEAM()
    local teamName = player.Team.Name

    local zoneMapping = {
        Черная лока = "BlackZone",
        Синяя лока = "Really blueZone",
        Зеленая лока = "CamoZone",
        Красная лока = "Really redZone",
        Белая лока = "WhiteZone",
        Желтая лока = "New YellerZone",
        Розовая лока = "MagentaZone"
    }

    local selectedZoneName = zoneMapping[teamName]

    if selectedZoneName then
        local zone = workspace:FindFirstChild(selectedZoneName)
        if zone then
            return zone.position + Vector3.new(-100, 150, 0)
        end
    end
end

local function LPTEAM3()
    local teamName = player.Team.Name
    
    local zoneMapping = {    
        Черная лока = "BlackZone",
        Синяя лока = "Really blueZone",
        Зеленая лока = "CamoZone",
        Красная лока = "Really redZone",
        Белая лока = "WhiteZone",
        Желтая лока = "New YellerZone",
        Розовая лока = "MagentaZone"
    }
    
    local selectedZoneName = zoneMapping[teamName]
    
    if selectedZoneName then
        local zone = workspace:FindFirstChild(selectedZoneName)
        if zone then
            return zone.position
        end
    end
end

-- Функция для инструмента строительства
function BuildingTool()
    game:GetService("Players").LocalPlayer.Backpack.BuildingTool.RF:InvokeServer("WoodBlock",58,workspace.BlackZone,CFrame.new(0, 6, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),true,CFrame.new(),false)
end

-- Папка для превью изображений
local imagePreviewFolder = workspace:FindFirstChild("ImagePreview") or Instance.new("Folder")
imagePreviewFolder.Name = "ImagePreview"
imagePreviewFolder.Parent = workspace

-- Переменные для работы с изображениями
local UserBlockList = {}
local dataFolder = game:GetService("Players").LocalPlayer.Data
local BlockType = "PlasticBlock"
local LPBlockvalue = UserBlockList[BlockType]
local blockSize = 2
local startPosition = nil
local PreviewPart = nil
local kflxjdhgw = nil
local currentConnection = nil
local FileImage = nil
local HalfblockSize = blockSize / 2
local cooloffset = Vector3.new(0, 0, 0)
local Unit = 45
local Bdepth = 2
local angleY = 0
local ImgCenterimage = nil
local Brainrot = CFrame.identity
local rotationCFrame = CFrame.Angles(0, 0, 0)
local batchSize = 700
local TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong = 0
local USEURL = nil
local TempData = {}
local BlockLoaded = true
local TASK1, TASK2, TASK3, TASK4, TASK5 = false, false, false, false, false
getgenv().ImgLoaderStat = true

-- Дополнительные функции для работы с командой
local function LPTEAM2()
    local teamName = player.Team.Name
    
    local zoneMapping = {
        black = "BlackZone",
        blue = "Really blueZone",
        green = "CamoZone",
        red = "Really redZone",
        white = "WhiteZone",
        yellow = "New YellerZone",
        magenta = "MagentaZone"
    }
    
    local selectedZoneName = zoneMapping[teamName]
    
    if selectedZoneName then
        local zone = workspace:FindFirstChild(selectedZoneName)
        if zone then
            return zone.Name
        end
    end
end

-- Обновление списка блоков игрока
local function UUserBlockList()
    UserBlockList = {}
    for _, feuh in ipairs(dataFolder:GetChildren()) do
        if feuh.Value ~= nil then
            UserBlockList[feuh.Name] = feuh.Value
        end
    end
end

-- Чтение файла
local function readFile(filePath)
    if not isfile(filePath) then
        return nil
    end
    return readfile(filePath)
end

-- Парсинг цветов
local function parseColors(fileContent)
    local data = {}

    for value in string.gmatch(fileContent, "[^,]+") do
        value = value:match("^%s*(.-)%s*$")
        table.insert(data, tonumber(value) or value)
    end
    return data
end

-- Вычисление размера кадра
local function calculateFrameSize(data)
    local width = 0
    local height = 0
    local currentWidth = 0

    for i = 1, #data, 3 do
        local r, g, b = data[i], data[i + 1], data[i + 2]

        if r == "B" and g == "B" and b == "B" then
            height += 1
            width = math.max(width, currentWidth)
            currentWidth = 0
        elseif r == "R" and g == "R" and b == "R" then
            currentWidth += 1
        elseif type(r) == "number" and type(g) == "number" and type(b) == "number" then
            currentWidth += 1
        end
    end
    height += 1
    width = math.max(width, currentWidth)
    return Vector3.new(width * blockSize, height * blockSize, Bdepth)
end

-- Превью кадра
local function previewFrame(frameSize, position, blockSize)
    startPosition = LPTEAM()
    if PreviewPart then
        PreviewPart:Destroy()
        PreviewPart = nil
    end

    PreviewPart = Instance.new("Part")
    PreviewPart.Size = frameSize
    PreviewPart.Position = position + Vector3.new(HalfblockSize - blockSize + frameSize.X / 2, HalfblockSize + blockSize - frameSize.Y / 2, 0) + cooloffset
    PreviewPart.Transparency = 1
    PreviewPart.Color = Color3.new(1, 1, 1)
    PreviewPart.Anchored = true
    PreviewPart.CanCollide = false
    PreviewPart.Name = "PreviewSize"
    PreviewPart.Parent = previewFolder
    PreviewPart.Rotation = Vector3.new(0, angleY - 90, 0)

    local textureId = "rbxassetid://133978572926918"

    local function applyTextureToSurface(surface, sizeX, sizeY)
        local texture = Instance.new("Texture")
        texture.Texture = textureId
        texture.Face = surface
        texture.Parent = PreviewPart
        texture.StudsPerTileU = blockSize
        texture.StudsPerTileV = blockSize
        texture.Transparency = 0.2
    end

    applyTextureToSurface(Enum.NormalId.Front, frameSize.X, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Back, frameSize.X, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Left, frameSize.Z, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Right, frameSize.Z, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Top, frameSize.X, frameSize.Z)
    applyTextureToSurface(Enum.NormalId.Bottom, frameSize.X, frameSize.Z)
end

-- Центрирование изображения
local function Centerimage(frameSize, position, blockSize)
    startPosition = LPTEAM()
    if kflxjdhgw then
        kflxjdhgw:Destroy()
        kflxjdhgw = nil
    end

    kflxjdhgw = Instance.new("Part")
    kflxjdhgw.Size = frameSize
    kflxjdhgw.Position = position + Vector3.new(HalfblockSize - blockSize + frameSize.X / 2, HalfblockSize + blockSize - frameSize.Y / 2, 0)
    kflxjdhgw.Transparency = 1
    kflxjdhgw.Color = Color3.new(1, 1, 1)
    kflxjdhgw.Anchored = true
    kflxjdhgw.CanCollide = false
    kflxjdhgw.Name = "Centerimage"
    kflxjdhgw.Parent = previewFolder
    return kflxjdhgw.Position
end

-- Быстрое построение изображения
local function buildImageFAST()
    local folder = workspace:FindFirstChild("ImagePreview")
    if not folder then
        return
    end

    for _, part in ipairs(folder:GetChildren()) do
        if part:IsA("BasePart") and part.Name == "Part" then
            part.Transparency = 0.8
        end
    end

    local parts = {}
    for _, part in ipairs(folder:GetChildren()) do
        if part:IsA("BasePart") and part.Name == "Part" then
            table.insert(parts, part)
        end
    end

    if #parts == 0 then
        return
    end

    local paintData = {}

    UUserBlockList()
    local uszLPBlockvalue = UserBlockList[BlockType]
    local Zonesss = LPTEAM2()

    local LNplayer = nil
    if game:GetService("Players").LocalPlayer.Settings.ShareBlocks.Value == false then
        LNplayer = Nplayer
    else
        local playerteam = player.Team.Name
        local blocktoget = game:GetService("Teams"):FindFirstChild(playerteam).TeamLeader.Value
        LNplayer = blocktoget
    end

    for i = 1, #parts do
        if getgenv().ImgLoaderStat == false then
            break
        end
        task.spawn(function()
            local part = parts[i]
            if not part then
                return
            end
            if getgenv().ImgLoaderStat == false then
                return
            end
            -- Остальная логика построения изображения
        end)
    end
end

-- Запуск таймера статистики
task.spawn(initclock)
