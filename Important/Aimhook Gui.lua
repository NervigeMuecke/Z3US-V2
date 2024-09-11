
if not aimhook then
    getgenv().aimhook = {}
    aimhook.library = {}
end

local library = aimhook.library
library.Items = {};
library.Toggles = {};
library.Constants = {};
library.WindowAsset = 'rbxassetid://12876250725'
library.MainWindow = nil

function library:Fetch(r, p)
    local obj = game:GetObjects(r)[1]
    obj.Parent = p
    
    return obj
end
function library:Check()
    if not aimhook.library.MainWindow then
        return -1    
    end
    
    return 0
end
function library:SaveConfig(n, t)
    local httpService = game:GetService('HttpService')
    
    if not writefile then return end
    
    local encrypted = {}
    for i,v in next, library.Constants do
        if (typeof(v) == "Color3") or (typeof(v) == "Color")  then
            encrypted[i] = { v.R, v.G, v.B }
        end
            
        encrypted[i] = v
    end
    writefile(n, httpService:JSONEncode(encrypted))
end
function library:GetConfig(n)
    local httpService = game:GetService('HttpService')
    
    if not writefile then return end
    
    local decrypted
    local NewConfig = {}
    --decrypted = httpService:JSONDecode(readfile(n))
    for i,v in httpService:JSONDecode(readfile(n)) do
        if (typeof(v) == "table") then
            if (typeof(v[1]) == "number") then
                NewConfig[i] = Color3.new(v[1], v[2], v[3])
            elseif (typeof(v[1]) == "table") then
                NewConfig[i] = v[1]
            end
        end
        NewConfig[i] = v
    end

    return NewConfig; -- this will return a new table 
end
-- remove testing crap because its not needed and fills up space
function library:RemoveBeta()
    if (library:Check() == -1) then
        for i=0,math.huge do
            while true do
                print('Crashed due to initilization failure')    
            end
        end
    end
    
    for _, v in next, library.Controls do
        for __, new in next, v:GetChildren() do
            if new:IsA('Frame') then
                new:Destroy() 
            end
        end
    end
end
function library:Destruct()
    for _, v in next, library.Constants do
        if typeof(v) == 'boolean' then
            v = false    
        end
    end
    
    library.MainWindow = nil
