local NeverLose = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ali-lov3/BetterNeverlose/refs/heads/main/source.lua"))()

local Notification = NeverLose:CreateNotification();
local Logging = NeverLose:CreateLogger();
local Indicator = NeverLose:CreateIndicator();
local window = NeverLose:CreateWindow({
	Logo = NeverLose.GlobalLogo,
	Name = "Neverlose",
	Content = "Counter-Strike 2",
	Size = NeverLose.Scales.Default,
	ConfigFolder = "NeverLoseConfigs",
	Enable3DRenderer = false,
	Keybind = "Insert"
});

window:SetAccount({
	Username = "Player",
	Expires = "Never"
});

local Watermark = window:Watermark();

local HC = Indicator.new({
	Name = "HC",
	Icon = 'crosshairs',
	Color = 'Red',
})

window:AddTabLabel('AIMBOT')

local ping = Watermark:AddBlock("chart-four-vertical-bars" , "0MS");
local UITogg = Watermark:AddBlock("cube-vertexes" , "Neverlose");

UITogg:Input(function()
	window:ToggleInterface();
end);

task.spawn(function()
	while true do task.wait(1)
		ping:SetText(tostring(math.random(30,90))..'MS')
	end
end)

local Rage = window:AddTab({
	Icon = 'crosshairs',
	Name = "Rage",
})

local Legit = window:AddTab({
	Icon = 'mouse-scrollwheel',
	Name = "Legit"
})

window:AddTabLabel('VISUALS')

local Visuals = window:AddTab({
	Icon = 'cube-vertexes',
	Name = "Visuals"
})

window:AddTabLabel('MISC')

local Misc = window:AddTab({
	Icon = 'chart-four-vertical-bars',
	Name = "Misc"
})

local RageMain = Rage:AddSubTab({
	Name = "Main"
})

local RageAntiAim = Rage:AddSubTab({
	Name = "Anti-Aim"
})

local LegitAim = Legit:AddSubTab({
	Name = "Aim Assist"
})

local LegitTrigger = Legit:AddSubTab({
	Name = "Triggerbot"
})

local VisualsEsp = Visuals:AddSubTab({
	Name = "ESP"
})

local Raging = RageMain:AddSection({
	Name = "MAIN"
})

local Selection = RageMain:AddSection({
	Name = "SELECTION",
	Position = 'left'
})

local Other = RageMain:AddSection({
	Name = "OTHER",
	Position = 'right'
})

local AntiAim = RageAntiAim:AddSection({
	Name = "ANTI-AIM",
	Position = 'left'
})

local LegitAssist = LegitAim:AddSection({
	Name = "AIM ASSIST",
	Position = 'left'
})

local LegitTrig = LegitTrigger:AddSection({
	Name = "TRIGGERBOT",
	Position = 'left'
})

local MiscElements = Misc:AddSection({
	Name = "ELEMENTS",
	Position = 'left'
})

local MiscInputs = Misc:AddSection({
	Name = "INPUTS",
	Position = 'right'
})

local MiscActions = Misc:AddSection({
	Name = "ACTIONS",
	Position = 'right'
})

local EspManager = VisualsEsp:AddESPManager({
	FlagPrefix = "esp_",
})

Raging:AddLabel('Ts so skbidi\nfr noi cap',true)

local EnabledRage = Raging:AddLabel('Enabled')
local SlientAim = Raging:AddLabel('Silent Aim')

EnabledRage:ToolTip("Dynamically adjusts grenade throw angles to counteract\nmovement velocity, allowing precise straight-line throws\neven while strafing")
EnabledRage:AddToggle({
	Default = false,
	Callback = print;
	Flag = "Ragebot",
})

EnabledRage:AddKeybind({
	Default = "R",
	Blacklist = {"Escape"},
	Callback = print,
	Flag = "ragebot_key",
})

EnabledRage:AddOption():AddLabel("Force Shoot"):AddToggle({
	Default = false,
	Callback = print,
	Flag = "FS"
})

SlientAim:AddToggle({
	Default = false,
	Callback = print,
	Flag = "SLIENTAIM",
})

