local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:FindFirstChild("PlayerGui") or CoreGui

-- Remove previous instances if any
if PlayerGui:FindFirstChild("KZ_KeySystem") then
    PlayerGui.KZ_KeySystem:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KZ_KeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- Main Container Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 420, 0, 260)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
MainFrame.BackgroundTransparency = 1
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(45, 45, 55)
UIStroke.Transparency = 1
UIStroke.Thickness = 1
UIStroke.Parent = MainFrame

-- Page 1: Key Input
local Page1 = Instance.new("Frame")
Page1.Name = "Page1"
Page1.Size = UDim2.new(1, 0, 1, 0)
Page1.BackgroundTransparency = 1
Page1.Visible = true
Page1.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 20)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Text = "KZ TEAM | KEY SYSTEM"
Title.TextColor3 = Color3.fromRGB(240, 240, 245)
Title.TextSize = 16
Title.TextTransparency = 1
Title.Parent = Page1

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 20)
Subtitle.Position = UDim2.new(0, 0, 0, 45)
Subtitle.BackgroundTransparency = 1
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "Enter your license key to continue."
Subtitle.TextColor3 = Color3.fromRGB(130, 130, 145)
Subtitle.TextSize = 12
Subtitle.TextTransparency = 1
Subtitle.Parent = Page1

local TextBoxHolder = Instance.new("Frame")
TextBoxHolder.Size = UDim2.new(0, 360, 0, 45)
TextBoxHolder.Position = UDim2.new(0.5, -180, 0, 95)
TextBoxHolder.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
TextBoxHolder.BackgroundTransparency = 1
TextBoxHolder.BorderSizePixel = 0
TextBoxHolder.Parent = Page1

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 8)
BoxCorner.Parent = TextBoxHolder

local BoxStroke = Instance.new("UIStroke")
BoxStroke.Color = Color3.fromRGB(50, 50, 65)
BoxStroke.Transparency = 1
BoxStroke.Thickness = 1
BoxStroke.Parent = TextBoxHolder

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -20, 1, 0)
TextBox.Position = UDim2.new(0, 10, 0, 0)
TextBox.BackgroundTransparency = 1
TextBox.Font = Enum.Font.GothamMedium
TextBox.PlaceholderText = "KZ-XXXX-XXXX-XXXX"
TextBox.PlaceholderColor3 = Color3.fromRGB(80, 80, 95)
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 13
TextBox.TextTransparency = 1
TextBox.ClearTextOnFocus = false
TextBox.Parent = TextBoxHolder

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0, 360, 0, 42)
SubmitBtn.Position = UDim2.new(0.5, -180, 0, 160)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.BackgroundTransparency = 1
SubmitBtn.AutoButtonColor = false
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Text = "VERIFY KEY"
SubmitBtn.TextColor3 = Color3.fromRGB(12, 12, 14)
SubmitBtn.TextSize = 13
SubmitBtn.TextTransparency = 1
SubmitBtn.Parent = Page1

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = SubmitBtn

-- Page 2: Loading / Connection Status
local Page2 = Instance.new("Frame")
Page2.Name = "Page2"
Page2.Size = UDim2.new(1, 0, 1, 0)
Page2.BackgroundTransparency = 1
Page2.Visible = false
Page2.Parent = MainFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Position = UDim2.new(0, 0, 0, 100)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.Text = "Establishing secure connection..."
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 210)
StatusLabel.TextSize = 14
StatusLabel.TextTransparency = 1
StatusLabel.Parent = Page2

local LoaderBarBg = Instance.new("Frame")
LoaderBarBg.Size = UDim2.new(0, 360, 0, 6)
LoaderBarBg.Position = UDim2.new(0.5, -180, 0, 145)
LoaderBarBg.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
LoaderBarBg.BackgroundTransparency = 1
LoaderBarBg.BorderSizePixel = 0
LoaderBarBg.Parent = Page2

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(0, 3)
BarCorner.Parent = LoaderBarBg

local LoaderBarFill = Instance.new("Frame")
LoaderBarFill.Size = UDim2.new(0, 0, 1, 0)
LoaderBarFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoaderBarFill.BorderSizePixel = 0
LoaderBarFill.Parent = LoaderBarBg

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(0, 3)
FillCorner.Parent = LoaderBarFill

-- Tween Helper Functions
local function tween(obj, props, duration, style, direction)
    style = style or Enum.EasingStyle.Quart
    direction = direction or Enum.EasingDirection.Out
    local info = TweenInfo.new(duration, style, direction)
    local t = TweenService:Create(obj, info, props)
    t:Play()
    return t
