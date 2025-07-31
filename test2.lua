local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library/main/Library", true))()

-- Создание главного окна
local window = library:AddWindow("BABFT Script", {
    main_color = Color3.fromRGB(200, 200, 200),
    min_size = Vector2.new(500, 400),
    can_resize = true
})

-- Вкладки
local globalTab = window:AddTab("Глобальные функции")
local imageTab = window:AddTab("Загрузка изображений")
local buildTab = window:AddTab("Авто-постройка")
local blocksTab = window:AddTab("Необходимые блоки")
local miscTab = window:AddTab("Разное")
local infoTab = window:AddTab("Информация")
local creditsTab = window:AddTab("Автор")

-- Глобальные функции
globalTab:AddLabel("Основные функции")
local afkToggle = globalTab:AddToggle("Анти-АФК", false, function(state)
    getgenv().afk6464 = state
    if state then
        enableAntiAFK()
    else
        disableAntiAFK()
    end
end)

globalTab:AddButton("Загрузить Infinite Yield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

globalTab:AddButton("Инструмент телепортации", function()
    -- Код инструмента телепортации
end)

globalTab:AddDivider()

-- Автофарм
globalTab:AddLabel("Автофарм золота")
local farmToggle = globalTab:AddToggle("Включить автофарм", false, function(state)
    getgenv().AF = state
    if state then
        startAutoFarm()
    end
end)

-- Загрузка изображений
imageTab:AddLabel("Загрузка изображений в игру")
local imageUrl = imageTab:AddTextBox("URL изображения", "", function(text)
    getgenv().imageUrl = text
end)

local speedSlider = imageTab:AddSlider("Скорость постройки", 1, 10, 5, function(value)
    getgenv().buildSpeed = value/10
end)

imageTab:AddButton("Загрузить изображение", function()
    if getgenv().imageUrl then
        loadImage(getgenv().imageUrl, getgenv().buildSpeed)
    end
end)

-- Авто-постройка
buildTab:AddLabel("Сохранение/загрузка построек")
local buildName = buildTab:AddTextBox("Название постройки", "", function(text)
    getgenv().buildName = text
end)

buildTab:AddButton("Сохранить постройку", function()
    if getgenv().buildName then
        saveBuild(getgenv().buildName)
    end
end)

buildTab:AddButton("Загрузить постройку", function()
    if getgenv().buildName then
        loadBuild(getgenv().buildName)
    end
end)

-- Разное
miscTab:AddButton("Rejoin", function()
    -- Код rejoin
end)

miscTab:AddButton("Смена сервера", function()
    serverHop()
end)

-- Информация
infoTab:AddLabel("Информация о скрипте")
infoTab:AddLabel("Автофарм: 20-50к золота/час")
infoTab:AddLabel("Требования для изображений:")
infoTab:AddLabel("- Файлы RGB формата")
infoTab:AddLabel("- Поддерживаемые хосты")

-- Автор
creditsTab:AddLabel("Создатель: vanegood")

-- Активация интерфейса
if game:GetService("CoreGui"):FindFirstChild("Elerium") then
    game:GetService("CoreGui").Elerium.Enabled = true
end

-- Подключение функций из оригинального скрипта
local function enableAntiAFK()
    -- Код анти-афк
end

local function startAutoFarm()
    -- Код автофарма
end

local function loadImage(url, speed)
    -- Код загрузки изображения
end

local function saveBuild(name)
    -- Код сохранения постройки
end

local function serverHop()
    -- Код смены сервера
end
