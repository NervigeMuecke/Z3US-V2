loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/other.lua"))()
local z3USLoader = Instance.new("ScreenGui")
z3USLoader.Name = "Z3US Loader"
z3USLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
z3USLoader.Parent = game:GetService("CoreGui")
z3USLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
z3USLoader.ResetOnSpawn = false
z3USLoader.DisplayOrder = 999999
z3USLoader.IgnoreGuiInset = true

local frame = Instance.new("Frame")
frame.Name = "Frame"
frame.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0
frame.Position = UDim2.fromScale(0.0883, 0.11)
frame.Size = UDim2.fromOffset(878, 524)

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		local dragStart = input.Position
		local frameStart = frame.Position

		local connection
		connection = game:GetService("UserInputService").InputChanged:Connect(function(inputChanged)
			if inputChanged.UserInputType == Enum.UserInputType.MouseMovement then
				local delta = inputChanged.Position - dragStart
				frame.Position = UDim2.new(
					frameStart.X.Scale,
					frameStart.X.Offset + delta.X,
					frameStart.Y.Scale,
					frameStart.Y.Offset + delta.Y
				)
			end
		end)

		local endConnection
		endConnection = game:GetService("UserInputService").InputEnded:Connect(function(inputEnded)
			if inputEnded.UserInputType == Enum.UserInputType.MouseButton1 then
				connection:Disconnect()
				endConnection:Disconnect()
			end
		end)
	end
end)

local uICorner = Instance.new("UICorner")
uICorner.Name = "UICorner"
uICorner.CornerRadius = UDim.new(0, 25)
uICorner.Parent = frame

local textLabel = Instance.new("TextLabel")
textLabel.Name = "TextLabel"
textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel.BackgroundTransparency = 1
textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel.BorderSizePixel = 0
textLabel.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel.Position = UDim2.fromScale(0.571, 0.219)
textLabel.Size = UDim2.fromOffset(316, 63)
textLabel.Text = "Z3US"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextScaled = true
textLabel.TextSize = 14
textLabel.TextWrapped = true

local textLabel1 = Instance.new("TextLabel")
textLabel1.Name = "TextLabel"
textLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel1.BackgroundTransparency = 1
textLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel1.BorderSizePixel = 0
textLabel1.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel1.Position = UDim2.fromScale(0, 0.619)
textLabel1.Size = UDim2.fromOffset(408, 244)
textLabel1.Text = ""
textLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel1.TextScaled = true
textLabel1.TextSize = 14
textLabel1.TextTransparency = 0.4
textLabel1.TextWrapped = true
textLabel1.Parent = textLabel

textLabel.Parent = frame

local arsenal = Instance.new("Frame")
arsenal.Name = "Arsenal"
arsenal.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
arsenal.BackgroundTransparency = 0.9
arsenal.BorderColor3 = Color3.fromRGB(0, 0, 0)
arsenal.BorderSizePixel = 0
arsenal.Position = UDim2.fromScale(0.03, 0.0415)
arsenal.Size = UDim2.fromOffset(330, 65)

local arsenalStroke = Instance.new("UIStroke")
arsenalStroke.Name = "UIStroke"
arsenalStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
arsenalStroke.Color = Color3.fromRGB(26, 29, 37)
arsenalStroke.Thickness = 1.9
arsenalStroke.Parent = arsenal

local uICorner1 = Instance.new("UICorner")
uICorner1.Name = "UICorner"
uICorner1.CornerRadius = UDim.new(0, 25)
uICorner1.Parent = arsenal

local textLabel2 = Instance.new("TextLabel")
textLabel2.Name = "TextLabel"
textLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel2.BackgroundTransparency = 1
textLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel2.BorderSizePixel = 0
textLabel2.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel2.Position = UDim2.fromScale(0.2, 0.0462)
textLabel2.Size = UDim2.fromOffset(197, 58)
textLabel2.Text = "Arsenal"
textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel2.TextSize = 62
textLabel2.TextWrapped = true
textLabel2.Parent = arsenal