end

-- Intro Animation
task.spawn(function()
    task.wait(0.1)
    tween(MainFrame, {BackgroundTransparency = 0}, 0.5, Enum.EasingStyle.Exponential)
    tween(UIStroke, {Transparency = 0.5}, 0.5)
    tween(Title, {TextTransparency = 0}, 0.6)
    tween(Subtitle, {TextTransparency = 0}, 0.6)
    tween(TextBoxHolder, {BackgroundTransparency = 0}, 0.6)
    tween(BoxStroke, {Transparency = 0.4}, 0.6)
    tween(TextBox, {TextTransparency = 0}, 0.6)
    tween(SubmitBtn, {BackgroundTransparency = 0}, 0.6)
    tween(SubmitBtn, {TextTransparency = 0}, 0.6)
end)

-- Button Hover Effects
SubmitBtn.MouseEnter:Connect(function()
    tween(SubmitBtn, {BackgroundColor3 = Color3.fromRGB(220, 220, 230)}, 0.2)
end)

SubmitBtn.MouseLeave:Connect(function()
    tween(SubmitBtn, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}, 0.2)
end)

-- Verification Logic
local CORRECT_KEY = "KZ-R9TW-4LXC-2BPF"

SubmitBtn.MouseButton1Click:Connect(function()
    local enteredKey = TextBox.Text
    
    if enteredKey == CORRECT_KEY then
        SubmitBtn.Active = false
        TextBox.Active = false
        
        -- Fade out Page 1
        tween(Page1, {BackgroundTransparency = 1}, 0.4)
        for _, v in ipairs(Page1:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextBox") or v:IsA("TextButton") then
                tween(v, {TextTransparency = 1}, 0.3)
            elseif v:IsA("Frame") then
                tween(v, {BackgroundTransparency = 1}, 0.3)
                if v:FindFirstChildOfClass("UIStroke") then
                    tween(v.UIStroke, {Transparency = 1}, 0.3)
                end
            end
        end
        
        task.wait(0.4)
        Page1.Visible = false
        Page2.Visible = true
        
        -- Fade in Page 2 elements
        tween(StatusLabel, {TextTransparency = 0}, 0.4)
        tween(LoaderBarBg, {BackgroundTransparency = 0}, 0.4)
        
        task.wait(0.3)
        StatusLabel.Text = "Checking key connection..."
        tween(LoaderBarFill, {Size = UDim2.new(0.4, 0, 1, 0)}, 0.6, Enum.EasingStyle.Quart)
        
        task.wait(0.8)
        StatusLabel.Text = "Key verified successfully!"
        tween(LoaderBarFill, {Size = UDim2.new(0.8, 0, 1, 0)}, 0.5, Enum.EasingStyle.Quart)
        
        task.wait(0.6)
        StatusLabel.Text = "Loading KZV2..."
        tween(LoaderBarFill, {Size = UDim2.new(1, 0, 1, 0)}, 0.4, Enum.EasingStyle.Quart)
        
        task.wait(0.5)
        
        -- Exit Animation
        tween(MainFrame, {BackgroundTransparency = 1}, 0.5, Enum.EasingStyle.Exponential)
        tween(UIStroke, {Transparency = 1}, 0.5)
        tween(StatusLabel, {TextTransparency = 1}, 0.4)
        tween(LoaderBarBg, {BackgroundTransparency = 1}, 0.4)
        tween(LoaderBarFill, {BackgroundTransparency = 1}, 0.4)
        
        task.wait(0.5)
        ScreenGui:Destroy()
        
        -- Execute Target Script
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Zen244/kz/main/KZV2.lua"))()
        end)
        
        if not success then
            warn("KZ Loader Error: " .. tostring(err))
        end
        
    else
        -- Error feedback shake / color flash
        local originalColor = BoxStroke.Color
        BoxStroke.Color = Color3.fromRGB(220, 60, 60)
        StatusLabel.Text = "Invalid Key. Try again."
        
        task.spawn(function()
            for i = 1, 3 do
                tween(TextBoxHolder, {Position = UDim2.new(0.5, -174, 0, 95)}, 0.05)
                task.wait(0.05)
                tween(TextBoxHolder, {Position = UDim2.new(0.5, -186, 0, 95)}, 0.05)
                task.wait(0.05)
            end
            tween(TextBoxHolder, {Position = UDim2.new(0.5, -180, 0, 95)}, 0.05)
        end)
        
        task.wait(1.2)
        BoxStroke.Color = originalColor
    end
end)