end
function library:FSetWindow(n, u, d)
    library.MainWindow = library:Fetch(library.WindowAsset, game:GetService('CoreGui'))
    local main=library.MainWindow
    local colorPickers = Instance.new "Folder"
    colorPickers.Parent = main
    colorPickers.Name = 'ColorPickers'
    main.Canvas.SideBar.ImageLabel.BackgroundTransparency = 1
    main.Canvas.SideBar.ImageLabel.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.UserId .. "&width=420&height=420&format=png"
    main.Canvas.SideBar.LibTitle.Text = n
    main.Canvas.SideBar.ImageLabel.name.Text = u
    main.Canvas.SideBar.ImageLabel.info2.Text = d
    -- better than doing fromId always
    library.Font = Font.fromId(11702779409)
    library.Controls = {
        Aimbot = main.Canvas.Container.Aimbot,
        Player = main.Canvas.Container.Player,
        Misc = main.Canvas.Container.Misc,
        Visuality = main.Canvas.Container.Visuals,
        AntiAim = main.Canvas.Container.AntiAim,
        Bypasses = main.Canvas.Container.Bypasses
    };
    -- kind of multi tab support yes :)
    local cs = main.Canvas.SideBar.Frame
    for _, v in next, cs:GetChildren() do
        if v:IsA('TextButton') then
            v.MouseButton1Down:Connect(function()
                for __, vv in next, main.Canvas.Container:GetChildren() do
                    vv.Visible = false
                end
                
                main.Canvas.Container[v.Name].Visible = true
            end)
        end
    end
    
    local UpdateLogs = Instance.new("Frame")
    UpdateLogs.Name = "UpdateLogs"
    UpdateLogs.Parent = library.MainWindow
    UpdateLogs.BackgroundColor3 = Color3.fromRGB(8, 8, 13)
    UpdateLogs.Position = UDim2.new(0.36187008, 0, 0.159601003, 0)
    UpdateLogs.Size = UDim2.new(0, 472, 0, 440)
    UpdateLogs.Visible = false
    library:CreateStroke(Color3.fromRGB(63, 90, 106), .51, UpdateLogs)
    library.UpdateLogs = UpdateLogs
    local LibTitle_4 = Instance.new("TextLabel")
    local version_2 = Instance.new("TextLabel")
    local UIGradient_27 = Instance.new("UIGradient")
    local UICorner_14 = Instance.new("UICorner")
    local Frame_7 = Instance.new("Frame")
    local UICorner_15 = Instance.new("UICorner")
    local TextLabel_2 = Instance.new("TextLabel")
    LibTitle_4.Name = "LibTitle"
    LibTitle_4.Parent = UpdateLogs
    LibTitle_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LibTitle_4.BackgroundTransparency = 1.000
    LibTitle_4.Position = UDim2.new(0.330851018, 0, 0.0219155848, 0)
    LibTitle_4.Size = UDim2.new(0, 159, 0, 33)
    LibTitle_4.FontFace = library.Font
    LibTitle_4.Text = "AIMHOOK"
    LibTitle_4.TextColor3 = Color3.fromRGB(255, 255, 255)
    LibTitle_4.TextSize = 39.000
    LibTitle_4.TextWrapped = true
    
    
    
    UIGradient_27.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(166, 166, 166)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
    UIGradient_27.Rotation = 270
    UIGradient_27.Parent = LibTitle_4
    
    UICorner_14.Parent = UpdateLogs
    
    Frame_7.Parent = UpdateLogs
    Frame_7.BackgroundColor3 = Color3.fromRGB(8, 8, 13)
    Frame_7.BackgroundTransparency = 0.500
    Frame_7.Position = UDim2.new(0.0762711912, 0, 0.156818181, 0)
    Frame_7.Size = UDim2.new(0, 399, 0, 343)
    library:CreateStroke(Color3.fromRGB(63, 90, 106), .51, Frame_7)
    UICorner_15.Parent = Frame_7
    
    TextLabel_2.Parent = Frame_7
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
    TextLabel_2.BackgroundTransparency = 1.000
    TextLabel_2.Position = UDim2.new(0.159748137, 0, -0.005830904, 0)
    TextLabel_2.Size = UDim2.new(0, 271, 0, 50)
    TextLabel_2.Font = Enum.Font.Code
    TextLabel_2.Text = "UPDATE LOGS"
    TextLabel_2.TextColor3 = Color3.fromRGB(186, 186, 186)
    TextLabel_2.TextSize = 21.000
    
    main.Canvas.options.Updates.MouseButton1Down:Connect(function()
        library.UpdateLogs.Visible = not library.UpdateLogs.Visible    
    end)
    
    local UserInputService = game:GetService("UserInputService")
    local runService = (game:GetService("RunService"));
    
    local gui = main.Canvas
    
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    function Lerp(a, b, m)
    	return a + (b - a) * m
    end;
    
    local lastMousePos
    local lastGoalPos
    local DRAG_SPEED = (8); -- // The speed of the UI darg.
    function Update(dt)
    	if not (startPos) then return end;
    	if not (dragging) and (lastGoalPos) then
    		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
    		return 
    	end;
    
    	local delta = (lastMousePos - UserInputService:GetMouseLocation())
    	local xGoal = (startPos.X.Offset - delta.X);
    	local yGoal = (startPos.Y.Offset - delta.Y);
    	lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
    	gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
    end;
    
    gui.InputBegan:Connect(function(input)
    	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
    		dragging = true
    		dragStart = input.Position
    		startPos = gui.Position
    		lastMousePos = UserInputService:GetMouseLocation()
    
    		input.Changed:Connect(function()
    			if input.UserInputState == Enum.UserInputState.End then
    				dragging = false
    			end
    		end)
    	end
    end)
    
    gui.InputChanged:Connect(function(input)
    	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
    		dragInput = input
    	end
    end)
    
    runService.Heartbeat:Connect(Update)
end
-- Fuck G2L, It doesn't even create strokes!
function library:CreateStroke(c, t, p)
    local stroke = Instance.new('UIStroke',p)
    stroke.Color = c
    stroke.Thickness = t
