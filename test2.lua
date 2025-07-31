-- This is the old source
-- new source: loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/Jan25_Source.lua'))()

if game.PlaceId ~= 537413528 then
    return
end

task.spawn(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/MessageIssue.lua'))()
end)

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

for _, v in ipairs(previewFolder:GetChildren()) do
    v:Destroy()
end

task.delay(10, function()
    if game:GetService("CoreGui"):FindFirstChild("MSGISSUE") then
        game:GetService("CoreGui").MSGISSUE:Destroy()
    end
end)

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

local Window = Rayfield:CreateWindow({
    Name = "Build A Boat For Treasure",
    Icon = 85108798400826,
    LoadingTitle = "Build A Boat For Treasure",
    LoadingSubtitle = "Созданно vanegood,
    Theme = "DarkBlue",
 
    DisableRayfieldPrompts = true,
    DisableBuildWarnings = true,
 
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil,
       FileName = "Big Hub"
    },
 
local Global = Window:CreateTab("Меню", 125428076789049)
local ImageLoader = Window:CreateTab("Арт", 91865122737183)
local Miscellaneous = Window:CreateTab("Другое", 90305619538335)


local Paragraph = Global:CreateParagraph({Title = "Добро Пожаловать!", Content = "Тут фармилка"})
--local Paragraph = Global:CreateParagraph({Title = "vanegood", Content = "vanegood"})

local player = game.Players.LocalPlayer
local Nplayer = game.Players.LocalPlayer.Name

local characterConnection
local connection

Section = Global:CreateSection("Авто-Фарм")
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
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart") -- What are you looking for, basket ? :) no skid ;)

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

                wait(2.3) -- if lower, it can't work every time
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

                wait(2.3) -- if lower, it can't work every time
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
                       -- wait(2)
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


local FStats = Global:CreateParagraph({Title = "Stats", Content = "Elapsed time: -".."\n".."GoldBlock Gained: -".."\n".."Gold Gained: -".."\n".."\n".."Gold per hour: -"})

local clockTime = 0
local running = false
local totalGoldGained = 0
local Ftime = 0 
local totalGoldBlock = 0
local GoldPerHour = 0
local lastGoldValue = game:GetService("Players").LocalPlayer.Data.Gold.Value
local IGBLOCK = game:GetService("Players").LocalPlayer.Data.GoldBlock.Value

local function formatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local sec = seconds % 60
    return hours .. " hours " .. minutes .. " minutes " .. sec .. " seconds"
end

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

    
local BlockId = loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/BlockId.lua'))()

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

--[[
local Dropdownimg = ImageLoader:CreateDropdown({ --When shlex adds a script to refresh the dropdown
    Name = "Files",
    Options = ImageFiles,
    CurrentOption = {""},
    MultipleOptions = false,
    Flag = "",
    Callback = function(Options)
    end,
 })
--]]

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

function BuildingTool()
    game:GetService("Players").LocalPlayer.Backpack.BuildingTool.RF:InvokeServer("WoodBlock",58,workspace.BlackZone,CFrame.new(0, 6, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),true,CFrame.new(),false)
end

local imagePreviewFolder = workspace:FindFirstChild("ImagePreview") or Instance.new("Folder")
imagePreviewFolder.Name = "ImagePreview"
imagePreviewFolder.Parent = workspace

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

local function UUserBlockList()
    UserBlockList = {}
    for _, feuh in ipairs(dataFolder:GetChildren()) do
        if feuh.Value ~= nil then
            UserBlockList[feuh.Name] = feuh.Value
        end
    end
end

local function readFile(filePath)
    if not isfile(filePath) then
        return nil
    end
    return readfile(filePath)
end

local function parseColors(fileContent)
    local data = {}

    for value in string.gmatch(fileContent, "[^,]+") do
        value = value:match("^%s*(.-)%s*$")
        table.insert(data, tonumber(value) or value)
    end
    return data
end

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
            local WORLDPOS = part.Position
            local partRot = part.CFrame - part.Position
            local newCFrame = CFrame.new(math.random(-69, 69), math.random(-2200000, -120000), math.random(-69, 69))

            if getgenv().ImgLoaderStat == false then
                return
            end

            local BuildPath = player.Backpack:FindFirstChild("BuildingTool") or player.Character:FindFirstChild("BuildingTool")
            BuildPath.RF:InvokeServer(
                BlockType,
                uszLPBlockvalue,
                workspace:FindFirstChild(Zonesss),
                newCFrame,
                true
            )
        end)
    end

    TASK1 = true
    local blocks = workspace.Blocks:FindFirstChild(LNplayer):GetChildren()

    while #blocks < #parts do
        task.wait(0.5)
        blocks = workspace.Blocks:FindFirstChild(LNplayer):GetChildren()
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
            local WORLDPOS = part.Position
            local partRot = part.CFrame - part.Position
            local newwCFrame = CFrame.new(WORLDPOS) * partRot * CFrame.Angles(0, math.rad(90), 0)
            local targetBlock = blocks[TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong + i]

            if getgenv().ImgLoaderStat == false then
                return
            end
            
            local ScalePath = player.Backpack:FindFirstChild("ScalingTool") or player.Character:FindFirstChild("ScalingTool")
            ScalePath.RF:InvokeServer(
                targetBlock,
                Vector3.new(Bdepth, blockSize, blockSize),
                newwCFrame
            )
        end)
    end

    TASK2 = true
    ImgParts = workspace.ImagePreview:GetChildren()
    for i = 1, #parts + 1 do
        local color = ImgParts[i].Color
        table.insert(paintData, {
            blocks[TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong + i - 1],
            Color3.new(color.R, color.G, color.B)
        })
    end
    
    local PaintPath = player.Backpack:FindFirstChild("PaintingTool") or player.Character:FindFirstChild("PaintingTool")
    PaintPath.RF:InvokeServer(paintData)

    for _, part in ipairs(folder:GetChildren()) do
        part:destroy()
    end

    TASK3 = true
    if getgenv().ImgLoaderStat == false then
        task.delay(1, function()
            Rayfield:Notify({
                Title = "Image aborted",
                Content = "All unplaced blocks will be deleted",
                Duration = 6.5,
                Image = 124144713366592,
            })
        end)
    else
        task.delay(1, function()
            Rayfield:Notify({
                Title = "Image successfully loaded",
                Content = "You can now use your inventory again",
                Duration = 6.5,
                Image = 124144713366592,
            })
        end)
    end
    task.wait(0.15)
    TASK4 = true
    local remote = player.Character:FindFirstChild("DeleteTool") or player.Backpack:FindFirstChild("DeleteTool")
    for i = 1, #blocks do
        task.spawn(function()
            local block = blocks[i]
            if not block then
                return
            end

            local blockY = block.PrimaryPart and block.PrimaryPart.Position.Y or nil
            if blockY and blockY >= -2200000 and blockY <= -120000 then
                    remote.RF:InvokeServer(blocks[i])
            end
        end)
    end 
    TASK5 = true  
