# NytrixUI library!

Loadstring
```lua
local NytrixUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Itzzavi335/Nytrix-UI-library/main/source.luau"))()
```

Create Window Here:
```lua
local MyWindow = NytrixUI:Window({
    Title = "Window Title",
    Subtitle = "Window Subtitle",
    Theme = NytrixUI.Themes.Dark,  -- Optional, defaults to Dark theme
    Size = {Width = 580, Height = 400}  -- Optional
})
```

AddTab:
```lua
local MainTab = MyWindow:Tab("Main")
```

AddSection:
```lua
local Section = MainTab:Section("Test")
```

AddButton:
```lua
MainTab:Button("Button Name", function()
    print("Button clicked!")
    -- Your code here
end)
```

AddTextbox:
```lua
CombatSection:Textbox("Input Label", "Placeholder text...", function(text)
    print("Text entered:", text)
    -- Process input
end)
```

AddToggle:
```lua
MainTab:Toggle("Toggle Name", false, function(state)
    print("Toggle state:", state)
    -- Your toggle logic
end)
```
AddSlider: No Mobile support, sorry!
```lua
MainTab:Slider("Slider Label", 0, 100, 50, function(value)
    print("Slider value:", value)
    -- Apply value
end)
```

AddKeybind:
```lua
MainTab:Keybind("Keybind Label", Enum.KeyCode.F, function(key)
    print("Keybind set to:", key)
    -- Bind key to function
end)
```

AddDropdown:
```lua
CombatSection:Dropdown("Dropdown Label", {"Option 1", "Option 2", "Option 3"}, "Option 1", function(selected)
    print("Selected:", selected)
    -- Handle selection
end)
```
