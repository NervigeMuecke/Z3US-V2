
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))();
local Window = Rayfield:CreateWindow({Name="Touch Football | Z3US Projects",LoadingTitle="Touch Football",LoadingSubtitle="By Z3US Projects",ConfigurationSaving={Enabled=true,FolderName=nil,FileName="asdsafas13"}});
local Tab = Window:CreateTab("Main", 4483362458);
Tab:CreateToggle({Name="Anti-AFK",CurrentValue=false,Callback=function(Value)
	a = Value;
	while a do
		task.wait(4);
		pcall(function()
			game.Players.LocalPlayer.Character.PlayerActive:Destroy();
		end);
	end
end});
local Slider = Tab:CreateSlider({Name="Ball Size",Range={4,15},Increment=1,Suffix="Size",CurrentValue=0,Flag="Slider2311",Callback=function(soccer)
	for i, v in pairs(game:GetDescendants()) do
		if (v.Name == "SoccerBall") then
			v.Size = Vector3.new(soccer, soccer, soccer);
		end
	end
end});
Tab:CreateButton({Name="Walkspeed | Keybind: X",Callback=function()
	repeat
		wait();
	until game:IsLoaded() 
	local L_134_ = game:service("Players");
	local L_135_ = L_134_.LocalPlayer;
	repeat
		wait();
	until L_135_.Character 
	local L_136_ = game:service("UserInputService");
	local L_137_ = game:service("RunService");
	getgenv().Multiplier = 0.5;
	local L_138_ = true;
	local L_139_;
	L_136_.InputBegan:connect(function(L_140_arg0)
		if (L_140_arg0.KeyCode == Enum.KeyCode.LeftBracket) then
			Multiplier = Multiplier + 0.01;
			print(Multiplier);
			wait(0.2);
			while L_136_:IsKeyDown(Enum.KeyCode.LeftBracket) do
				wait();
				Multiplier = Multiplier + 0.01;
				print(Multiplier);
			end
		end
		if (L_140_arg0.KeyCode == Enum.KeyCode.RightBracket) then
			Multiplier = Multiplier - 0.01;
			print(Multiplier);
			wait(0.2);
			while L_136_:IsKeyDown(Enum.KeyCode.RightBracket) do
				wait();
				Multiplier = Multiplier - 0.01;
				print(Multiplier);
			end
		end
		if (L_140_arg0.KeyCode == Enum.KeyCode.X) then
			L_138_ = not L_138_;
			if (L_138_ == true) then
				repeat
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + (game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Multiplier);
					game:GetService("RunService").Stepped:wait();
				until L_138_ == false 
			end
		end
	end);
end});
local Slider = Tab:CreateSlider({Name="WalkSpeed",Range={0,0.5},Increment=0.1,Suffix="Speed",CurrentValue=0,Flag="Slider1",Callback=function(s)
	getgenv().Multiplier = s;
end});
Tab:CreateToggle({Name="Ball Esp",CurrentValue=false,Callback=function(Value)
	for i, v in pairs(game:GetDescendants()) do
		if (v.Name == "SoccerBall") then
			local BillboardGui = Instance.new("BillboardGui");
			local TextLabel = Instance.new("TextLabel");
			BillboardGui.Name = "SoccerBall1";
			BillboardGui.Parent = v;
			BillboardGui.AlwaysOnTop = true;
			BillboardGui.LightInfluence = 1;
			BillboardGui.Size = UDim2.new(0, 50, 0, 50);
			BillboardGui.StudsOffset = Vector3.new(0, 2, 0);
			TextLabel.Parent = BillboardGui;
			TextLabel.BackgroundColor3 = Color3.new(1, 1, 1);
			TextLabel.BackgroundTransparency = 1;
			TextLabel.Size = UDim2.new(1, 0, 1, 0);
			TextLabel.Text = "Soccer Ball";
			TextLabel.TextStrokeTransparency = 0;
			TextLabel.TextColor3 = Color3.new(1000, 0, 100);
			TextLabel.TextScaled = true;
		end
	end
end});
for _, v in pairs(Functions) do
	task.spawn(v);
end