end

function onImgBlockSecChanged()
    getgenv().COCO = false
    wait(0.1)
    getgenv().COCO = true
    buildImage()
end

local function buildImagePREVIEW(data, blockSize)
    local frameSize = calculateFrameSize(data)
    startPosition = LPTEAM() + cooloffset
    ImgCenterimage = Centerimage(frameSize, startPosition, blockSize)
    local centerImage = workspace.ImagePreview.Centerimage
    if not centerImage then
        return
    end

    rotationCFrame = CFrame.Angles(0, math.rad(angleY - 90), 0)

    Brainrot = centerImage.CFrame * rotationCFrame
    local currentX = startPosition.X
    local currentY = startPosition.Y
    local currentZ = startPosition.Z
    local initialX = startPosition.X
    local dataIndex = 1

    local centerImage = workspace.ImagePreview.Centerimage
    if not centerImage then
        return
    end

    local centerCFrame = centerImage.CFrame

    if currentConnection then
        currentConnection:Disconnect()
    end

    currentConnection = RunService.Heartbeat:Connect(function()
        local finished = false
        for _ = 1, batchSize do
            if dataIndex > #data then
                finished = true
                break
            end

            local r, g, b = data[dataIndex], data[dataIndex + 1], data[dataIndex + 2]
            if r == "B" and g == "B" and b == "B" then
                currentX = initialX
                currentY = currentY - blockSize
            elseif r == "R" and g == "R" and b == "R" then
                currentX = currentX + blockSize
            elseif type(r) == "number" and type(g) == "number" and type(b) == "number" then

                local block = Instance.new("Part")
                block.Size = Vector3.new(blockSize, blockSize, Bdepth)
                block.Color = Color3.fromRGB(r, g, b)
                block.Anchored = true
                block.Material = Enum.Material.SmoothPlastic
                block.CastShadow = false
                block.Parent = previewFolder

                local blockPosition = Vector3.new(currentX, currentY, currentZ) + cooloffset
                local relativeCFrame = centerCFrame:ToObjectSpace(CFrame.new(blockPosition))
                block.CFrame = Brainrot * relativeCFrame
                currentX = currentX + blockSize
            end

            dataIndex += 3
        end

        if finished then
            currentConnection:Disconnect()
            currentConnection = nil
        end
    end)