SlientAim:AddColorPicker({
	Default = Color3.fromRGB(255, 70, 70),
	Callback = print,
	Flag = "silentaim_color",
})

local opt = SlientAim:AddOption();
opt:AddLabel('Perfect Silent-Aim'):AddToggle({
	Default = false,
	Callback = print,
	Flag = "HideShot",
})

opt:AddLabel('Perfect Silent-Aim'):AddToggle({
	Default = false,
	Callback = print,
	Flag = "HideShot2",
})

opt:AddLabel('Silent Aim Key'):AddKeybind({
	Default = "Q",
	Callback = print,
	Flag = "silentaim_key",
})

Raging:AddLabel('Automatic Fire'):AddToggle({
	Default = false,
	Flag = "AutoFire",
})

Raging:AddLabel('Aim Through Walls'):AddToggle({
	Default = false,
	Flag = "AWALLS",
})

Raging:AddLabel('Field of View'):AddSlider({
	Min = 0,
	Max = 2600,
	Rounding = 1,
	Default = 100,
	Type = "Lv",
	Size = 100,
	Callback = print,
	Flag = "fov",
})

Raging:AddLabel('FOV Circle Color'):AddColorPicker({
	Default = Color3.fromRGB(255, 255, 255),
	Callback = print,
	Flag = "fov_color",
})

Selection:AddLabel("Target"):AddDropdown({
	Default = 'Hightest Damage',
	Values = {
		'Hightest Damage',
		'Automatic',
		'Lowest Damage'
	},
	Callback = print,
	Flag = "target_box",
})

Selection:AddLabel('Hitboxes'):AddDropdown({
	Default = {'Head'},
	Multi = true,
	Values = {
		'Head',
		'Body',
		'Arms',
		'Legs'
	},
	Flag = "hitboxes",
	Callback = print
})

local Multipoint = Selection:AddLabel('Multipoint')

Multipoint:AddOption():AddLabel('Multipoint'):AddSlider({
	Min = 0,
	Max = 100,
	Default = 75,
	Flag = "multipoint",
	Callback = print
})

Multipoint:AddDropdown({
	Default = {'Head'},
	Multi = true,
	Values = {
		'Head',
		'Body',
		'Arms',
		'Legs'
	},
	Flag = "hitboxmuklti",
	Callback = print
})

local hc = Selection:AddLabel('Hit Chance')

hc:AddSlider({
	Min = 0,
	Max = 100,
	Type = "%",
	Nums = {
		[0] = 'Auto',
	},
	Flag = "hc",
	Size = 95,
	Default = 50,
})

hc:AddOption():AddLabel('Something'):AddToggle({
	Default = false
})

local md = Selection:AddLabel('Min Damage')

md:AddSlider({
	Min = 0,
	Max = 100,
	Nums = {
		[0] = 'Auto',
	},
	Flag = "md",
	Size = 95,
	Default = 15,
})

md:AddOption():AddLabel('Something'):AddToggle({
	Default = false
})

local qs = Selection:AddLabel('Quick Stop')

qs:AddToggle({
	Default = false,
	Flag = "astop",
	Callback = print
})

qs:AddOption():AddLabel('Auto Stop'):AddDropdown({
	Default = {'Early'},
	Multi = true,
	Flag = "astop_module",
	Values = {'Early','In Air','Between Shot' , 'Force Accurate'},
	Callback = print
})

Selection:AddLabel('Quick Scope'):AddToggle({
	Default = false,
	Flag = "ascope",
	Callback = print
})

Other:AddLabel('History'):AddDropdown({
	Default = 'High',
	Values = {'Minimum','Low','High','Maximum'},
	Flag = "backtrack",
	Callback = print
})

Other:AddLabel('Delay Shot'):AddToggle({
	Default = false,
	Flag = "delayshoot",
	Callback = print
})

Other:AddLabel('Remove Recoil'):AddToggle({
	Default = false,
	Flag = "removerecoil",
	Callback = print
})

Other:AddLabel('Remove Spread'):AddToggle({
	Default = false,
	Flag = "removespread",
	Callback = print
})