arsenal.Parent = frame

local loadbtn = Instance.new("TextButton")
loadbtn.Name = "Loadbtn"
loadbtn.BackgroundColor3 = Color3.fromRGB(27, 29, 37)
loadbtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
loadbtn.BorderSizePixel = 0
loadbtn.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
loadbtn.Position = UDim2.fromScale(0.527, 0.656)
loadbtn.Size = UDim2.fromOffset(405, 62)
loadbtn.Text = "Load"
loadbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
loadbtn.TextScaled = true
loadbtn.TextSize = 14
loadbtn.TextWrapped = true

local uICorner2 = Instance.new("UICorner")
uICorner2.Name = "UICorner"
uICorner2.CornerRadius = UDim.new(0, 25)
uICorner2.Parent = loadbtn

loadbtn.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
closeButton.BackgroundTransparency = 1
closeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
closeButton.BorderSizePixel = 0
closeButton.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json")
closeButton.Position = UDim2.fromScale(0.949, 0.0172)
closeButton.Size = UDim2.fromOffset(44, 41)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(58, 67, 98)
closeButton.TextScaled = true
closeButton.TextSize = 14
closeButton.TextWrapped = true

local uIStroke1 = Instance.new("UIStroke")
uIStroke1.Name = "UIStroke"
uIStroke1.Color = Color3.fromRGB(255, 255, 255)
uIStroke1.Enabled = false
uIStroke1.Thickness = 1.2
uIStroke1.Parent = closeButton

closeButton.Parent = frame

local textLabel3 = Instance.new("TextLabel")
textLabel3.Name = "TextLabel"
textLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel3.BackgroundTransparency = 1
textLabel3.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel3.BorderSizePixel = 0
textLabel3.FontFace = Font.new(
	"rbxasset://fonts/families/Bangers.json",
	Enum.FontWeight.Bold,
	Enum.FontStyle.Italic
)
textLabel3.Position = UDim2.fromScale(0.692, 0.0562)
textLabel3.Size = UDim2.fromOffset(70, 89)
textLabel3.Text = "Z"
textLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel3.TextScaled = true
textLabel3.TextSize = 14
textLabel3.TextWrapped = true

local textLabel4 = Instance.new("TextLabel")
textLabel4.Name = "TextLabel"
textLabel4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel4.BackgroundTransparency = 1
textLabel4.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel4.BorderSizePixel = 0
textLabel4.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel4.Position = UDim2.fromScale(0, 0.619)
textLabel4.Size = UDim2.fromOffset(408, 244)
textLabel4.Text = ""
textLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel4.TextScaled = true
textLabel4.TextSize = 14
textLabel4.TextTransparency = 0.4
textLabel4.TextWrapped = true
textLabel4.Parent = textLabel3

textLabel3.Parent = frame

local textLabel5 = Instance.new("TextLabel")
textLabel5.Name = "TextLabel"
textLabel5.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
textLabel5.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel5.BorderSizePixel = 0
textLabel5.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel5.Position = UDim2.fromScale(0.628, 0.821)
textLabel5.Size = UDim2.fromOffset(200, 50)
textLabel5.Text = "Thank you for using Z3US <3"
textLabel5.TextColor3 = Color3.fromRGB(40, 58, 85)
textLabel5.TextSize = 34
textLabel5.Parent = frame

local textLabel6 = Instance.new("TextLabel")
textLabel6.Name = "TextLabel"
textLabel6.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
textLabel6.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel6.BorderSizePixel = 0
textLabel6.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel6.Position = UDim2.fromScale(0.628, 0.447)
textLabel6.Size = UDim2.fromOffset(200, 50)
textLabel6.Text = "No Script Selected"
textLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel6.TextSize = 34
textLabel6.Parent = frame