end

Section = ImageLoader:CreateSection("Мигрант арта")

local ImageLoaderFile = ImageLoader:CreateLabel("Показать детали", 72272740678757, Color3.fromRGB(121, 188, 226), false)

local URL_RESO_VALUE = 4
local TBLOCK = 0
local BLKLD = 0
local FI = 0

local Input = ImageLoader:CreateInput({
    Name = "Ссылка",
    CurrentValue = "",
    PlaceholderText = "File/Url",
    RemoveTextAfterFocusLost = true,
    Flag = "Input1",
    Callback = function(Text)
        TBLOCK = 0
        BLKLD = 0
        TempData = {}
        USEURL= nil
        cooloffset = Vector3.new(0, 0, 0)
        Brainrot = CFrame.identity
        angleY = 0
        rotationCFrame = CFrame.Angles(0, 0, 0)
        local fileName = Text .. ".txt"
        local filePath = "BABFT/Image/" .. fileName

        ImageLoaderFile:Set("Fetching...", 72272740678757, Color3.fromRGB(121, 188, 226), false)

        if string.sub(Text, 1, 6) == "https:" then
            ImageLoaderFile:Set("Method: URL | Status: Fetching...", 110690411966110, Color3.fromRGB(121, 188, 226), false)

            local url = "https://therealasu.pythonanywhere.com/process_image" -- It is useless to DDOS it, all you're going to do is DDOS pythonanywhere which are protected against that, and the server doesn't cost me anything, it's free
            local headers = {
                ["Content-Type"] = "application/json"
            }

            local function getImageData(imageUrl, resolution)
                local body = HttpService:JSONEncode({
                    image_url = imageUrl,
                    resolution = resolution
                })

                local success, result = pcall(function()
                    return request({
                        Url = url,
                        Method = "POST",
                        Headers = headers,
                        Body = body
                    })
                end)

                if success then
                    if result.StatusCode == 200 then
                        local responseData = result.Body
                        return responseData
                    else
                        ImageLoaderFile:Set("Method: URL | Status: Error", 110690411966110, Color3.fromRGB(255, 66, 41), false)
                        return nil
                    end
                else
                    ImageLoaderFile:Set("Method: URL | Status: Error", 110690411966110, Color3.fromRGB(255, 66, 41), false)
                    Rayfield:Notify({
                        Title = "Error ",
                        Content = "Could not Fetch data",
                        Duration = 6.5,
                        Image = 124144713366592,
                    })
                    return nil
                end
            end

            local response = getImageData(Text, URL_RESO_VALUE)

            if response then
                local success, result = pcall(function()
                    return HttpService:JSONDecode(response)
                end)
                if success and result then
                    if result.error then
                        ImageLoaderFile:Set("Method: URL | Status: Error", 110690411966110, Color3.fromRGB(255, 66, 41), false)
                        Rayfield:Notify({
                            Title = "Error",
                            Content = "The API may be overloaded OR Url not supported , there's an alternative and a easy fix tutorial in the Discord server",
                            Duration = 6.5,
                            Image = 124144713366592,
                        })
                    else
                        USEURL = true
                        TempData = response
                        ImageLoaderFile:Set("Method: URL | Status: Fetched | You can enable preview", 110690411966110, Color3.fromRGB(133, 230, 138), false)
                        Rayfield:Notify({
                            Title = "Success!",
                            Content = "Your URL has been converted and is ready to use",
                            Duration = 6.5,
                            Image = 124144713366592,
                        })
                    end
                else
                    TempData = response
                    USEURL = true
                    ImageLoaderFile:Set("Method: URL | Status: Fetched | You can enable preview", 110690411966110, Color3.fromRGB(133, 230, 138), false) -- how the fk
                    Rayfield:Notify({
                        Title = "Success!",
                        Content = "Your URL has been converted and is ready to use",
                        Duration = 6.5,
                        Image = 124144713366592,
                    })
                    --[[
                    ImageLoaderFile:Set("Method: URL | Status: Error", 110690411966110, Color3.fromRGB(255, 66, 41), false)
                    Rayfield:Notify({
                        Title = "Error",
                        Content = "Failed to decode the server response. The url may not be supported or valid",
                        Duration = 6.5,
                        Image = 124144713366592,
                    })
                    ]]
                end
            else
                ImageLoaderFile:Set("Method: URL | Status: Error", 110690411966110, Color3.fromRGB(255, 66, 41), false)
                Rayfield:Notify({
                    Title = "Error",
                    Content = "The API may be overloaded OR Url not supported , there's an alternative and a easy fix tutorial in the Discord server",
                    Duration = 6.5,
                    Image = 124144713366592,
                })
            end
        else
            USEURL = false
            if isfile(filePath) then
                FileImage = fileName
                ImageLoaderFile:Set("Method: File | Status: Success | You can enable preview", 81435876451920, Color3.fromRGB(133, 230, 138), false)
                Rayfield:Notify({
                    Title = "Success!",
                    Content = "file: " .. fileName .. " found!",
                    Duration = 6.5,
                    Image = 124144713366592,
                })
            else
                FileImage = nil
                ImageLoaderFile:Set("Method: File | Status: Error", 81435876451920, Color3.fromRGB(255, 66, 41), false)
                Rayfield:Notify({
                    Title = "Error | File not found",
                    Content = "Make sure the file " .. fileName .. " exists or the URL is valid, do not put '.txt' in the TextBox",
                    Duration = 6.5,
                    Image = 124144713366592,
                })
            end
        end
    end,
})