Other:AddLabel('Duck Peek Assist'):AddToggle({
	Default = false,
	Callback = print
})

local qpa = Other:AddLabel('Quick Peek Assist');
qpa:AddToggle({
	Default = false,
	Flag = "qpa",
	Callback = print
})

qpa:AddColorPicker({
	Default = Color3.fromRGB(80, 160, 255),
	Callback = print,
	Flag = "qpa_color",
})

qpa:AddKeybind({
	Default = "V",
	Callback = print,
	Flag = "qpa_key",
})

qpa:AddOption():AddLabel('Something tung tung')

local dt = Other:AddLabel('Double Tap')

dt:AddToggle({
	Default = false,
	Callback = print,
	Flag = "dt",
})

dt:AddKeybind({
	Default = "X",
	Callback = print,
	Flag = "dt_key",
})

Other:AddButton({
	Icon = 'crosshairs',
	Name = 'Reset Ragebot',
	ToolTip = 'Resets the ragebot flags to their defaults',
	Callback = function()
		Logging.new("crosshairs",'Ragebot settings reset',5)
	end,
})

local aa_enable = AntiAim:AddLabel('Enabled');
aa_enable:AddToggle({
	Default = false,
	Flag = "aa",
	Callback = print
})

aa_enable:AddOption():AddLabel('Resolvers tung tung'):AddToggle({
	Default = false,
	Callback = print
})

AntiAim:AddLabel('Pitch'):AddDropdown({
	Default = 'Down',
	Flag = "pitch",
	Values = {'Down','Center','Up','Fake Up','Fake Down'}
})

AntiAim:AddLabel('Yaw'):AddDropdown({
	Default = 'Backwards',
	Flag = "yaw",
	Values = {'Backwards','Left','Right','Forwards'}
})

AntiAim:AddLabel('Freestanding'):AddToggle({
	Default = false,
	Flag = "freestand",
	Callback = print
})

AntiAim:AddLabel('Mouse Override'):AddToggle({
	Default = false,
	Flag = "mouse_override",
	Callback = print
})

AntiAim:AddLabel('Yaw Offset'):AddTextInput({
	Default = "0",
	Placeholder = "Degrees",
	Numeric = true,
	Size = 80,
	Flag = "yaw_offset",
	Callback = print
})

LegitAssist:AddLabel('Enabled'):AddToggle({
	Default = false,
	Flag = "legit_assist",
	Callback = print
})

LegitAssist:AddLabel('Smoothing'):AddSlider({
	Min = 0,
	Max = 100,
	Default = 40,
	Type = "%",
	Size = 95,
	Flag = "legit_smooth",
	Callback = print
})

LegitAssist:AddLabel('Field of View'):AddSlider({
	Min = 0,
	Max = 360,
	Default = 60,
	Size = 100,
	Flag = "legit_fov",
	Callback = print
})

LegitAssist:AddLabel('FOV Color'):AddColorPicker({
	Default = Color3.fromRGB(255, 255, 255),
	Callback = print,
	Flag = "legit_fov_color",
})

LegitAssist:AddLabel('Aim Key'):AddKeybind({
	Default = "M2B",
	Callback = print,
	Flag = "legit_aim_key",
})

LegitTrig:AddLabel('Enabled'):AddToggle({
	Default = false,
	Flag = "legit_trigger",
	Callback = print
})

LegitTrig:AddLabel('Delay'):AddSlider({
	Min = 0,
	Max = 500,
	Default = 50,
	Size = 100,
	Flag = "legit_trigger_delay",
	Callback = print
})

LegitTrig:AddLabel('Trigger Key'):AddKeybind({
	Default = "T",
	Callback = print,
	Flag = "legit_trigger_key",
})

local MiscMaster = MiscElements:AddLabel('Master Switch')

MiscMaster:ToolTip("Combines a toggle, a color picker and a keybind\nin a single row")

MiscMaster:AddToggle({
	Default = true,
	Callback = print,
	Flag = "misc_master",
})

MiscMaster:AddColorPicker({
	Default = Color3.fromRGB(45, 130, 255),
	Callback = print,
	Flag = "misc_master_color",
})