local planks = Instance.new("Frame")
planks.Name = "Planks"
planks.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
planks.BackgroundTransparency = 0.9
planks.BorderColor3 = Color3.fromRGB(0, 0, 0)
planks.BorderSizePixel = 0
planks.Position = UDim2.fromScale(0.03, 0.188)
planks.Size = UDim2.fromOffset(330, 65)

local planksStroke = Instance.new("UIStroke")
planksStroke.Name = "UIStroke"
planksStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
planksStroke.Color = Color3.fromRGB(26, 29, 37)
planksStroke.Thickness = 1.9
planksStroke.Parent = planks

local uICorner3 = Instance.new("UICorner")
uICorner3.Name = "UICorner"
uICorner3.CornerRadius = UDim.new(0, 25)
uICorner3.Parent = planks

local textLabel7 = Instance.new("TextLabel")
textLabel7.Name = "TextLabel"
textLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel7.BackgroundTransparency = 1
textLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel7.BorderSizePixel = 0
textLabel7.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel7.Position = UDim2.fromScale(0.2, 0.0462)
textLabel7.Size = UDim2.fromOffset(197, 58)
textLabel7.Text = "Planks"
textLabel7.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel7.TextSize = 62
textLabel7.TextWrapped = true
textLabel7.Parent = planks

planks.Parent = frame

local universal = Instance.new("Frame")
universal.Name = "Universal"
universal.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
universal.BackgroundTransparency = 0.9
universal.BorderColor3 = Color3.fromRGB(0, 0, 0)
universal.BorderSizePixel = 0
universal.Position = UDim2.fromScale(0.0289, 0.806)
universal.Size = UDim2.fromOffset(330, 65)

local universalStroke = Instance.new("UIStroke")
universalStroke.Name = "UIStroke"
universalStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
universalStroke.Color = Color3.fromRGB(26, 29, 37)
universalStroke.Thickness = 1.9
universalStroke.Parent = universal

local uICorner4 = Instance.new("UICorner")
uICorner4.Name = "UICorner"
uICorner4.CornerRadius = UDim.new(0, 25)
uICorner4.Parent = universal

local textLabel8 = Instance.new("TextLabel")
textLabel8.Name = "TextLabel"
textLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel8.BackgroundTransparency = 1
textLabel8.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel8.BorderSizePixel = 0
textLabel8.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel8.Position = UDim2.fromScale(0.2, 0.0462)
textLabel8.Size = UDim2.fromOffset(197, 58)
textLabel8.Text = "Universal"
textLabel8.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel8.TextSize = 62
textLabel8.TextWrapped = true
textLabel8.Parent = universal

universal.Parent = frame

local gunfightArena = Instance.new("Frame")
gunfightArena.Name = "GunfightArena"
gunfightArena.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
gunfightArena.BackgroundTransparency = 0.9
gunfightArena.BorderColor3 = Color3.fromRGB(0, 0, 0)
gunfightArena.BorderSizePixel = 0
gunfightArena.Position = UDim2.fromScale(0.03, 0.65)
gunfightArena.Size = UDim2.fromOffset(330, 65)

local gunfightArenaStroke = Instance.new("UIStroke")
gunfightArenaStroke.Name = "UIStroke"
gunfightArenaStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
gunfightArenaStroke.Color = Color3.fromRGB(26, 29, 37)
gunfightArenaStroke.Thickness = 1.9
gunfightArenaStroke.Parent = gunfightArena

local uICorner5 = Instance.new("UICorner")
uICorner5.Name = "UICorner"
uICorner5.CornerRadius = UDim.new(0, 25)
uICorner5.Parent = gunfightArena

local textLabel9 = Instance.new("TextLabel")
textLabel9.Name = "TextLabel"
textLabel9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel9.BackgroundTransparency = 1
textLabel9.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel9.BorderSizePixel = 0
textLabel9.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel9.Position = UDim2.fromScale(0.00639, 0.0462)
textLabel9.Size = UDim2.fromOffset(322, 58)
textLabel9.Text = "Gunfight Arena"
textLabel9.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel9.TextSize = 62
textLabel9.TextWrapped = true
textLabel9.Parent = gunfightArena