local Input = ImageLoader:CreateInput({
    Name = "Высота",
    CurrentValue = "4",
    PlaceholderText = "Number",
    RemoveTextAfterFocusLost = false,
    Flag = "Input1",
    Callback = function(Nb)
        URL_RESO_VALUE = tostring(Nb)
    end,
})

local success, result = pcall(function()
    return request({
        Url = "https://therealasu.pythonanywhere.com/IsActive",
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"
        },
        Body = nil
    })
end)

if success then
    if result.StatusCode == 200 then
        print("Image Loader api is active!")
    else
        warn("Image Loader api is not active")
        return nil
    end
end

ImageLoader:CreateDivider()

ImageLoader:CreateSection("Preview")

local TogglePreview = ImageLoader:CreateToggle({
    Name = "Превью",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            BLKLD = 0
            TBLOCK = 0
            local filePath = "BABFT/Image/" .. (FileImage or "default.txt")
            local fileContent = {}
            if USEURL == false then
                fileContent = readFile(filePath)
            else
                fileContent = TempData
            end
            if not fileContent then return end
            local data
                data = parseColors(fileContent)
            buildImagePREVIEW(data, blockSize)
        else
            for _, skibidi in ipairs(previewFolder:GetChildren()) do
                if skibidi.Name ~= "PreviewSize" then
                    skibidi:Destroy()
                end
            end
        end
    end,
})

local ToggleGrid = ImageLoader:CreateToggle({
    Name = "Сетка",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            local filePath = "BABFT/Image/" .. (FileImage or "default.txt")
            local fileContent = {}
            if USEURL == false then
                fileContent = readFile(filePath)
            else
                fileContent = TempData
            end
            if not fileContent then return end
            local data = parseColors(fileContent)
            local frameSize = calculateFrameSize(data)
            startPosition = LPTEAM()
            previewFrame(frameSize, startPosition, blockSize)
        else
            if PreviewPart then
                PreviewPart:Destroy()
                PreviewPart = nil
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "No file or invalid file",
                    Duration = 6.5,
                    Image = 124144713366592,
                 })
            end
        end
    end,
})