end
function library:FSetSection(n, t)
    if (library:Check() == -1) then
        for i=0,math.huge do
            while true do
                print('Crashed due to initilization failure')    
            end
        end
    end
    
    -- cancer, had to be done :(
    local oldSection = Instance.new("Frame")
    oldSection.Name = n
    oldSection.Parent = library.Controls[t]
    oldSection.BackgroundColor3 = Color3.fromRGB(28, 41, 54)
    oldSection.BorderSizePixel = 0
    oldSection.Position = UDim2.new(0.0105078807, 0, 0, 0)
    oldSection.Size = UDim2.new(0, 278, 0, 275)
    library:CreateStroke(Color3.fromRGB(27,40,52), 1.6, oldSection)
    local LibTitle_2 = Instance.new("TextLabel")
    LibTitle_2.Name = "LibTitle"
    LibTitle_2.Parent = oldSection
    LibTitle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LibTitle_2.BackgroundTransparency = 1.000
    LibTitle_2.Position = UDim2.new(0.0267757438, 0, 0.00985983759, 0)
    LibTitle_2.Size = UDim2.new(0, 159, 0, 33)
    LibTitle_2.FontFace = library.Font 
    LibTitle_2.Text = n
    LibTitle_2.TextColor3 = Color3.fromRGB(192, 194, 197)
    LibTitle_2.TextSize = 27.000
    LibTitle_2.TextWrapped = true
    LibTitle_2.TextXAlignment = Enum.TextXAlignment.Left
    local line_10 = Instance.new("TextLabel")
    line_10.Name = "line"
    line_10.Parent = oldSection
    line_10.BackgroundColor3 = Color3.fromRGB(63, 90, 106)
    line_10.BackgroundTransparency = 0.650
    line_10.Position = UDim2.new(-0.000995894894, 0, 0.131552652, 0)
    line_10.Size = UDim2.new(1.00099587, 0, 0, 1)
    line_10.FontFace = library.Font 
    line_10.Text = ""
    line_10.TextColor3 = Color3.fromRGB(63, 90, 106)
    line_10.TextSize = 12.000
    line_10.TextXAlignment = Enum.TextXAlignment.Left
    local PenumbraShadow = Instance.new("ImageLabel")
    PenumbraShadow.Name = "PenumbraShadow"
    PenumbraShadow.Parent = oldSection
    PenumbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    PenumbraShadow.BackgroundTransparency = 1.000
    PenumbraShadow.Position = UDim2.new(0.5, 0, 0.496830046, 1)
    PenumbraShadow.Size = UDim2.new(1, 18, 0.993660092, 18)
    PenumbraShadow.ZIndex = 0
    PenumbraShadow.Image = "rbxassetid://1316045217"
    PenumbraShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    PenumbraShadow.ImageTransparency = 0.700
    PenumbraShadow.ScaleType = Enum.ScaleType.Slice
    PenumbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)
    local Items = Instance.new("Frame")
    Items.Name = "Items"
    Items.Parent = oldSection
    Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Items.BackgroundTransparency = 1.000
    Items.Position = UDim2.new(0, 0, 0.183397695, 0)
    Items.Size = UDim2.new(0, 339, 0, 253)
    library.Items[n]=Items
    local UIPadding_2 = Instance.new("UIPadding")
    UIPadding_2.Parent = Items
    UIPadding_2.PaddingLeft = UDim.new(0, 10)
    local UIListLayout_2 = Instance.new("UIListLayout")
    UIListLayout_2.Parent = Items
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_2.Padding = UDim.new(0, 15)
end
function library:FSetColorPicker(t, f)
    local ColorEditor = Instance.new("Frame")
    local ValueSelector = Instance.new("TextButton")
    local UIGradient = Instance.new("UIGradient")
    local Cursor = Instance.new("Frame")
    local ColorWheel = Instance.new("ImageButton")
    local Cursor_2 = Instance.new("ImageLabel")
    local Frame = Instance.new("Frame")
    -- s1: tab, s2: section
    library.Toggles[t].ColorPicker.Visible = true
    library.Constants[f] = Color3.fromRGB(0,0,0)
    ColorEditor.Name = t
    ColorEditor.Parent = library.MainWindow.ColorPickers -- store all color pickers here
    ColorEditor.BackgroundColor3 = Color3.fromRGB(8, 8, 13)
    ColorEditor.Position = UDim2.new(0.768539846, 0, 0.217089117, 0)
    ColorEditor.Size = UDim2.new(0, 373, 0, 253)
    ColorEditor.Visible = false
    ValueSelector.Name = "ValueSelector"
    ValueSelector.Parent = ColorEditor
    ValueSelector.Active = false
    ValueSelector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ValueSelector.Position = UDim2.new(0.0346398875, 0, 0.0927347392, 0)
    ValueSelector.Selectable = false
    ValueSelector.Size = UDim2.new(0, 30, 0, 200)
    ValueSelector.AutoButtonColor = false
    ValueSelector.Text = ""
    
    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
    UIGradient.Rotation = -90
    UIGradient.Parent = ValueSelector
    
    Cursor.Name = "Cursor"
    Cursor.Parent = ValueSelector
    Cursor.BackgroundColor3 = Color3.fromRGB(3, 168, 245)
    Cursor.BorderSizePixel = 0
    Cursor.Position = UDim2.new(0.233333334, 0, 0, 0)
    Cursor.Size = UDim2.new(0.5, 0, 0.0149289705, 5)
    
    ColorWheel.Name = "ColorWheel"
    ColorWheel.Parent = ColorEditor
    ColorWheel.AnchorPoint = Vector2.new(0.5, 0.5)
    ColorWheel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ColorWheel.BackgroundTransparency = 1.000
    ColorWheel.Position = UDim2.new(0.439052045, 0, 0.477510124, 0)
    ColorWheel.Size = UDim2.new(0, 200, 0, 200)
    ColorWheel.Image = "rbxassetid://11224004075"
    
    Cursor_2.Name = "Cursor"
    Cursor_2.Parent = ColorWheel
    Cursor_2.AnchorPoint = Vector2.new(0.5, 0.5)
    Cursor_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Cursor_2.BackgroundTransparency = 1.000
    Cursor_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    Cursor_2.Size = UDim2.new(0, 15, 0, 15)
    Cursor_2.ZIndex = 4
    Cursor_2.Image = "rbxassetid://11226149359"
    
    Frame.Parent = ColorEditor
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame.Position = UDim2.new(0.754579782, 0, 0.368141979, 0)
    Frame.Size = UDim2.new(0, 57, 0, 55)
    
    local abs, pi, sin, asin, acos, sign, deg, rad, clamp = math.abs, math.pi, math.sin, math.asin, math.acos, math.sign, math.deg, math.rad, math.clamp 

    local startAxis = Vector2.new(1, 0)
    local barOffset = 36
    
    local Frame = Frame
    local ColorWheelO = ColorWheel
    local ColorWheel_Radius = ColorWheelO.AbsoluteSize/2
    local ColorWheel_Cursor = ColorWheelO.Cursor
    local ValueSelectorX = ValueSelector
    
    function setColor(newColor)
    	Frame.BackgroundColor3 = newColor
    end
    
    local function updateValueSelector(newColor)
    	ValueSelectorX.BackgroundColor3 = newColor
    end
    
    local function getValue()
    	return ValueSelectorX:GetAttribute("Value") or 1
    end
    
    local function getColorbyVector(vector)
    	
    	local cosVector, sinVector = startAxis:Dot(vector.Unit), startAxis:Cross(vector.Unit)
    	local arcCosVector, arcSinVector = acos(cosVector), asin(sinVector)
    	
    	if sign(arcSinVector) <= 0 then
    		arcCosVector = rad(deg(2*pi) - deg(arcCosVector))
    	end
    	
    	local hue = deg(arcCosVector)/360
    	
    	local saturation = clamp((vector.Magnitude/(ColorWheel_Radius.Magnitude))/sin(rad(45)), 0, 1)
    	
    	local value = getValue()
    	
    	local color = Color3.fromHSV(hue, saturation, value)
    	library.Constants[f] = color
    	library.Toggles[t].ColorPicker.BackgroundColor3 = color
    	return color
    end
    
    local function selectNewColor(x, y)
    	local SizeOffet = ColorWheel.AbsoluteSize/2
    	local ColorWheelOffset = ColorWheel.AbsolutePosition + SizeOffet
    
    	local position = (Vector2.new(x, y - barOffset) - ColorWheelOffset)
    	
    	local relativePosition = position + ColorWheel_Radius
    	
    	if position.Magnitude >= ColorWheel_Radius.X then
    		position = position.Unit * ColorWheel_Radius.X
    		relativePosition = position + ColorWheel_Radius
    	end
    	
    	local rx, ry = relativePosition.X, relativePosition.Y
    	ColorWheel_Cursor.Position = UDim2.fromOffset(rx, ry)
    	
    	position = Vector2.new(position.X, -position.Y)
    	
    	setColor(getColorbyVector(position))
    	ColorWheel:SetAttribute("LastVector", position)
    end
    
    ColorWheel.MouseButton1Down:Connect(function(x, y)
    	local movedConnection
    	local leaveConnection
    	local upConnection
    	
    	movedConnection = ColorWheel.MouseMoved:Connect(selectNewColor)
    	
    	local function disconnect(x, y)
    		selectNewColor(x, y)
    		
    		movedConnection:Disconnect()
    		leaveConnection:Disconnect()
    		upConnection:Disconnect()
    	end
    	leaveConnection = ColorWheel.MouseLeave:Connect(disconnect)
    	upConnection = ColorWheel.MouseButton1Up:Connect(disconnect)
    	
    	selectNewColor(x, y)
    end)
    
    
    local function setNewValue(_,y)
    	local ratio = (y - ValueSelector.AbsolutePosition.Y - 36)/ValueSelector.AbsoluteSize.Y
    	ratio = math.clamp(ratio, 0, 1)
    	ValueSelector:SetAttribute("Value", 1-ratio)
    	ColorWheel.ImageColor3 = Color3.fromRGB(255 * (1-ratio), 255 * (1-ratio), 255 * (1-ratio))
    	
    	local lastVector = ColorWheel:GetAttribute("LastVector")
    	if lastVector then
    		setColor(getColorbyVector(lastVector))
    	end
    	
    	ValueSelector.Cursor.Position = UDim2.new(0, 0, ratio, 0)
    end
    
    ValueSelector.MouseButton1Down:Connect(function(_, y)
    	
    	local movedConnection
    	local leaveConnection
    	local upConnection
    	
    	movedConnection = ValueSelector.MouseMoved:Connect(setNewValue)
    	
    	local function disconnect(_, y)
    		setNewValue(nil, y)
    		
    		movedConnection:Disconnect()
    		leaveConnection:Disconnect()
    		upConnection:Disconnect()
    	end
    	leaveConnection = ValueSelector.MouseLeave:Connect(disconnect)
    	upConnection = ValueSelector.MouseButton1Up:Connect(disconnect)
    	
    	setNewValue(nil, y)
    end)
    
    library.Toggles[t].ColorPicker.TextButton.MouseButton1Down:Connect(function()
        library.MainWindow.ColorPickers[t].Visible = not library.MainWindow.ColorPickers[t].Visible
    end)
