--!nocheck
--!nolint

if string.split(identifyexecutor() or "None", " ")[1] == "Xeno" then
	getgenv().WebSocket = nil
end

local scripturl = "https://api.luarmor.net/files/v3/loaders/80b606551d4b7075eb3e229d6f68e4df.lua"
local repo: string = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local showGUI = true

if not isfolder("PonPon") then
    makefolder("PonPon")
end

if isfile("PonPon/key.txt") then
    local file = readfile("PonPon/key.txt")
    if file == "donut" then
        loadstring(game:HttpGet(scripturl))()
        showGUI = false
    end
end

if showGUI then
    local Obsidian: any = loadstring(game:HttpGet(repo .. "Library.lua"))()

    local Window = Obsidian:CreateWindow({
        Title = "Ponchyk",
        Footer = "hi",
        ToggleKeybind = Enum.KeyCode.F8,
        SetMobileButtonSide = "Left",
        DisableSearch = true,
        ShowCustomCursor = false,
        Icon = 10890456172,
        IconSize = UDim2.fromOffset(40, 40),
        Size = UDim2.fromOffset(400, 300),
        Center = true,
        AutoShow = true
    })

    local Tabs = {
        KeyTab = Window:AddKeyTab("Key", "key"),
    }

    Tabs.KeyTab:AddLabel({
        Text = "Ponckyk Key System",
        DoesWrap = true,
        Size = 20,
    })

    Tabs.KeyTab:AddLabel({
        Text = "Get key from discord.gg/xR8quQRm7d",
        DoesWrap = true,
        Size = 17,
    })

    Tabs.KeyTab:AddButton({
        Text = "Copy Discord Link",
        Func = function()
            setclipboard("discord.gg/xR8quQRm7d")
            Obsidian:Notify("Copied to clipboard!", 10)
        end
    })

    Tabs.KeyTab:AddKeyBox(function(ReceivedKey)
        if ReceivedKey == "donut" then
            writefile("PonPon/key.txt", ReceivedKey)
            Obsidian:Unload()
            loadstring(game:HttpGet(scripturl))()
        else
            Obsidian:Notify("Wrong key.", 5)
        end
    end)
end