local Slider = ImageLoader:CreateSlider({
    Name = "Скорость",
    Range = {100, 4000},
    Increment = 25,
    Suffix = "block/sec",
    CurrentValue = 750,
    Flag = "",
    Callback = function(Value)
        batchSize = Value
    end,
 })

 local Divider = ImageLoader:CreateDivider()

Section = ImageLoader:CreateSection("modifiers")

 local Dropdown = ImageLoader:CreateDropdown({
    Name = "Тип блока",
    Options = {
        "BrickBlock", 
        "CoalBlock", 
        "ConcreteBlock", 
        "FabricBlock", 
        "GlassBlock", 
        "GoldBlock", 
        "GrassBlock", 
        "IceBlock", 
        "MarbleBlock", 
        "MetalBlock", 
        "NeonBlock", 
        "ObsidianBlock", 
        "PlasticBlock", 
        "RustedBlock", 
        "SmoothWoodBlock", 
        "StoneBlock", 
        "TitaniumBlock", 
        "ToyBlock", 
        "WoodBlock"
    },
    CurrentOption = {"PlasticBlock"},
    MultipleOptions = false,
    Flag = "",
    Callback = function(Options)
        BlockType = Options[1]
    end,
})

 local Input = ImageLoader:CreateInput({
    Name = "Двигать",
    CurrentValue = "45",
    PlaceholderText = "number",
    RemoveTextAfterFocusLost = false,
    Flag = "Input1",
    Callback = function(Text)
        Unit = tostring(Text)
    end,
 })

local originalCFrames = {}

local Input = ImageLoader:CreateInput({
    Name = "Перевернуть",
    CurrentValue = "0",
    PlaceholderText = "0 - 360",
    RemoveTextAfterFocusLost = false,
    Flag = "",
    Callback = function(Text)
        angleY = tonumber(Text)
        if not angleY then
            return
        end

        local centerImage = workspace.ImagePreview.Centerimage
        if not centerImage then
            return
        end

        local rotationCFrame = CFrame.Angles(0, math.rad(angleY), 0)

        Brainrot = centerImage.CFrame * rotationCFrame

        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            if skibidi:IsA("BasePart") and skibidi ~= centerImage then

                local centerCFrame = centerImage.CFrame

                if not originalCFrames[skibidi] then
                    originalCFrames[skibidi] = skibidi.CFrame
                end

                local originalCFrame = originalCFrames[skibidi]
                local relativeCFrame = centerCFrame:ToObjectSpace(originalCFrame)

                local ghaaa = centerCFrame * rotationCFrame * relativeCFrame
                skibidi.CFrame = ghaaa
            end
        end
    end,
})

 local Input = ImageLoader:CreateInput({
    Name = "Глубина",
    CurrentValue = "2",
    PlaceholderText = "Value",
    RemoveTextAfterFocusLost = false,
    Flag = "",
    Callback = function(Text)
        Bdepth = tonumber(Text)
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Size = Vector3.new(skibidi.Size.X, skibidi.Size.Y, Bdepth)
            end
    end,
 })

 local Slider = ImageLoader:CreateSlider({
    Name = "Рост",
    Range = {0.1, 10},
    Increment = 0.1,
    Suffix = "x",
    CurrentValue = 2,
    Flag = "",
    Callback = function(Value)
        blockSize = Value
    end,
 })

 local Button = ImageLoader:CreateButton({
    Name = "Move +X",
    Callback = function()
    for _, skibidi in ipairs(previewFolder:GetChildren()) do
        skibidi.Position = skibidi.Position + Vector3.new(Unit, 0, 0)
        end
        cooloffset = cooloffset + Vector3.new(Unit, 0, 0)
    end,
 })

 local Button = ImageLoader:CreateButton({
    Name = "Move -X",
    Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(-Unit, 0, 0)
            end
            cooloffset = cooloffset + Vector3.new(-Unit, 0, 0)
    end,
 })

 local Button = ImageLoader:CreateButton({
    Name = "Move +Y",
    Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(0, Unit, 0)
            end
            cooloffset = cooloffset + Vector3.new(0, Unit, 0)
    end,
 })

 local Button = ImageLoader:CreateButton({
    Name = "Move -Y",
    Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(0, -Unit, 0)
            end
            cooloffset = cooloffset + Vector3.new(0, -Unit, 0)
    end,
 })

 local Button = ImageLoader:CreateButton({
    Name = "Move +Z",
    Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(0, 0, Unit)
            end
            cooloffset = cooloffset + Vector3.new(0, 0, Unit)
    end,
 })

 local Button = ImageLoader:CreateButton({
    Name = "Move -Z",
    Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(0, 0, -Unit)
            end
            cooloffset = cooloffset + Vector3.new(0, 0, -Unit)
    end,
 })