gunfightArena.Parent = frame

local counterblox = Instance.new("Frame")
counterblox.Name = "Counterblox"
counterblox.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
counterblox.BackgroundTransparency = 0.9
counterblox.BorderColor3 = Color3.fromRGB(0, 0, 0)
counterblox.BorderSizePixel = 0
counterblox.Position = UDim2.fromScale(0.0277, 0.489)
counterblox.Size = UDim2.fromOffset(330, 65)

local counterbloxStroke = Instance.new("UIStroke")
counterbloxStroke.Name = "UIStroke"
counterbloxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
counterbloxStroke.Color = Color3.fromRGB(26, 29, 37)
counterbloxStroke.Thickness = 1.9
counterbloxStroke.Parent = counterblox

local uICorner6 = Instance.new("UICorner")
uICorner6.Name = "UICorner"
uICorner6.CornerRadius = UDim.new(0, 25)
uICorner6.Parent = counterblox

local textLabel10 = Instance.new("TextLabel")
textLabel10.Name = "TextLabel"
textLabel10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel10.BackgroundTransparency = 1
textLabel10.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel10.BorderSizePixel = 0
textLabel10.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel10.Position = UDim2.fromScale(0.0276, 0.0462)
textLabel10.Size = UDim2.fromOffset(311, 58)
textLabel10.Text = "Counterblox"
textLabel10.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel10.TextSize = 62
textLabel10.TextWrapped = true
textLabel10.Parent = counterblox

counterblox.Parent = frame

local rivals = Instance.new("Frame")
rivals.Name = "Rivals"
rivals.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
rivals.BackgroundTransparency = 0.9
rivals.BorderColor3 = Color3.fromRGB(0, 0, 0)
rivals.BorderSizePixel = 0
rivals.Position = UDim2.fromScale(0.0289, 0.34)
rivals.Size = UDim2.fromOffset(330, 65)

local rivalsStroke = Instance.new("UIStroke")
rivalsStroke.Name = "UIStroke"
rivalsStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
rivalsStroke.Color = Color3.fromRGB(26, 29, 37)
rivalsStroke.Thickness = 1.9
rivalsStroke.Parent = rivals

local uICorner7 = Instance.new("UICorner")
uICorner7.Name = "UICorner"
uICorner7.CornerRadius = UDim.new(0, 25)
uICorner7.Parent = rivals

local textLabel11 = Instance.new("TextLabel")
textLabel11.Name = "TextLabel"
textLabel11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel11.BackgroundTransparency = 1
textLabel11.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel11.BorderSizePixel = 0
textLabel11.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel11.Position = UDim2.fromScale(0.2, 0.0462)
textLabel11.Size = UDim2.fromOffset(197, 58)
textLabel11.Text = "Rivals"
textLabel11.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel11.TextSize = 62
textLabel11.TextWrapped = true
textLabel11.Parent = rivals

rivals.Parent = frame

local autoloadToggle = Instance.new("Frame")
autoloadToggle.Name = "AutoloadToggle"
autoloadToggle.Parent = frame
autoloadToggle.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
autoloadToggle.BackgroundTransparency = 0.9
autoloadToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
autoloadToggle.BorderSizePixel = 0
autoloadToggle.Position = UDim2.new(0.59, 0, 0.55, 0)
autoloadToggle.Size = UDim2.new(0, 280, 0, 50)
autoloadToggle.Visible = false

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Parent = autoloadToggle
toggleStroke.Color = Color3.fromRGB(26, 29, 37)
toggleStroke.Thickness = 2
toggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local uICornerToggle = Instance.new("UICorner")
uICornerToggle.CornerRadius = UDim.new(0, 25)
uICornerToggle.Parent = autoloadToggle

