local NytrixUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Itzzavi335/Nytrix-UI-library/refs/heads/main/source.luau"))()

local MyWindow = NytrixUI:Window({
    Title = "Demo",
    Subtitle = "Preview",
    Theme = NytrixUI.Themes.Dark,
    Size = {Width = 580, Height = 400}
})

local MainTab = MyWindow:Tab("Main")

local AllElementsSection = MainTab:Section("All Elements")

AllElementsSection:Button("First Button", function()
    print("First button clicked")
end)

AllElementsSection:Toggle("First Toggle", false, function(state)
    print("First toggle:", state)
end)

AllElementsSection:Textbox("Username", "Enter name...", function(text)
    print("Username:", text)
end)

AllElementsSection:Dropdown("Weapon", {"Sword", "Gun", "Bow", "Staff"}, "Sword", function(selected)
    print("Weapon selected:", selected)
end)

AllElementsSection:Slider("Volume", 0, 100, 50, function(value)
    print("Volume:", value)
end)

AllElementsSection:Keybind("Menu Key", Enum.KeyCode.RightShift, function(key)
    print("Menu key:", key)
end)

AllElementsSection:Button("Second Button", function()
    print("Second button clicked")
end)

AllElementsSection:Toggle("Second Toggle", true, function(state)
    print("Second toggle:", state)
end)

AllElementsSection:Textbox("Password", "Enter password...", function(text)
    print("Password:", text)
end)

AllElementsSection:Dropdown("Difficulty", {"Easy", "Normal", "Hard", "Extreme"}, "Normal", function(selected)
    print("Difficulty:", selected)
end)

AllElementsSection:Slider("Speed", 1, 10, 5, function(value)
    print("Speed:", value)
end)

AllElementsSection:Keybind("Action Key", Enum.KeyCode.E, function(key)
    print("Action key:", key)
end)