local Divider = ImageLoader:CreateDivider()

local TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneChangeLol = 0
local TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneDoesntChangeLol = 0

local ImgStatsP = ImageLoader:CreateParagraph({Title = "Information", Content = "Require PaintTool and ScalingTool"})

 local Button = ImageLoader:CreateButton({
    Name = "Построить",
    Callback = function()
        Rayfield:Notify({
            Title = "Image Loader",
            Content = "DO NOT place blocks until finished",
            Duration = 10,
            Image = 124144713366592,
         })

         TBLOCK = 0
TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong = 0

local blocksFolder = workspace:FindFirstChild("Blocks")
if blocksFolder then
    local blockssFolder = blocksFolder:FindFirstChild(Nplayer)
    if blockssFolder then
        TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong = #blockssFolder:GetChildren()
        TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneDoesntChangeLol = #blockssFolder:GetChildren()
        local parts = {}
        local folder = workspace:FindFirstChild("ImagePreview")
        for _, part in ipairs(folder:GetChildren()) do
            if part:IsA("BasePart") and part.Name == "Part" then
                table.insert(parts, part)
            end
        end
        TBLOCK = #parts
    else
            Rayfield:Notify({
                Title = "Error",
                Content = "Folder not found, try rejoin",
                Duration = 6.5,
                Image = 124144713366592,
             })
    end
else
        Rayfield:Notify({
            Title = "Ошибка",
            Content = "Folder not found, try rejoin",
            Duration = 6.5,
            Image = 124144713366592,
         })
end
        BlockLoaded = false
        getgenv().ImgLoaderStat = true
        task.spawn(buildImageFAST)
    end,
 })

 local Button = ImageLoader:CreateButton({
    Name = "Прервать",
    Callback = function()
        getgenv().ImgLoaderStat = false
        Rayfield:Notify({
            Title = "Abortion request",
            Content = "the next task will not be applied, note that this button is only useful during the task where blocks are loaded",
            Duration = 6.5,
            Image = 124144713366592,
        })
    end,
 })

local Label = ImageLoader:CreateLabel("Building speed will also depend on your ping. You can crash if your wifi speed is too slow.", 134637165939940, Color3.fromRGB(204, 156, 0), true)

local Label = ImageLoader:CreateLabel("the image may not load if many blocks have already been placed, I have to fix this", 134637165939940, Color3.fromRGB(204, 156, 0), true)

function ImgStats()
    local startTime = tick()
    while true do
        local blocksFolder = workspace:FindFirstChild("Blocks")
        local blockssFolder = blocksFolder:FindFirstChild(Nplayer)
        local totalBlocks = #blockssFolder:GetChildren()
        local BLKLD = totalBlocks - TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneDoesntChangeLol
        local elapsedTime = tick() - startTime
        local blocksPerSecond = BLKLD / elapsedTime
        local blocksRemaining = TBLOCK - BLKLD
        local timeRemaining = blocksRemaining / blocksPerSecond
        local FI = math.max(timeRemaining, 0)
        if not BlockLoaded then
        ImgStatsP:Set({
            Title = "Information",
            Content = "Blocks Loaded: "..BLKLD.."/"..TBLOCK..
                      "\nFinish in: " .. math.floor(FI) .. "s"
        })
        if BLKLD >= TBLOCK then
            BlockLoaded = true
        end
        end
        task.wait(1.2)
    end
end