end
function library:FSetDropdown(i, f, s)
    library.Constants[f] = i[1];
    local NewDropdown = Instance.new("Frame")
    NewDropdown.ZIndex = 999
    NewDropdown.Name = i[1]
    NewDropdown.Parent = library.Items[s]
    NewDropdown.BackgroundColor3 = Color3.fromRGB(41, 61, 80)
    NewDropdown.BorderSizePixel = 0
    NewDropdown.Position = UDim2.new(0, 0, 0.332015812, 0)
    NewDropdown.Size = UDim2.new(0, 216, 0, 20)
    library:CreateStroke(Color3.fromRGB(27, 40, 52), 1.6, NewDropdown)
    local name_6 = Instance.new("TextLabel")
    local Interact_3 = Instance.new("ImageButton")
    local UIPadding_3 = Instance.new("UIPadding")
    local dropFrame = Instance.new("Frame")
    local yes = Instance.new("ImageLabel")
    local dropScroll = Instance.new("ScrollingFrame")
    local UIListLayout_3 = Instance.new("UIListLayout")
    local Sample = Instance.new("TextButton")
    local UIPadding_4 = Instance.new("UIPadding")
    local PenumbraShadow_2 = Instance.new("ImageLabel")
    name_6.Name = "name"
    name_6.Parent = NewDropdown
    name_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    name_6.BackgroundTransparency = 1.000
    name_6.Position = UDim2.new(0.0254074074, 0, 0.157894731, 0)
    name_6.Size = UDim2.new(0, 141, 0, 12)
    name_6.Font = Enum.Font.Code
    name_6.Text = i[1]
    name_6.TextColor3 = Color3.fromRGB(255, 255, 255)
    name_6.TextScaled = true
    name_6.TextSize = 12.000
    name_6.TextWrapped = true
    name_6.TextXAlignment = Enum.TextXAlignment.Left
    name_6.TextYAlignment = Enum.TextYAlignment.Bottom
    
    Interact_3.Name = "Interact"
    Interact_3.Parent = NewDropdown
    Interact_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Interact_3.BackgroundTransparency = 1.000
    Interact_3.Position = UDim2.new(0, 0, 0.0750636086, 0)
    Interact_3.Size = UDim2.new(1, 0, 0.924937069, 0)
    
    UIPadding_3.Parent = NewDropdown
    UIPadding_3.PaddingTop = UDim.new(0, 1)
    
    dropFrame.Name = "dropFrame"
    dropFrame.Parent = NewDropdown
    dropFrame.BackgroundColor3 = Color3.fromRGB(41, 61, 80)
    dropFrame.Position = UDim2.new(0, 0, 1, 0)
    dropFrame.Size = UDim2.new(0, 216, 0, 61)
    dropFrame.Visible = false
    
    yes.Name = "yes"
    yes.Parent = dropFrame
    yes.AnchorPoint = Vector2.new(0.5, 0.5)
    yes.BackgroundTransparency = 1.000
    yes.Position = UDim2.new(0.5, 0, 0.562403917, 1)
    yes.Size = UDim2.new(1, 18, 0.862512529, 18)
    yes.ZIndex = 0
    yes.Image = "rbxassetid://1316045217"
    yes.ImageColor3 = Color3.fromRGB(0, 0, 0)
    yes.ImageTransparency = 0.700
    yes.ScaleType = Enum.ScaleType.Slice
    yes.SliceCenter = Rect.new(10, 10, 118, 118)
    
    dropScroll.Name = "dropScroll"
    dropScroll.Parent = dropFrame
    dropScroll.Active = true
    dropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    dropScroll.BackgroundTransparency = 1.000
    dropScroll.Size = UDim2.new(0, 216, 0, 61)
    dropScroll.ScrollBarThickness = 0
    
    UIListLayout_3.Parent = dropScroll
    UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
    
    Sample.Name = "Sample"
    Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Sample.BackgroundTransparency = 1.000
    Sample.Size = UDim2.new(0, 209, 0, 29)
    Sample.Font = Enum.Font.Code
    Sample.TextColor3 = Color3.fromRGB(255, 255, 255)
    Sample.TextSize = 13.000
    Sample.TextXAlignment = Enum.TextXAlignment.Left
    
    UIPadding_4.Parent = dropScroll
    UIPadding_4.PaddingLeft = UDim.new(0, 7)
    
    PenumbraShadow_2.Name = "PenumbraShadow"
    PenumbraShadow_2.Parent = NewDropdown
    PenumbraShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
    PenumbraShadow_2.BackgroundTransparency = 1.000
    PenumbraShadow_2.Position = UDim2.new(0.5, 0, 0.496830046, 1)
    PenumbraShadow_2.Size = UDim2.new(1, 18, 0.993660092, 18)
    PenumbraShadow_2.ZIndex = 0
    PenumbraShadow_2.Image = "rbxassetid://1316045217"
    PenumbraShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
    PenumbraShadow_2.ImageTransparency = 0.700
    PenumbraShadow_2.ScaleType = Enum.ScaleType.Slice
    PenumbraShadow_2.SliceCenter = Rect.new(10, 10, 118, 118)
    
    for _, v in next, i do 
        local item = Sample:Clone()
        item.Name = v
        item.Text = v
        item.Parent = dropScroll
        
        
        item.MouseButton1Click:Connect(function()
            name_6.Text = item.Name
            dropFrame.Visible = false
            library.Constants[f] = item.Name    
        end)
    end
    
    Interact_3.MouseButton1Click:Connect(function()
        dropFrame.Visible = not dropFrame.Visible
    end)
    
