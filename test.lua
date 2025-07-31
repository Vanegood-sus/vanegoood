local plrs = game.Players
local plr = plrs.LocalPlayer

-- Загрузка UI библиотеки
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/source.lua", true))()

-- Создание главного окна
local win = ui:CreateWindow({
    Title = "Vanegood Hub",
    Icon = "terminal",
    Size = UDim2.fromOffset(500, 400),
    Theme = "Dark"
})

-- Вкладка Main (пустая)
local mainTab = win:Tab({
    Title = "Main",
    Icon = "home"
})

-- Вкладка Games (пустая)
local gamesTab = win:Tab({
    Title = "Games",
    Icon = "gamepad"
})

-- Принудительное отображение интерфейса
if game:GetService("CoreGui"):FindFirstChild("WindUI") then
    game:GetService("CoreGui").WindUI.Enabled = true
end