function ImgStats2()
    while true do
        if BlockLoaded then
    if TASK1  then
        ImgStatsP:Set({
            Title = "Information",
            Content = "Blocks Loaded!\nPlacing Blocks..."
        })
        TASK1 = false
    elseif TASK2  then
        ImgStatsP:Set({
            Title = "Information",
            Content = "Blocks Loaded!\nPlacing Blocks..."
        })
        TASK2 = false
    elseif TASK3  then
        ImgStatsP:Set({
            Title = "Information",
            Content = "Blocks Loaded!\nBlocks Placed!\nColoring Blocks..."
        })
        TASK3 = false
    elseif TASK4  then
        ImgStatsP:Set({
            Title = "Information",
            Content = "Blocks Loaded!\nBlocks Placed!\nBlocks Colored!\ndeleting unplaced blocks..."
        })
        TASK4 = false
    elseif TASK5  then
        ImgStatsP:Set({
            Title = "Information",
            Content = "Blocks Loaded!\nBlocks Placed!\nBlocks Colored!\nUnplaced blocks deleted!\nProcess end"
        })
        TASK5 = false
    end
end
    wait(0.2)
end
end


local initimgfilesbool = false
 function initimgfiles()
    while initimgfilesbool == true do
        updateImageFiles()
        wait(1)
    end
end

Section = Miscellaneous:CreateSection("Телепорт")

local Button = Miscellaneous:CreateButton({
    Name = "Белая",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-49.8510132, -9.7000021, -520.37085, -1, 0, 0, 0, 1, 0, 0, 0, -1))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "Черная",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-503.82843, -9.7000021, -69.433342, 0, 0, -1, 0, 1, 0, 1, 0, 0))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "Красная",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(396.697418, -9.7000021, -64.7801361, 0, 0, 1, 0, 1, -0, -1, 0, 0))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "Синяя",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(396.697418, -9.7000021, 300.219849, 0, 0, 1, 0, 1, -0, -1, 0, 0))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "Розовая",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(396.697418, -9.7000021, 647.219849, 0, 0, 1, 0, 1, -0, -1, 0, 0))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "Желтая",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-503.82843, -9.7000021, 640.56665, 0, 0, -1, 0, 1, 0, 1, 0, 0))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "Зеленая",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-503.82843, -9.7000021, 293.56665, 0, 0, -1, 0, 1, 0, 1, 0, 0))
    end,
 })

Section = Miscellaneous:CreateToggle("Troll")

local Toggle = Miscellaneous:CreateToggle({
    Name = "Игнорировать изоляцию",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        counterIsoMODE = Value
        if counterIsoMODE then
            Rayfield:Notify({
                Title = "Полный игнор",
                Content = "Не спрячешься",
                Duration = 6.5,
                Image = 124144713366592,
             })
            else
                Rayfield:Notify({
                    Title = "Полный игнор",
                    Content = "Не спрячешься",
                    Duration = 6.5,
                    Image = 124144713366592,
                 })
        end
    end,
})

Section = Miscellaneous:CreateSection("Локации")
 local Button = Miscellaneous:CreateButton({
    Name = "Пасха",
    Callback = function()
        TeleportService:Teleport(1930863474, game.Players.LocalPlayer)
    end,
 })

Button = Miscellaneous:CreateButton({
    Name = "Новый Год",
    Callback = function()
        TeleportService:Teleport(1930866268, game.Players.LocalPlayer)
    end,
 })

local function Init()
local initclock = coroutine.create(initclock)
local ImgStats = coroutine.create(ImgStats)
local initimgfiles = coroutine.create(initimgfiles)
local ImgStats2 = coroutine.create(ImgStats2)

coroutine.resume(initclock)
coroutine.resume(ImgStats)
coroutine.resume(initimgfiles)
coroutine.resume(ImgStats2)
end

zdzddz = Miscellaneous:CreateButton({
    Name = "Хэллоуин",
    Callback = function()
        TeleportService:Teleport(1930665568, game.Players.LocalPlayer) -- WARNING: YOU WILL GET KICKED WHEN YOU JOIN IT, need to try with a client-sided anti kick
    end,
 })

-- queueteleport(loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/Source.lua'))())

Init()