end
function library:FSetButton(t, c, s)
     local theButton = Instance.new("TextButton")
     local buttonShadow = Instance.new("ImageLabel")
     theButton.Name = t
     theButton.Parent = library.Items[s]
     theButton.BackgroundColor3 = Color3.fromRGB(41, 61, 80)
     theButton.Position = UDim2.new(0, 0, 0.470355719, 0)
     theButton.Size = UDim2.new(0, 216, 0, 34)
     theButton.Font = Enum.Font.Code
     theButton.TextColor3 = Color3.fromRGB(255, 255, 255)
     theButton.TextSize = 14.000
     theButton.Text = t
     theButton.MouseButton1Click:Connect(function()
        task.spawn(c)
     end)
     buttonShadow.Name = "buttonShadow"
     buttonShadow.Parent = theButton
     buttonShadow.AnchorPoint = Vector2.new(0.5, 0.5)
     buttonShadow.BackgroundTransparency = 1.000
     buttonShadow.Position = UDim2.new(0.5, 0, 0.496830046, 1)
     buttonShadow.Size = UDim2.new(1, 18, 0.993660092, 18)
     buttonShadow.ZIndex = 0
     buttonShadow.Image = "rbxassetid://1316045217"
     buttonShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
     buttonShadow.ImageTransparency = 0.700
     buttonShadow.ScaleType = Enum.ScaleType.Slice
     buttonShadow.SliceCenter = Rect.new(10, 10, 118, 118)
