--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.5) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v43,v44) local v45={};for v57=1, #v43 do v6(v45,v0(v4(v1(v2(v43,v57,v57 + 1 )),v1(v2(v44,1 + (v57% #v44) ,1 + (v57% #v44) + 1 )))%256 ));end return v5(v45);end local v8,v9,v10,v11,v12,v13,v14,v15,v16,v17,v18=pcall,getgenv,next,setmetatable,Vector2.new,CFrame.new,Color3.fromRGB,Drawing.new,TweenInfo.new,string.upper,mousemoverel or (Input and Input.MouseMove) ;local v19=game:GetService(v7("\227\214\213\22\227\169\209\23\210\198","\126\177\163\187\69\134\219\167"));local v20=game:GetService(v7("\22\222\47\215\213\45\221\63\209\207\38\223\60\204\255\38","\156\67\173\74\165"));local v21=game:GetService(v7("\0\160\76\19\178\21\67\38\161\64\21\185","\38\84\215\41\118\220\70"));local v22=game:GetService(v7("\96\26\35\11\251\66\5","\158\48\118\66\114"));local v23=v22.LocalPlayer;local v24=workspace.CurrentCamera;local v25,v26,v27,v28,v29,v30=2000,false,false,{};v9().AirHub.Aimbot={[v7("\152\33\4\34\122\171\252\184","\155\203\68\112\86\19\197")]={[v7("\99\211\55\254\76\125\225","\152\38\189\86\156\32\24\133")]=false,[v7("\200\82\166\75\223\95\162\69\247","\38\156\55\199")]=false,[v7("\137\113\117\62\22\87\242\70\171\118","\35\200\29\28\72\115\20\154")]=true,[v7("\46\190\221\211\174\36\49\26\180","\84\121\223\177\191\237\76")]=false,[v7("\136\83\199\179\51\68\57\215\178\66\208","\161\219\54\169\192\90\48\80")]=121 -(17 + 104) ,[v7("\125\80\9\34\78\71\18\14\76\91","\69\41\34\96")]=v7("\145\204\194\25\7\9\169\215\195\5\12\121","\75\220\163\183\106\98"),[v7("\54\181\140\48\213\7","\185\98\218\235\87")]=false,[v7("\231\51\36\237\238\171\217\40","\202\171\92\71\134\190")]=v7("\1\196\45\140","\232\73\161\76")},[v7("\157\246\116\110\27\175\205\75\83\25\168","\126\219\185\34\61")]={[v7("\41\192\95\112\114\114\247","\135\108\174\62\18\30\23\147")]=true,[v7("\128\224\57\194\26\162\54","\167\214\137\74\171\120\206\83")]=true,[v7("\170\253\61\72\246\179","\199\235\144\82\61\152")]=411 -161 ,[v7("\36\25\181\36\21","\75\103\118\217")]=v14(14 + 5 ,0 + 0 ,543 -288 ),[v7("\235\91\115\31\188\26\228\91\124\27\171","\126\167\52\16\116\217")]=v14(428 -173 ,0,0 + 0 ),[v7("\252\60\33\142\167\9\253\218\43\46\131\173","\156\168\78\64\224\212\121")]=1,[v7("\52\231\161\203\20","\174\103\142\197")]=1696 -(1373 + 263) ,[v7("\98\32\86\59\46\80\253\69\59","\152\54\72\63\88\69\62")]=1001 -(451 + 549) ,[v7("\242\205\226\80\209\192","\60\180\164\142")]=false},[v7("\126\113\51\10\46\255\17\84\91","\114\56\62\101\73\71\141")]=v15(v7("\155\224\201\199\180\236","\164\216\137\187"))};local v32=v9().AirHub.Aimbot;local function v33(v46) return v12(v46.X,v46.Y);end local function v34() local v47=0;while true do if (v47==(0 + 0)) then v32.Locked=nil;v32.FOVCircle.Color=v32.FOVSettings.Color;v47=1 -0 ;end if (v47==1) then v20.MouseDeltaSensitivity=v30;if v29 then v29:Cancel();end break;end end end local function v35() if  not v32.Locked then local v58=0 -0 ;while true do if (v58==(1384 -(746 + 638))) then v25=(v32.FOVSettings.Enabled and v32.FOVSettings.Amount) or (753 + 1247) ;for v70,v71 in v10,v22:GetPlayers() do if ((v71~=v23) and v71.Character and v71.Character:FindFirstChild(v32.Settings.LockPart) and v71.Character:FindFirstChildOfClass(v7("\250\243\60\179\168\241\2\214","\107\178\134\81\210\198\158"))) then local v80=0 -0 ;local v81;local v82;local v83;local v84;while true do if ((342 -(218 + 123))==v80) then v83=nil;v84=nil;v80=2;end if (v80==(1583 -(1535 + 46))) then while true do if (0==v81) then if (v32.Settings.TeamCheck and (v71.TeamColor==v23.TeamColor)) then continue;end if (v32.Settings.AliveCheck and (v71.Character:FindFirstChildOfClass(v7("\16\27\143\199\164\55\7\134","\202\88\110\226\166")).Health<=(0 + 0))) then continue;end v81=1;end if ((1 + 2)==v81) then if ((v84<v25) and v83) then local v93=560 -(306 + 254) ;while true do if (v93==(0 + 0)) then v25=v84;v32.Locked=v71;break;end end end break;end if (v81==(1 -0)) then if (v32.Settings.WallCheck and ( #(v24:GetPartsObscuringTarget({v71.Character[v32.Settings.LockPart].Position},v71.Character:GetDescendants()))>0)) then continue;end v82,v83=v24:WorldToViewportPoint(v71.Character[v32.Settings.LockPart].Position);v81=2 + 0 ;end if (2==v81) then v82=v33(v82);v84=(v20:GetMouseLocation() -v82).Magnitude;v81=7 -4 ;end end break;end if (v80==(603 -(268 + 335))) then v81=290 -(60 + 230) ;v82=nil;v80=573 -(426 + 146) ;end end end end break;end end elseif ((v20:GetMouseLocation() -v33(v24:WorldToViewportPoint(v32.Locked.Character[v32.Settings.LockPart].Position))).Magnitude>v25) then v34();end end local function v36() local v48=0 + 0 ;local v49;while true do if ((1456 -(282 + 1174))==v48) then v49=811 -(569 + 242) ;while true do if (v49==1) then v28.InputBeganConnection=v20.InputBegan:Connect(function(v76) if  not v26 then v8(function() if (((v76.UserInputType==Enum.UserInputType.Keyboard) and (v76.KeyCode==Enum.KeyCode[(( #v32.Settings.TriggerKey==1) and v17(v32.Settings.TriggerKey)) or v32.Settings.TriggerKey ])) or (v76.UserInputType==Enum.UserInputType[v32.Settings.TriggerKey])) then if v32.Settings.Toggle then local v86=0 -0 ;local v87;while true do if (0==v86) then v87=0 + 0 ;while true do if ((1024 -(706 + 318))==v87) then v27= not v27;if  not v27 then v34();end break;end end break;end end else v27=true;end end end);end end);v28.InputEndedConnection=v20.InputEnded:Connect(function(v77) if  not v26 then if  not v32.Settings.Toggle then v8(function() if (((v77.UserInputType==Enum.UserInputType.Keyboard) and (v77.KeyCode==Enum.KeyCode[(( #v32.Settings.TriggerKey==(1252 -(721 + 530))) and v17(v32.Settings.TriggerKey)) or v32.Settings.TriggerKey ])) or (v77.UserInputType==Enum.UserInputType[v32.Settings.TriggerKey])) then local v88=1271 -(945 + 326) ;local v89;while true do if (v88==0) then v89=0 -0 ;while true do if (v89==(0 + 0)) then v27=false;v34();break;end end break;end end end end);end end end);break;end if (v49==(700 -(271 + 429))) then v30=v20.MouseDeltaSensitivity;v28.RenderSteppedConnection=v19.RenderStepped:Connect(function() local v78=0 + 0 ;local v79;while true do if ((1500 -(1408 + 92))==v78) then v79=1086 -(461 + 625) ;while true do if ((1288 -(993 + 295))==v79) then if (v32.FOVSettings.Enabled and v32.Settings.Enabled) then local v90=0;local v91;while true do if (v90==(0 + 0)) then v91=1171 -(418 + 753) ;while true do if (v91==0) then v32.FOVCircle.Radius=v32.FOVSettings.Amount;v32.FOVCircle.Thickness=v32.FOVSettings.Thickness;v91=1;end if (v91==2) then v32.FOVCircle.Color=v32.FOVSettings.Color;v32.FOVCircle.Transparency=v32.FOVSettings.Transparency;v91=2 + 1 ;end if ((1 + 0)==v91) then v32.FOVCircle.Filled=v32.FOVSettings.Filled;v32.FOVCircle.NumSides=v32.FOVSettings.Sides;v91=2;end if (v91==(1 + 2)) then v32.FOVCircle.Visible=v32.FOVSettings.Visible;v32.FOVCircle.Position=v12(v20:GetMouseLocation().X,v20:GetMouseLocation().Y);break;end end break;end end else v32.FOVCircle.Visible=false;end if (v27 and v32.Settings.Enabled) then v35();if v32.Locked then local v94=0 + 0 ;local v95;while true do if (v94==(529 -(406 + 123))) then v95=0;while true do if (v95==(1769 -(1749 + 20))) then if v32.Settings.ThirdPerson then local v114=v24:WorldToViewportPoint(v32.Locked.Character[v32.Settings.LockPart].Position);v18((v114.X-v20:GetMouseLocation().X) * v32.Settings.ThirdPersonSensitivity ,(v114.Y-v20:GetMouseLocation().Y) * v32.Settings.ThirdPersonSensitivity );else local v115=0 + 0 ;while true do if (v115==0) then if (v32.Settings.Sensitivity>(1322 -(1249 + 73))) then v29=v21:Create(v24,v16(v32.Settings.Sensitivity,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{[v7("\224\41\144\246\199\198","\170\163\111\226\151")]=v13(v24.CFrame.Position,v32.Locked.Character[v32.Settings.LockPart].Position)});v29:Play();else v24.CFrame=v13(v24.CFrame.Position,v32.Locked.Character[v32.Settings.LockPart].Position);end v20.MouseDeltaSensitivity=0 + 0 ;break;end end end v32.FOVCircle.Color=v32.FOVSettings.LockedColor;break;end end break;end end end end break;end end break;end end end);v49=1146 -(466 + 679) ;end end break;end end end v28.TypingStartedConnection=v20.TextBoxFocused:Connect(function() v26=true;end);v28.TypingEndedConnection=v20.TextBoxFocusReleased:Connect(function() v26=false;end);v32.Functions={};v32.Functions.Exit=function(v50) local v51=0;while true do if (v51==(6 -3)) then v34=nil;v35=nil;break;end if (v51==(0 -0)) then for v66,v67 in v10,v28 do v67:Disconnect();end v32.FOVCircle:Remove();v51=1;end if ((1901 -(106 + 1794))==v51) then v9().AirHub.Aimbot.Functions=nil;v9().AirHub.Aimbot=nil;v51=2;end if ((1 + 1)==v51) then local v65=0;while true do if (v65==1) then v51=1 + 2 ;break;end if (v65==(0 -0)) then v36=nil;v33=nil;v65=2 -1 ;end end end end end;v32.Functions.Restart=function(v52) local v53=114 -(4 + 110) ;while true do if (v53==0) then for v68,v69 in v10,v28 do v69:Disconnect();end v36();break;end end end;v32.Functions.ResetSettings=function(v54) v32.Settings={[v7("\52\62\179\58\66\50\45","\73\113\80\210\88\46\87")]=false,[v7("\181\41\204\31\196\137\41\206\25","\135\225\76\173\114")]=false,[v7("\59\225\177\166\169\158\175\31\238\179","\199\122\141\216\208\204\221")]=true,[v7("\154\220\28\252\91\254\168\222\27","\150\205\189\112\144\24")]=false,[v7("\22\129\177\95\13\156\24\6\44\144\166","\112\69\228\223\44\100\232\113")]=584 -(57 + 527) ,[v7("\224\23\14\193\178\76\131\198\12\8\221","\230\180\127\103\179\214\28")]=false,[v7("\184\13\86\84\224\113\229\158\22\80\72\215\68\238\159\12\75\79\242\72\244\149","\128\236\101\63\38\132\33")]=1430 -(41 + 1386) ,[v7("\152\187\24\67\177\238\221\135\172\8","\175\204\201\113\36\214\139")]=v7("\106\195\32\207\1\101\217\33\200\11\73\158","\100\39\172\85\188"),[v7("\153\119\190\135\63\168","\83\205\24\217\224")]=false,[v7("\202\202\206\54\214\196\223\41","\93\134\165\173")]=v7("\150\247\192\198","\30\222\146\161\162\90\174\210")};v32.FOVSettings={[v7("\192\64\113\8\233\75\116","\106\133\46\16")]=true,[v7("\110\41\96\245\88\76\93","\32\56\64\19\156\58")]=true,[v7("\123\197\234\67\84\230","\224\58\168\133\54\58\146")]=353 -(17 + 86) ,[v7("\122\89\71\242\103","\107\57\54\43\157\21\230\231")]=v14(255,174 + 81 ,255),[v7("\247\132\18\254\188\216\236\212\135\30\231","\175\187\235\113\149\217\188")]=v14(255,0,0 -0 ),[v7("\8\189\128\66\240\105\121\46\170\143\79\250","\24\92\207\225\44\131\25")]=1,[v7("\120\218\188\73\8","\29\43\179\216\44\123")]=173 -113 ,[v7("\137\209\41\79\182\215\37\95\174","\44\221\185\64")]=167 -(122 + 44) ,[v7("\39\238\68\83\118\5","\19\97\135\40\63")]=false};end;v11(v32.Functions,{[v7("\145\99\61\62\56\56\160\88\54\35","\81\206\60\83\91\79")]=warn});v36();