local toggleLabel = Instance.new("TextLabel")
toggleLabel.Name = "ToggleLabel"
toggleLabel.Parent = autoloadToggle
toggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleLabel.BackgroundTransparency = 1
toggleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
toggleLabel.BorderSizePixel = 0
toggleLabel.Position = UDim2.new(0.05, 0, 0, 0)
toggleLabel.Size = UDim2.new(0, 160, 0, 50)
toggleLabel.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
toggleLabel.Text = "Autoload:"
toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleLabel.TextSize = 20
toggleLabel.TextXAlignment = Enum.TextXAlignment.Left

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Parent = autoloadToggle
toggleButton.BackgroundColor3 = Color3.fromRGB(140, 155, 208)
toggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
toggleButton.BorderSizePixel = 0
toggleButton.Position = UDim2.new(0.65, 0, 0.15, 0)
toggleButton.Size = UDim2.new(0, 80, 0, 35)
toggleButton.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
toggleButton.Text = "ON"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 18
toggleButton.TextWrapped = true

local uICornerToggleBtn = Instance.new("UICorner")
uICornerToggleBtn.CornerRadius = UDim.new(0, 15)
uICornerToggleBtn.Parent = toggleButton

frame.Parent = z3USLoader

local selectedOption = nil
local selectedColor = Color3.fromRGB(140, 155, 208)
local defaultColor = Color3.fromRGB(26, 29, 37)
local autoloadEnabled = true

local function updateToggleAppearance()
	if autoloadEnabled then
		toggleButton.BackgroundColor3 = Color3.fromRGB(140, 155, 208)
		toggleButton.Text = "ON"
	else
		toggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		toggleButton.Text = "OFF"
	end
end

local function selectScript(scriptFrame, scriptName)
	arsenalStroke.Color = defaultColor
	planksStroke.Color = defaultColor
	rivalsStroke.Color = defaultColor
	counterbloxStroke.Color = defaultColor
	universalStroke.Color = defaultColor
	gunfightArenaStroke.Color = defaultColor

	autoloadToggle.Visible = false

	if scriptFrame then
		scriptFrame:FindFirstChildOfClass("UIStroke").Color = selectedColor
		selectedOption = scriptName
		textLabel6.Text = scriptName

		if scriptName == "Rivals" then
			autoloadToggle.Visible = true
			updateToggleAppearance()
		end
	else
		selectedOption = nil
		textLabel6.Text = "No Script Selected"
	end
end

arsenal.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		selectScript(arsenal, "Arsenal")
	end
end)

planks.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		selectScript(planks, "Planks")
	end
end)

rivals.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		selectScript(rivals, "Rivals")
	end
end)

counterblox.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		selectScript(counterblox, "Counterblox")
	end
end)

gunfightArena.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		selectScript(gunfightArena, "Gunfight Arena")
	end
end)

universal.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		selectScript(universal, "Universal")
	end
end)

toggleButton.MouseButton1Click:Connect(function()
	autoloadEnabled = not autoloadEnabled
	updateToggleAppearance()
end)

loadbtn.MouseButton1Click:Connect(function()
	if selectedOption then
		if selectedOption == "Arsenal" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Arsenal%20Beta.lua"))()
		elseif selectedOption == "Planks" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Planks.lua"))()
		elseif selectedOption == "Rivals" then
			getgenv().autoload = autoloadEnabled
			loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Rivals%20Beta.lua"))()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Test.lua"))()
		elseif selectedOption == "Counterblox" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/refs/heads/main/Games/ZYPHERION%20Counterblox.lua))()
		elseif selectedOption == "Gunfight Arena" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Gunfight%20Arena.lua"))()
		elseif selectedOption == "Universal" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Universal.lua"))()
		end
	else
		textLabel6.Text = "Please select a script!"
		wait(2)
		textLabel6.Text = "{Selected Script}"
	end
end)

closeButton.MouseButton1Click:Connect(function()
	z3USLoader:Destroy()
end)

updateToggleAppearance()