end
function library:FSetToggle(n, c, s)
    library.Constants[c] = false
    local Example_2 = Instance.new("Frame")
    Example_2.Name = n
    Example_2.Parent = library.Items[s]
    Example_2.BackgroundColor3 = Color3.fromRGB(3, 168, 245)
    Example_2.Position = UDim2.new(0.0250684898, 0, 0.313624293, 0)
    Example_2.Size = UDim2.new(0, 10, 0, 10)
    library.Toggles[n] = Example_2
    library:CreateStroke(Color3.fromRGB(120,149,162), 1.2, Example_2)
    local Interact_10 = Instance.new("ImageButton")
    Interact_10.Name = "Interact"
    Interact_10.Parent = Example_2
    Interact_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Interact_10.BackgroundTransparency = 1.000
    Interact_10.Size = UDim2.new(1, 0, 1, 0)
    local name_13 = Instance.new("TextLabel")
    name_13.Name = "name"
    name_13.Parent = Example_2
    name_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    name_13.BackgroundTransparency = 1.000
    name_13.Position = UDim2.new(1.7099998, 0, -0.700000048, 0)
    name_13.Size = UDim2.new(0, 112, 0, 18)
    name_13.Font = Enum.Font.Code
    name_13.Text = n
    name_13.TextColor3 = Color3.fromRGB(255, 255, 255)
    name_13.TextScaled = true
    name_13.TextSize = 12.000
    name_13.TextWrapped = true
    name_13.TextXAlignment = Enum.TextXAlignment.Left
    name_13.TextYAlignment = Enum.TextYAlignment.Bottom
    local UIGradient_19 = Instance.new("UIGradient")
    UIGradient_19.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(179, 179, 179)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(177, 255, 52)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
    UIGradient_19.Rotation = -45
    UIGradient_19.Parent = Example_2
    UIGradient_19.Enabled=false
    Example_2.BackgroundTransparency=1
    local ColorPicker = Instance.new("Frame")
    ColorPicker.Name = "ColorPicker"
    ColorPicker.Parent = Example_2
    ColorPicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ColorPicker.Position = UDim2.new(13.5, 0, 0.161381528, 0)
    ColorPicker.Size = UDim2.new(0, 24, 0, 6)
    ColorPicker.Visible = false
    local TextButton = Instance.new"TextButton"
    TextButton.Parent = ColorPicker
    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.BackgroundTransparency = 1.000
    TextButton.Size = UDim2.new(0, 24, 0, 6)
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = ""
    TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.TextSize = 14.000
    Interact_10.MouseButton1Down:Connect(function()
        if Example_2.BackgroundTransparency == 0 then
    		Example_2.BackgroundTransparency=1
    		Example_2.UIGradient.Enabled=true
    		library.Constants[c]=false
	    else
    		Example_2.BackgroundTransparency=0
    		Example_2.UIGradient.Enabled=false
    		library.Constants[c]=true
	    end    
    end)
