local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library/main/Library", true))()

-- Создание главного окна со светло-серым цветом
local window = library:AddWindow("Vanegood Hub", {
    main_color = Color3.fromRGB(200, 200, 200), -- светло-серый
    min_size = Vector2.new(500, 400),
    can_resize = true
})

-- Основная вкладка (пустая)
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