MiscMaster:AddKeybind({
	Default = "F",
	Blacklist = {"Escape", "Backspace"},
	Callback = print,
	Flag = "misc_master_key",
})

local MiscOptions = MiscMaster:AddOption()

MiscOptions:AddLabel('Show Indicator'):AddToggle({
	Default = true,
	Callback = print,
	Flag = "misc_indicator",
})

MiscOptions:AddLabel('Indicator Color'):AddColorPicker({
	Default = Color3.fromRGB(255, 120, 60),
	Callback = print,
	Flag = "misc_indicator_color",
})

MiscOptions:AddLabel('Opacity'):AddSlider({
	Min = 0,
	Max = 100,
	Default = 80,
	Type = "%",
	Size = 90,
	Callback = print,
	Flag = "misc_opacity",
})

MiscOptions:AddLabel('Mode'):AddDropdown({
	Default = 'Normal',
	Values = {'Normal','Soft','Aggressive'},
	Callback = print,
	Flag = "misc_mode",
})

MiscOptions:AddLabel('Label'):AddTextInput({
	Default = "Custom",
	Placeholder = "Type here",
	Size = 90,
	Callback = print,
	Flag = "misc_option_text",
})

MiscOptions:AddLabel('Hold Key'):AddKeybind({
	Default = "G",
	Callback = print,
	Flag = "misc_hold_key",
})

MiscElements:AddLabel('Slider With Labels'):AddSlider({
	Min = 0,
	Max = 10,
	Default = 5,
	Rounding = 0,
	Nums = {
		[0] = 'Off',
		[10] = 'Max',
	},
	Size = 110,
	Callback = print,
	Flag = "misc_slider_labels",
})

MiscElements:AddLabel('Decimal Slider'):AddSlider({
	Min = 0,
	Max = 5,
	Default = 1.5,
	Rounding = 2,
	Type = "s",
	Size = 110,
	Callback = print,
	Flag = "misc_slider_decimal",
})

MiscElements:AddLabel('Single Select'):AddDropdown({
	Default = 'Option A',
	Values = {'Option A','Option B','Option C','Option D'},
	Callback = print,
	Flag = "misc_single",
})

MiscElements:AddLabel('Multi Select'):AddDropdown({
	Default = {'One','Three'},
	Multi = true,
	Values = {'One','Two','Three','Four','Five','Six'},
	Callback = print,
	Flag = "misc_multi",
})

MiscElements:AddLabel('Auto Updating List'):AddDropdown({
	Default = 'Players',
	Values = {'Players','Teams','Items'},
	AutoUpdate = true,
	Size = 110,
	Callback = print,
	Flag = "misc_auto_update",
})

local HiddenRow = MiscElements:AddLabel('Hidden Row')

HiddenRow:AddToggle({
	Default = false,
	Callback = print,
	Flag = "misc_hidden_toggle",
})

MiscElements:AddLabel('Show Hidden Row'):AddToggle({
	Default = true,
	Callback = function(v)
		HiddenRow:SetVisible(v)
	end,
	Flag = "misc_hidden_visible",
})

local RenamedRow = MiscElements:AddLabel('Click To Rename')

MiscElements:AddLabel('Rename Row'):AddToggle({
	Default = false,
	Callback = function(v)
		RenamedRow:SetText(v and 'Renamed Row' or 'Click To Rename')
	end,
	Flag = "misc_rename",
})

MiscInputs:AddLabel('Player Name'):AddTextInput({
	Default = "",
	Placeholder = "Enter name",
	Size = 100,
	Callback = print,
	Flag = "misc_name",
})

MiscInputs:AddLabel('Walk Speed'):AddTextInput({
	Default = "16",
	Placeholder = "Number",
	Numeric = true,
	Size = 70,
	Callback = print,
	Flag = "misc_walkspeed",
})

MiscInputs:AddLabel('Jump Power'):AddTextInput({
	Default = "50",
	Placeholder = "Number",
	Numeric = true,
	Size = 70,
	Callback = print,
	Flag = "misc_jumppower",
})

