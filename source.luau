
local NytrixUI = {
    Windows = {},
    Elements = {},
    Themes = {
        Dark = {
            Background = Color3.fromRGB(10, 10, 10),
            Secondary = Color3.fromRGB(20, 20, 20),
            Accent = Color3.fromRGB(170, 0, 255),
            Text = Color3.fromRGB(255, 255, 255),
            SubText = Color3.fromRGB(180, 180, 180)
        }
    }
}

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

function NytrixUI:Window(config)
    local window = {
        Tabs = {},
        TabObjects = {},
        CurrentTab = nil,
        Elements = {}
    }
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NytrixUI"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = player:WaitForChild("PlayerGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, config.Size.Width or 580, 0, config.Size.Height or 400)
    MainFrame.Position = UDim2.new(0.5, -(config.Size.Width or 580)/2, 0.5, -(config.Size.Height or 400)/2)
    MainFrame.BackgroundColor3 = config.Theme.Background or self.Themes.Dark.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame

    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, config.Theme.Background or self.Themes.Dark.Background),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 10))
    })
    Gradient.Rotation = 45
    Gradient.Parent = MainFrame

    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.Size = UDim2.new(1, 24, 1, 24)
    Shadow.Position = UDim2.new(0, -12, 0, -12)
    Shadow.BackgroundTransparency = 1
    Shadow.Image = "rbxassetid://1316045217"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.9
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    Shadow.Parent = MainFrame

    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 40)
    TitleBar.BackgroundColor3 = config.Theme.Secondary or self.Themes.Dark.Secondary
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame

    local TitleBarCorner = Instance.new("UICorner")
    TitleBarCorner.CornerRadius = UDim.new(0, 12)
    TitleBarCorner.Parent = TitleBar

    local TitleText = Instance.new("TextLabel")
    TitleText.Name = "TitleText"
    TitleText.Size = UDim2.new(1, -60, 0, 20)
    TitleText.Position = UDim2.new(0, 15, 0, 5)
    TitleText.BackgroundTransparency = 1
    TitleText.Text = config.Title or "Nytrix UI"
    TitleText.TextColor3 = config.Theme.Text or self.Themes.Dark.Text
    TitleText.TextSize = 16
    TitleText.Font = Enum.Font.GothamBold
    TitleText.TextXAlignment = Enum.TextXAlignment.Left
    TitleText.Parent = TitleBar

    local SubtitleText = Instance.new("TextLabel")
    SubtitleText.Name = "SubtitleText"
    SubtitleText.Size = UDim2.new(1, -60, 0, 15)
    SubtitleText.Position = UDim2.new(0, 15, 0, 22)
    SubtitleText.BackgroundTransparency = 1
    SubtitleText.Text = config.Subtitle or "Subtitle"
    SubtitleText.TextColor3 = config.Theme.SubText or self.Themes.Dark.SubText
    SubtitleText.TextSize = 11
    SubtitleText.Font = Enum.Font.GothamBold
    SubtitleText.TextXAlignment = Enum.TextXAlignment.Left
    SubtitleText.Parent = TitleBar

    local ThreeDotsContainer = Instance.new("Frame")
    ThreeDotsContainer.Name = "ThreeDotsContainer"
    ThreeDotsContainer.Size = UDim2.new(0, 60, 0, 30)
    ThreeDotsContainer.Position = UDim2.new(1, -65, 0, 5)
    ThreeDotsContainer.BackgroundTransparency = 1
    ThreeDotsContainer.Parent = TitleBar

    local Dot1 = Instance.new("TextButton")
    Dot1.Name = "YellowDot"
    Dot1.Size = UDim2.new(0, 12, 0, 12)
    Dot1.Position = UDim2.new(0, 0, 0.5, -6)
    Dot1.BackgroundColor3 = Color3.fromRGB(255, 204, 0)
    Dot1.BorderSizePixel = 0
    Dot1.Text = ""
    Dot1.Parent = ThreeDotsContainer

    local Dot1Corner = Instance.new("UICorner")
    Dot1Corner.CornerRadius = UDim.new(1, 0)
    Dot1Corner.Parent = Dot1

    local Dot2 = Instance.new("TextButton")
    Dot2.Name = "GreenDot"
    Dot2.Size = UDim2.new(0, 12, 0, 12)
    Dot2.Position = UDim2.new(0, 16, 0.5, -6)
    Dot2.BackgroundColor3 = Color3.fromRGB(0, 204, 0)
    Dot2.BorderSizePixel = 0
    Dot2.Text = ""
    Dot2.Parent = ThreeDotsContainer

    local Dot2Corner = Instance.new("UICorner")
    Dot2Corner.CornerRadius = UDim.new(1, 0)
    Dot2Corner.Parent = Dot2

    local Dot3 = Instance.new("TextButton")
    Dot3.Name = "RedDot"
    Dot3.Size = UDim2.new(0, 12, 0, 12)
    Dot3.Position = UDim2.new(0, 32, 0.5, -6)
    Dot3.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Dot3.BorderSizePixel = 0
    Dot3.Text = ""
    Dot3.Parent = ThreeDotsContainer

    local Dot3Corner = Instance.new("UICorner")
    Dot3Corner.CornerRadius = UDim.new(1, 0)
    Dot3Corner.Parent = Dot3

    Dot1.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        task.wait(2)
        MainFrame.Visible = true
    end)

    Dot2.MouseButton1Click:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
    end)

    Dot3.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
        self.Windows[config.Title] = nil
    end)

    local TabsContainer = Instance.new("Frame")
    TabsContainer.Name = "TabsContainer"
    TabsContainer.Size = UDim2.new(1, -20, 0, 28)
    TabsContainer.Position = UDim2.new(0, 10, 0, 45)
    TabsContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TabsContainer.BorderSizePixel = 0
    TabsContainer.Parent = MainFrame

    local TabsCorner = Instance.new("UICorner")
    TabsCorner.CornerRadius = UDim.new(0, 8)
    TabsCorner.Parent = TabsContainer

    local ContentFrame = Instance.new("Frame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Size = UDim2.new(1, -20, 1, -88)
    ContentFrame.Position = UDim2.new(0, 10, 0, 78)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.Parent = MainFrame

    local tabFrames = {}
    local tabButtons = {}
    
    function window:Tab(name)
        local tab = {
            Name = name,
            Sections = {},
            Elements = {}
        }
        
        table.insert(self.Tabs, name)
        self.TabObjects[name] = tab

        -- FIXED: Use fixed width for tab buttons instead of dividing space
        local TAB_WIDTH = 70  -- Fixed width for each tab
        local TAB_SPACING = 5  -- Space between tabs
        local totalTabs = #self.Tabs
        
        -- Calculate position for this tab
        local positionX = 5  -- Start with some padding
        for i, tabName in ipairs(self.Tabs) do
            if tabName == name then
                break
            end
            positionX = positionX + TAB_WIDTH + TAB_SPACING
        end
        
        local TabButton = Instance.new("TextButton")
        TabButton.Name = name .. "Tab"
        TabButton.Size = UDim2.new(0, TAB_WIDTH, 0.8, 0)  -- Fixed width, 80% height
        TabButton.Position = UDim2.new(0, positionX, 0.1, 0)  -- 10% from top
        TabButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        TabButton.BorderSizePixel = 0
        TabButton.Text = name
        TabButton.TextColor3 = totalTabs == 1 and (config.Theme.Text or self.Themes.Dark.Text) or Color3.fromRGB(150, 150, 150)
        TabButton.TextSize = 11
        TabButton.Font = Enum.Font.GothamBold
        TabButton.Parent = TabsContainer
        
        tabButtons[name] = TabButton
        
        local TabHighlight = Instance.new("Frame")
        TabHighlight.Name = "Highlight"
        TabHighlight.Size = UDim2.new(1, 0, 0, 2)
        TabHighlight.Position = UDim2.new(0, 0, 1, -2)
        TabHighlight.BackgroundColor3 = config.Theme.Accent or self.Themes.Dark.Accent
        TabHighlight.BorderSizePixel = 0
        TabHighlight.Visible = totalTabs == 1
        TabHighlight.Parent = TabButton
        
        local HighlightCorner = Instance.new("UICorner")
        HighlightCorner.CornerRadius = UDim.new(0, 1)
        HighlightCorner.Parent = TabHighlight
        
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = name .. "Content"
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.Position = UDim2.new(0, 0, 0, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.BorderSizePixel = 0
        TabContent.ScrollBarThickness = 3
        TabContent.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
        TabContent.ScrollBarImageTransparency = 0.5
        TabContent.Visible = totalTabs == 1
        TabContent.Parent = ContentFrame
        
        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Padding = UDim.new(0, 8)
        UIListLayout.Parent = TabContent
        
        tabFrames[name] = TabContent
        
        if totalTabs == 1 then
            self.CurrentTab = name
        end
        
        TabButton.MouseButton1Click:Connect(function()
            if self.CurrentTab == name then return end
            
            self.CurrentTab = name
            
            for tabName, frame in pairs(tabFrames) do
                frame.Visible = false
            end
            
            TabContent.Visible = true
            
            for tabName, btn in pairs(tabButtons) do
                if tabName == name then
                    btn.TextColor3 = config.Theme.Text or self.Themes.Dark.Text
                    if btn:FindFirstChild("Highlight") then
                        btn.Highlight.Visible = true
                        TweenService:Create(btn.Highlight, TweenInfo.new(0.2), {
                            BackgroundColor3 = config.Theme.Accent or self.Themes.Dark.Accent
                        }):Play()
                    end
                else
                    btn.TextColor3 = Color3.fromRGB(150, 150, 150)
                    if btn:FindFirstChild("Highlight") then
                        btn.Highlight.Visible = false
                    end
                end
            end
        end)
        
        TabButton.MouseEnter:Connect(function()
            if self.CurrentTab ~= name then
                TweenService:Create(TabButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                }):Play()
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if self.CurrentTab ~= name then
                TweenService:Create(TabButton, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                }):Play()
            end
        end)
        
        TabContent.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, TabContent.UIListLayout.AbsoluteContentSize.Y + 10)
        end)
        
        function tab:Section(title)
            local section = {
                Title = title,
                Elements = {},
                ElementOrder = 0
            }
            
            local Section = Instance.new("Frame")
            Section.Name = title .. "Section"
            Section.Size = UDim2.new(1, 0, 0, 60)
            Section.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Section.BorderSizePixel = 0
            Section.LayoutOrder = section.ElementOrder
            
            local SectionCorner = Instance.new("UICorner")
            SectionCorner.CornerRadius = UDim.new(0, 8)
            SectionCorner.Parent = Section

            local AccentLine = Instance.new("Frame")
            AccentLine.Name = "AccentLine"
            AccentLine.Size = UDim2.new(1, 0, 0, 2)
            AccentLine.Position = UDim2.new(0, 0, 0, 0)
            AccentLine.BackgroundColor3 = config.Theme.Accent or self.Themes.Dark.Accent
            AccentLine.BorderSizePixel = 0
            AccentLine.Parent = Section
            
            local AccentCorner = Instance.new("UICorner")
            AccentCorner.CornerRadius = UDim.new(0, 2)
            AccentCorner.Parent = AccentLine
            
            local SectionHeader = Instance.new("Frame")
            SectionHeader.Name = "Header"
            SectionHeader.Size = UDim2.new(1, 0, 0, 25)
            SectionHeader.Position = UDim2.new(0, 0, 0, 2)
            SectionHeader.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            SectionHeader.BorderSizePixel = 0
            SectionHeader.Parent = Section
            
            local HeaderCorner = Instance.new("UICorner")
            HeaderCorner.CornerRadius = UDim.new(0, 8)
            HeaderCorner.Parent = SectionHeader

            local SectionTitle = Instance.new("TextLabel")
            SectionTitle.Name = "Title"
            SectionTitle.Size = UDim2.new(1, -10, 1, 0)
            SectionTitle.Position = UDim2.new(0, 10, 0, 0)
            SectionTitle.BackgroundTransparency = 1
            SectionTitle.Text = title
            SectionTitle.TextColor3 = config.Theme.Text or self.Themes.Dark.Text
            SectionTitle.TextSize = 11
            SectionTitle.Font = Enum.Font.GothamBold
            SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
            SectionTitle.Parent = SectionHeader
            
            local ContentContainer = Instance.new("Frame")
            ContentContainer.Name = "Content"
            ContentContainer.Size = UDim2.new(1, -10, 1, -32)
            ContentContainer.Position = UDim2.new(0, 5, 0, 27)
            ContentContainer.BackgroundTransparency = 1
            ContentContainer.Parent = Section
            
            local ContentLayout = Instance.new("UIListLayout")
            ContentLayout.Padding = UDim.new(0, 5)
            ContentLayout.Parent = ContentContainer
            
            Section.Parent = TabContent
            
            ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                Section.Size = UDim2.new(1, 0, 0, math.max(50, ContentLayout.AbsoluteContentSize.Y + 35))
            end)
            
            -- BUTTON
            function section:Button(text, callback)
                section.ElementOrder = section.ElementOrder + 1
                local Button = Instance.new("TextButton")
                Button.Name = text .. "Button"
                Button.Size = UDim2.new(1, 0, 0, 30)
                Button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                Button.BorderSizePixel = 0
                Button.Text = text
                Button.TextColor3 = config.Theme.Text or self.Themes.Dark.Text
                Button.TextSize = 12
                Button.Font = Enum.Font.GothamBold
                Button.LayoutOrder = section.ElementOrder
                
                local ButtonCorner = Instance.new("UICorner")
                ButtonCorner.CornerRadius = UDim.new(0, 6)
                ButtonCorner.Parent = Button

                Button.MouseButton1Click:Connect(callback)
                
                Button.MouseEnter:Connect(function()
                    TweenService:Create(Button, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(100, 100, 100)
                    }):Play()
                end)
                
                Button.MouseLeave:Connect(function()
                    TweenService:Create(Button, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                    }):Play()
                end)
                
                Button.Parent = ContentContainer
                return Button
            end
            
            -- TOGGLE
            function section:Toggle(text, default, callback)
                section.ElementOrder = section.ElementOrder + 1
                local ToggleContainer = Instance.new("Frame")
                ToggleContainer.Name = text .. "Toggle"
                ToggleContainer.Size = UDim2.new(1, 0, 0, 22)
                ToggleContainer.BackgroundTransparency = 1
                ToggleContainer.LayoutOrder = section.ElementOrder
                
                local ToggleLabel = Instance.new("TextLabel")
                ToggleLabel.Name = "Label"
                ToggleLabel.Size = UDim2.new(1, -35, 1, 0)
                ToggleLabel.BackgroundTransparency = 1
                ToggleLabel.Text = text
                ToggleLabel.TextColor3 = config.Theme.Text or self.Themes.Dark.Text
                ToggleLabel.TextSize = 11
                ToggleLabel.Font = Enum.Font.GothamBold
                ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
                ToggleLabel.Parent = ToggleContainer
                
                local ToggleButton = Instance.new("TextButton")
                ToggleButton.Name = "Toggle"
                ToggleButton.Size = UDim2.new(0, 35, 0, 18)
                ToggleButton.Position = UDim2.new(1, -35, 0.5, -9)
                ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                ToggleButton.BorderSizePixel = 0
                ToggleButton.Text = ""
                
                local ToggleCorner = Instance.new("UICorner")
                ToggleCorner.CornerRadius = UDim.new(1, 0)
                ToggleCorner.Parent = ToggleButton
                
                local ToggleDot = Instance.new("Frame")
                ToggleDot.Name = "Dot"
                ToggleDot.Size = UDim2.new(0, 14, 0, 14)
                ToggleDot.Position = UDim2.new(0, 2, 0, 2)
                ToggleDot.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                ToggleDot.BorderSizePixel = 0
                
                local DotCorner = Instance.new("UICorner")
                DotCorner.CornerRadius = UDim.new(1, 0)
                DotCorner.Parent = ToggleDot
                
                ToggleDot.Parent = ToggleButton
                ToggleButton.Parent = ToggleContainer
                
                local isToggled = default or false
                
                local function updateToggle()
                    if isToggled then
                        TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
                            BackgroundColor3 = config.Theme.Accent or self.Themes.Dark.Accent
                        }):Play()
                        TweenService:Create(ToggleDot, TweenInfo.new(0.2), {
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            Position = UDim2.new(1, -16, 0, 2)
                        }):Play()
                    else
                        TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
                            BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                        }):Play()
                        TweenService:Create(ToggleDot, TweenInfo.new(0.2), {
                            BackgroundColor3 = Color3.fromRGB(150, 150, 150),
                            Position = UDim2.new(0, 2, 0, 2)
                        }):Play()
                    end
                    callback(isToggled)
                end
                
                ToggleButton.MouseButton1Click:Connect(function()
                    isToggled = not isToggled
                    updateToggle()
                end)
                
                updateToggle()
                ToggleContainer.Parent = ContentContainer
                return ToggleContainer
            end
            
            -- TEXTBOX
            function section:Textbox(text, placeholder, callback)
                section.ElementOrder = section.ElementOrder + 1
                local InputContainer = Instance.new("Frame")
                InputContainer.Name = text .. "Input"
                InputContainer.Size = UDim2.new(1, 0, 0, 45)
                InputContainer.BackgroundTransparency = 1
                InputContainer.LayoutOrder = section.ElementOrder
                
                local InputLabel = Instance.new("TextLabel")
                InputLabel.Name = "Label"
                InputLabel.Size = UDim2.new(1, 0, 0, 16)
                InputLabel.BackgroundTransparency = 1
                InputLabel.Text = text
                InputLabel.TextColor3 = config.Theme.Text or self.Themes.Dark.Text
                InputLabel.TextSize = 10
                InputLabel.Font = Enum.Font.GothamBold
                InputLabel.TextXAlignment = Enum.TextXAlignment.Left
                InputLabel.Parent = InputContainer
                
                local TextBox = Instance.new("TextBox")
                TextBox.Name = "Input"
                TextBox.Size = UDim2.new(1, 0, 0, 25)
                TextBox.Position = UDim2.new(0, 0, 0, 18)
                TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                TextBox.BorderSizePixel = 0
                TextBox.Text = ""
                TextBox.PlaceholderText = placeholder
                TextBox.TextColor3 = config.Theme.Text or self.Themes.Dark.Text
                TextBox.TextSize = 11
                TextBox.Font = Enum.Font.GothamBold
                TextBox.ClearTextOnFocus = false
                
                local TextBoxCorner = Instance.new("UICorner")
                TextBoxCorner.CornerRadius = UDim.new(0, 6)
                TextBoxCorner.Parent = TextBox

                TextBox.Focused:Connect(function()
                    TweenService:Create(TextBox, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(50, 40, 60)
                    }):Play()
                end)
                
                TextBox.FocusLost:Connect(function()
                    TweenService:Create(TextBox, TweenInfo.new(0.2), {
                        BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    }):Play()
                    callback(TextBox.Text)
                end)
                
                TextBox.Parent = InputContainer
                InputContainer.Parent = ContentContainer
                return TextBox
            end
            
            -- DROPDOWN
            function section:Dropdown(text, options, default, callback)
                section.ElementOrder = section.ElementOrder + 1
                local DropdownContainer = Instance.new("Frame")
                DropdownContainer.Name = text .. "Dropdown"
                DropdownContainer.Size = UDim2.new(1, 0, 0, 45)
                DropdownContainer.BackgroundTransparency = 1
                DropdownContainer.LayoutOrder = section.ElementOrder
                
                local DropdownLabel = Instance.new("TextLabel")
                DropdownLabel.Name = "Label"
                DropdownLabel.Size = UDim2.new(1, 0, 0, 16)
                DropdownLabel.BackgroundTransparency = 1
                DropdownLabel.Text = text
                DropdownLabel.TextColor3 = config.Theme.Text or self.Themes.Dark.Text
                DropdownLabel.TextSize = 10
                DropdownLabel.Font = Enum.Font.GothamBold
                DropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
                DropdownLabel.Parent = DropdownContainer
                
                local DropdownButton = Instance.new("TextButton")
                DropdownButton.Name = "DropdownButton"
                DropdownButton.Size = UDim2.new(1, 0, 0, 25)
                DropdownButton.Position = UDim2.new(0, 0, 0, 18)
                DropdownButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                DropdownButton.BorderSizePixel = 0
                DropdownButton.Text = default or "Select..."
                DropdownButton.TextColor3 = config.Theme.Text or self.Themes.Dark.Text
                DropdownButton.TextSize = 11
                DropdownButton.Font = Enum.Font.GothamBold
                
                local DropdownCorner = Instance.new("UICorner")
                DropdownCorner.CornerRadius = UDim.new(0, 6)
                DropdownCorner.Parent = DropdownButton
                
                local Arrow = Instance.new("TextLabel")
                Arrow.Name = "Arrow"
                Arrow.Size = UDim2.new(0, 15, 0, 15)
                Arrow.Position = UDim2.new(1, -20, 0.5, -7)
                Arrow.BackgroundTransparency = 1
                Arrow.Text = "▼"
                Arrow.TextColor3 = Color3.fromRGB(200, 200, 200)
                Arrow.TextSize = 10
                Arrow.Font = Enum.Font.GothamBold
                Arrow.Parent = DropdownButton
                
                local DropdownFrame = Instance.new("Frame")
                DropdownFrame.Name = "DropdownFrame"
                DropdownFrame.Size = UDim2.new(1, 0, 0, 0)
                DropdownFrame.Position = UDim2.new(0, 0, 1, 2)
                DropdownFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                DropdownFrame.BorderSizePixel = 0
                DropdownFrame.ClipsDescendants = true
                DropdownFrame.Visible = false
                
                local DropdownFrameCorner = Instance.new("UICorner")
                DropdownFrameCorner.CornerRadius = UDim.new(0, 6)
                DropdownFrameCorner.Parent = DropdownFrame
                
                local OptionsLayout = Instance.new("UIListLayout")
                OptionsLayout.Parent = DropdownFrame
                
                DropdownFrame.Parent = DropdownButton
                DropdownButton.Parent = DropdownContainer
                
                for i, option in ipairs(options) do
                    local OptionButton = Instance.new("TextButton")
                    OptionButton.Name = option .. "Option"
                    OptionButton.Size = UDim2.new(1, 0, 0, 22)
                    OptionButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    OptionButton.BorderSizePixel = 0
                    OptionButton.Text = option
                    OptionButton.TextColor3 = config.Theme.Text or self.Themes.Dark.Text
                    OptionButton.TextSize = 10
                    OptionButton.Font = Enum.Font.GothamBold
                    
                    OptionButton.MouseButton1Click:Connect(function()
                        DropdownButton.Text = option
                        callback(option)
                        DropdownFrame.Visible = false
                        TweenService:Create(DropdownFrame, TweenInfo.new(0.2), {
                            Size = UDim2.new(1, 0, 0, 0)
                        }):Play()
                    end)
                    
                    OptionButton.Parent = DropdownFrame
                end
                
                local isOpen = false
                
                DropdownButton.MouseButton1Click:Connect(function()
                    isOpen = not isOpen
                    if isOpen then
                        DropdownFrame.Visible = true
                        local contentSize = OptionsLayout.AbsoluteContentSize.Y
                        TweenService:Create(DropdownFrame, TweenInfo.new(0.2), {
                            Size = UDim2.new(1, 0, 0, contentSize)
                        }):Play()
                    else
                        TweenService:Create(DropdownFrame, TweenInfo.new(0.2), {
                            Size = UDim2.new(1, 0, 0, 0)
                        }):Play()
                        task.wait(0.2)
                        DropdownFrame.Visible = false
                    end
                end)
                
                DropdownContainer.Parent = ContentContainer
                return DropdownContainer
            end
            
            -- SLIDER
            function section:Slider(text, min, max, default, callback)
                section.ElementOrder = section.ElementOrder + 1
                local SliderContainer = Instance.new("Frame")
                SliderContainer.Name = text .. "Slider"
                SliderContainer.Size = UDim2.new(1, 0, 0, 50)
                SliderContainer.BackgroundTransparency = 1
                SliderContainer.LayoutOrder = section.ElementOrder
                
                local SliderLabel = Instance.new("TextLabel")
                SliderLabel.Name = "Label"
                SliderLabel.Size = UDim2.new(1, 0, 0, 16)
                SliderLabel.BackgroundTransparency = 1
                SliderLabel.Text = text
                SliderLabel.TextColor3 = config.Theme.Text or self.Themes.Dark.Text
                SliderLabel.TextSize = 10
                SliderLabel.Font = Enum.Font.GothamBold
                SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
                SliderLabel.Parent = SliderContainer
                
                local ValueLabel = Instance.new("TextLabel")
                ValueLabel.Name = "ValueLabel"
                ValueLabel.Size = UDim2.new(0, 60, 0, 16)
                ValueLabel.Position = UDim2.new(1, -60, 0, 0)
                ValueLabel.BackgroundTransparency = 1
                ValueLabel.Text = tostring(default)
                ValueLabel.TextColor3 = config.Theme.SubText or self.Themes.Dark.SubText
                ValueLabel.TextSize = 10
                ValueLabel.Font = Enum.Font.GothamBold
                ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
                ValueLabel.Parent = SliderContainer
                
                local SliderTrack = Instance.new("Frame")
                SliderTrack.Name = "Track"
                SliderTrack.Size = UDim2.new(1, 0, 0, 6)
                SliderTrack.Position = UDim2.new(0, 0, 0, 25)
                SliderTrack.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                SliderTrack.BorderSizePixel = 0
                
                local TrackCorner = Instance.new("UICorner")
                TrackCorner.CornerRadius = UDim.new(1, 0)
                TrackCorner.Parent = SliderTrack
                
                local SliderFill = Instance.new("Frame")
                SliderFill.Name = "Fill"
                SliderFill.Size = UDim2.new(0, 0, 1, 0)
                SliderFill.BackgroundColor3 = config.Theme.Accent or self.Themes.Dark.Accent
                SliderFill.BorderSizePixel = 0
                
                local FillCorner = Instance.new("UICorner")
                FillCorner.CornerRadius = UDim.new(1, 0)
                FillCorner.Parent = SliderFill
                
                local SliderButton = Instance.new("TextButton")
                SliderButton.Name = "SliderButton"
                SliderButton.Size = UDim2.new(0, 16, 0, 16)
                SliderButton.Position = UDim2.new(0, 0, 0.5, -8)
                SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderButton.BorderSizePixel = 0
                SliderButton.Text = ""
                SliderButton.ZIndex = 2
                
                local ButtonCorner = Instance.new("UICorner")
                ButtonCorner.CornerRadius = UDim.new(1, 0)
                ButtonCorner.Parent = SliderButton
                
                local ButtonShadow = Instance.new("ImageLabel")
                ButtonShadow.Name = "Shadow"
                ButtonShadow.Size = UDim2.new(1, 6, 1, 6)
                ButtonShadow.Position = UDim2.new(0, -3, 0, -3)
                ButtonShadow.BackgroundTransparency = 1
                ButtonShadow.Image = "rbxassetid://1316045217"
                ButtonShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
                ButtonShadow.ImageTransparency = 0.8
                ButtonShadow.ScaleType = Enum.ScaleType.Slice
                ButtonShadow.SliceCenter = Rect.new(10, 10, 118, 118)
                ButtonShadow.Parent = SliderButton
                
                SliderFill.Parent = SliderTrack
                SliderButton.Parent = SliderTrack
                SliderTrack.Parent = SliderContainer
                
                local currentValue = math.clamp(default or min, min, max)
                local isSliding = false
                
                local function updateSlider(value)
                    currentValue = math.clamp(value, min, max)
                    local percentage = (currentValue - min) / (max - min)
                    
                    TweenService:Create(SliderFill, TweenInfo.new(0.1), {
                        Size = UDim2.new(percentage, 0, 1, 0)
                    }):Play()
                    
                    TweenService:Create(SliderButton, TweenInfo.new(0.1), {
                        Position = UDim2.new(percentage, -8, 0.5, -8)
                    }):Play()
                    
                    ValueLabel.Text = tostring(math.floor(currentValue))
                    callback(currentValue)
                end
                
                local function slide(input)
                    local trackAbsoluteSize = SliderTrack.AbsoluteSize.X
                    local trackAbsolutePosition = SliderTrack.AbsolutePosition.X
                    local relativeX = math.clamp(input.Position.X - trackAbsolutePosition, 0, trackAbsoluteSize)
                    local percentage = relativeX / trackAbsoluteSize
                    local newValue = min + (max - min) * percentage
                    
                    updateSlider(newValue)
                end
                
                SliderButton.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isSliding = true
                        TweenService:Create(SliderButton, TweenInfo.new(0.2), {
                            Size = UDim2.new(0, 20, 0, 20)
                        }):Play()
                    end
                end)
                
                SliderButton.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isSliding = false
                        TweenService:Create(SliderButton, TweenInfo.new(0.2), {
                            Size = UDim2.new(0, 16, 0, 16)
                        }):Play()
                    end
                end)
                
                SliderTrack.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isSliding = true
                        slide(input)
                        TweenService:Create(SliderButton, TweenInfo.new(0.2), {
                            Size = UDim2.new(0, 20, 0, 20)
                        }):Play()
                    end
                end)
                
                UserInputService.InputChanged:Connect(function(input)
                    if isSliding and input.UserInputType == Enum.UserInputType.MouseMovement then
                        slide(input)
                    end
                end)
                
                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isSliding = false
                        TweenService:Create(SliderButton, TweenInfo.new(0.2), {
                            Size = UDim2.new(0, 16, 0, 16)
                        }):Play()
                    end
                end)
                
                updateSlider(currentValue)
                SliderContainer.Parent = ContentContainer
                return SliderContainer
            end
            
            -- KEYBIND
            function section:Keybind(text, defaultKey, callback)
                section.ElementOrder = section.ElementOrder + 1
                local KeybindContainer = Instance.new("Frame")
                KeybindContainer.Name = text .. "Keybind"
                KeybindContainer.Size = UDim2.new(1, 0, 0, 22)
                KeybindContainer.BackgroundTransparency = 1
                KeybindContainer.LayoutOrder = section.ElementOrder
                
                local KeybindLabel = Instance.new("TextLabel")
                KeybindLabel.Name = "Label"
                KeybindLabel.Size = UDim2.new(1, -65, 1, 0)
                KeybindLabel.BackgroundTransparency = 1
                KeybindLabel.Text = text
                KeybindLabel.TextColor3 = config.Theme.Text or self.Themes.Dark.Text
                KeybindLabel.TextSize = 11
                KeybindLabel.Font = Enum.Font.GothamBold
                KeybindLabel.TextXAlignment = Enum.TextXAlignment.Left
                KeybindLabel.Parent = KeybindContainer
                
                local KeybindButton = Instance.new("TextButton")
                KeybindButton.Name = "Keybind"
                KeybindButton.Size = UDim2.new(0, 55, 0, 20)
                KeybindButton.Position = UDim2.new(1, -55, 0.5, -10)
                KeybindButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                KeybindButton.BorderSizePixel = 0
                KeybindButton.Text = tostring(defaultKey):gsub("Enum.KeyCode.", "")
                KeybindButton.TextColor3 = config.Theme.Text or self.Themes.Dark.Text
                KeybindButton.TextSize = 9
                KeybindButton.Font = Enum.Font.GothamBold
                
                local KeybindCorner = Instance.new("UICorner")
                KeybindCorner.CornerRadius = UDim.new(0, 5)
                KeybindCorner.Parent = KeybindButton
                
                local listening = false
                local connection
                
                local function updateKeybind(key)
                    KeybindButton.Text = tostring(key):gsub("Enum.KeyCode.", "")
                    callback(key)
                end
                
                KeybindButton.MouseButton1Click:Connect(function()
                    listening = true
                    KeybindButton.Text = "..."
                    KeybindButton.BackgroundColor3 = config.Theme.Accent or self.Themes.Dark.Accent
                    
                    if connection then
                        connection:Disconnect()
                    end
                    
                    connection = UserInputService.InputBegan:Connect(function(input)
                        if listening and input.UserInputType == Enum.UserInputType.Keyboard then
                            listening = false
                            KeybindButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                            updateKeybind(input.KeyCode)
                        end
                    end)
                end)
                
                KeybindButton.Parent = KeybindContainer
                KeybindContainer.Parent = ContentContainer
                return KeybindContainer
            end
            
            table.insert(self.Sections, section)
            return section
        end
        
        return tab
    end
    
    local dragging = false
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end

    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
    
    self.Windows[config.Title or "NytrixUI"] = window
    return window
end

return NytrixUI