end
function library:FSetSlider(n, f, s)
    library.Constants[f]=0
    local WorkSlider = Instance.new("Frame")
    WorkSlider.Name = "WorkSlider"
    WorkSlider.Parent = library.Items[s]
    WorkSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WorkSlider.Position = UDim2.new(0.494812608, 0, 0.433330983, 0)
    WorkSlider.Size = UDim2.new(0, 120, 0, 2)
    local UIGradient_23 = Instance.new("UIGradient")
    UIGradient_23.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(166, 166, 166)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
    UIGradient_23.Rotation = 270
    UIGradient_23.Parent = WorkSlider
    local name_16 = Instance.new("TextLabel")
    local value_4 = Instance.new("TextLabel")
    local fill_4 = Instance.new("Frame")
    local Frame_5 = Instance.new("Frame")
    Frame_5.Parent = fill_4
    Frame_5.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame_5.BackgroundColor3 = Color3.fromRGB(61, 133, 224)
    Frame_5.Position = UDim2.new(1.00999999, 0, 0.5, 0)
    Frame_5.Size = UDim2.new(0, 8, 0, 8)
    local UICorner_13 = Instance.new("UICorner")
    UICorner_13.CornerRadius = UDim.new(1, 0)
    UICorner_13.Parent = Frame_5
    local UICorner_12 = Instance.new("UICorner")
    local UIGradient_24 = Instance.new("UIGradient")
    name_16.Name = "name"
    name_16.Parent = WorkSlider
    name_16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    name_16.BackgroundTransparency = 1.000
    name_16.Position = UDim2.new(1.31000006, 0, -2.8469696, 0)
    name_16.Size = UDim2.new(0, 45, 0, 13)
    name_16.Font = Enum.Font.Code
    name_16.Text = n
    name_16.TextColor3 = Color3.fromRGB(255, 255, 255)
    name_16.TextScaled = true
    name_16.TextSize = 12.000
    name_16.TextWrapped = true
    name_16.TextXAlignment = Enum.TextXAlignment.Left
    
    value_4.Name = "value"
    value_4.Parent = WorkSlider
    value_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    value_4.BackgroundTransparency = 1.000
    value_4.Position = UDim2.new(1.04866672, 0, -2.79999995, 0)
    value_4.Size = UDim2.new(0, 23, 0, 12)
    value_4.FontFace = library.Font
    value_4.Text = "100"
    value_4.TextColor3 = Color3.fromRGB(255, 255, 255)
    value_4.TextScaled = true
    value_4.TextSize = 12.000
    value_4.TextStrokeTransparency = 0.000
    value_4.TextTransparency = 0.500
    value_4.TextWrapped = true
    
    fill_4.Name = "fill"
    fill_4.Parent = WorkSlider
    fill_4.BackgroundColor3 = Color3.fromRGB(61, 133, 224)
    fill_4.Size = UDim2.new(0, 120, 0, 2)
    fill_4.ZIndex = 0
    
    UICorner_12.CornerRadius = UDim.new(1, 0)
    UICorner_12.Parent = fill_4
    
    UIGradient_24.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(166, 166, 166)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
    UIGradient_24.Rotation = 270
    UIGradient_24.Parent = fill_4
    local TextButton = Instance.new('TextButton')
    TextButton.Parent = Frame_5
    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.BackgroundTransparency = 1.000
    TextButton.Position = UDim2.new(0, 0, -0.211742401, 0)
    TextButton.Size = UDim2.new(0, 14, 0, 12)
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = ""
    TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.TextSize = 14.000
    
    local UserInputService = game:GetService("UserInputService")
    local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
    
    local sliderRange = {0,0} -- min, max (can be 1,0 or -1,2)
    -- ^ Range will be from 0.0000 to 1.000
    
    local function OffsetToScale(offset,parent) 
    	return (offset/parent.AbsoluteSize.X) 
    end
    
    local function ConvertRange(oldMin, oldMax, number)
    	return sliderRange[1] + (number - oldMin) * (sliderRange[2] - sliderRange[1]) / (oldMax - oldMin)
    end
    
    local slider = WorkSlider
    local slide = fill_4
    local slideButton = fill_4
    local slideButtonSize = slideButton.Size.X.Scale
    
    local buttonDown = false
    
   TextButton.MouseButton1Down:Connect(function()
    	buttonDown = true
    end)
    
    
    Mouse.Move:Connect(function()
    	if not buttonDown then return end
    
    	local abspos = OffsetToScale(Mouse.X - slider.AbsolutePosition.X, slider)
    	local pos = math.clamp(abspos, slideButtonSize / 2, 1 - slideButtonSize / 2)
    	value_4.Text = tostring(math.floor(slide.Size.X.Scale * 100))
    	library.Constants[f]=math.floor(slide.Size.X.Scale * 100)
    	slide:TweenSize(UDim2.new(pos, 0, slide.Size.Y.Scale, 2), "Out", "Sine", .1, true)
    	--ConvertRange(slideButtonSize / 2, 1 - slideButtonSize / 2, pos)
    end)
    
    UserInputService.InputEnded:Connect(function(input,gameProcessed)
    	if input.UserInputType == Enum.UserInputType.MouseButton1 then
    		buttonDown = false 
    	end
    end)
end

--[[
    Quick Explanation: Config System
    
    To save your config, call library:SaveConfig('myCfg.txt', settingsTable) [settingsTable refers to your table where your features are stored as true or false]
    To LOAD your config, do the following:
    
    local cfg = library:GetConfig'myCfg.txt'
    settingsTable=cfg -- this will set all your default values to the config's value
]]