MiscInputs:AddLabel('Menu Key'):AddKeybind({
	Default = "Insert",
	Blacklist = {"Escape"},
	Callback = print,
	Flag = "misc_menu_key",
})

MiscInputs:AddLabel('Panic Key'):AddKeybind({
	Default = "End",
	Callback = function(key)
		Logging.new("crop",'Panic key set to '..tostring(key),5)
	end,
	Flag = "misc_panic_key",
})

local Custom = MiscInputs:AddCustomFrame(60)

local CustomLabel = Instance.new("TextLabel")
CustomLabel.BackgroundTransparency = 1
CustomLabel.Size = UDim2.new(1, -20, 1, 0)
CustomLabel.Position = UDim2.fromOffset(10, 0)
CustomLabel.ZIndex = Custom.Root.ZIndex + 1
CustomLabel.Font = Enum.Font.GothamMedium
CustomLabel.Text = "Custom frame\nPlace any Roblox instance here"
CustomLabel.TextColor3 = Color3.fromRGB(150, 190, 255)
CustomLabel.TextSize = 12
CustomLabel.TextWrapped = true
CustomLabel.Parent = Custom.Root

MiscActions:AddButton({
	Icon = 'crosshairs',
	Name = 'Send Notification',
	ToolTip = 'Shows a test notification',
	Callback = function()
		Notification.new({
			Title = "Neverlose",
			Content = "Button pressed",
			Duration = 4,
		})
	end,
})

MiscActions:AddButton({
	Icon = 'crosshairs-slash',
	Name = 'Send Log Entry',
	Callback = function()
		Logging.new("crosshairs",'Hit thatguy in the head for 100 damage',8)
	end,
})

MiscActions:AddButton({
	Icon = 'cube-vertexes',
	Name = 'Toggle Interface',
	Callback = function()
		window:ToggleInterface()
	end,
})

MiscActions:AddButton({
	Icon = 'discord',
	Name = 'Unload Script',
	ToolTip = 'Destroys the interface and disconnects every signal',
	Callback = function()
		NeverLose:Unload()
	end,
})

window.UserSettings:AddLabel('Menu Scale'):AddDropdown({
	Default = "Default",
	Values = {"Default",'Large','Mobile','Small'},
	Callback = function(v)
		window:SetSize(NeverLose.Scales[v]);

		Logging.new("crop",'Changed ui size to '..tostring(v),5)
	end,
})

window.UserSettings:AddLabel('3D Menu'):AddToggle({
	Default = false,
	Callback = function(v)
		window:Set3DRender(v);
	end,
})

window.UserSettings:AddLabel('Menu Key'):AddKeybind({
	Default = "Insert",
	Callback = print,
	Flag = "settings_menu_key",
})

window.UserSettings:AddLabel('Display Name'):AddTextInput({
	Default = "Player",
	Placeholder = "Name",
	Size = 100,
	Callback = function(v)
		window:SetAccount({
			Username = v,
			Expires = "Never"
		})
	end,
	Flag = "settings_display_name",
})

window.UserSettings:AddButton({
	Icon = 'discord',
	Name = 'Discord',
	Callback = function()
		print('invite')

		Logging.new("discord",'Copied discord invite link',5)
	end,
})

Notification.new({
	Title = "Notification",
	Content = "This is Neverlose Notification",
	Duration = 5,
})

task.wait(1)
Notification.new({
	Title = "Neverlose",
	Content = "Initialization in progress",
	Duration = 7,
})

Logging.new("crosshairs",'Hit thatguy in the neck for 100 damage',15)
task.wait(2)
Logging.new("crosshairs-slash",'Missed shot due to prediction error & YOUR NN',15)

HC:SetRender(true);

while true do task.wait(3)
	Watermark:SetRender(true);

	HC:SetColor('Red')
	HC:SetText("FL")
	task.wait(3);
	Watermark:SetRender(false);
	HC:SetColor('Green');
	HC:SetText("AUTO")
	task.wait(3)
	Watermark:SetRender(true);
	HC:SetColor('White')
	HC:SetText("HC")
	task.wait(1)
	Watermark:SetRender(false);
	HC:SetRender(false);
	task.wait(1)
	HC:SetRender(true);
end
