local lib = {}
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

function Ripple(obj)
	spawn(
		function()
			local Mouse = game.Players.LocalPlayer:GetMouse()
			local Circle = Instance.new("ImageLabel")
			Circle.Name = "Circle"
			Circle.Parent = obj
			Circle.BackgroundColor3 = Color3.fromRGB(211,211,211)
			Circle.BackgroundTransparency = 1.000
			Circle.ZIndex = 10
			Circle.Image = "rbxassetid://266543268"
			Circle.ImageColor3 = Color3.fromRGB(100, 100, 100)
			Circle.ImageTransparency = 0.6
			local NewX, NewY = Mouse.X - Circle.AbsolutePosition.X, Mouse.Y - Circle.AbsolutePosition.Y
			Circle.Position = UDim2.new(0, NewX, 0, NewY)
			local Size = 0
			if obj.AbsoluteSize.X > obj.AbsoluteSize.Y then
				Size = obj.AbsoluteSize.X * 1
			elseif obj.AbsoluteSize.X < obj.AbsoluteSize.Y then
				Size = obj.AbsoluteSize.Y * 1
			elseif obj.AbsoluteSize.X == obj.AbsoluteSize.Y then
				Size = obj.AbsoluteSize.X * 1
			end
			Circle:TweenSizeAndPosition(
				UDim2.new(0, Size, 0, Size),
				UDim2.new(0.5, -Size / 2, 0.5, -Size / 2),
				"Out",
				"Quad",
				0.2,
				false
			)
			for i = 1, 15 do
				Circle.ImageTransparency = Circle.ImageTransparency + 0.05
				wait()
			end
			Circle:Destroy()
		end
	)
end

local function MakeDraggable(topbarobject, object) 
	pcall(
		function()
			local dragging = false
			local dragInput, mousePos, framePos

			topbarobject.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = true
					mousePos = input.Position
					framePos = object.Position

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)

			topbarobject.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					dragInput = input
				end
			end)

			UserInputService.InputChanged:Connect(function(input)
				if input == dragInput and dragging then
					local delta = input.Position - mousePos
					object.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
				end
			end)
		end
	)
end

local SniffHub = Instance.new("ScreenGui")
SniffHub.Name = "SniffHub; cock and ball"
SniffHub.Parent = game.Players.LocalPlayer.PlayerGui
SniffHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

function lib:Window(gamename)
	local tabcount = 0
	local fs = false
	local MainFrame = Instance.new("Frame")
	local TopFrame = Instance.new("Frame")
	local TopFrameTitle = Instance.new("TextLabel")
	local TabHolder = Instance.new("Frame")
	local TabHolderPadding = Instance.new("UIPadding")
	local GlowMainFrame = Instance.new("ImageLabel")

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = SniffHub
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	MainFrame.BorderColor3 = Color3.fromRGB(27, 27, 27)
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 450, 0, 300)

	TopFrame.Name = "TopFrame"
	TopFrame.Parent = MainFrame
	TopFrame.BackgroundColor3 = Color3.fromRGB(81, 168, 94)
	TopFrame.BorderColor3 = Color3.fromRGB(27, 27, 27)
	TopFrame.ClipsDescendants = true
	TopFrame.Size = UDim2.new(1, 0, 0, 32)

	TopFrameTitle.Name = "TopFrameTitle"
	TopFrameTitle.Parent = TopFrame
	TopFrameTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopFrameTitle.BackgroundTransparency = 1.000
	TopFrameTitle.Position = UDim2.new(0, 7, 0, 0)
	TopFrameTitle.Size = UDim2.new(0, 0, 1, 0)
	TopFrameTitle.Font = Enum.Font.Gotham
	TopFrameTitle.Text = "sniff hub; " .. gamename
	TopFrameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	TopFrameTitle.TextSize = 14.000
	TopFrameTitle.TextXAlignment = Enum.TextXAlignment.Left

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = MainFrame
	TabHolder.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	TabHolder.BorderColor3 = Color3.fromRGB(27, 27, 27)
	TabHolder.Position = UDim2.new(0, 0, 0, 33)
	TabHolder.Size = UDim2.new(0, 37, 1, -33)

	TabHolderPadding.Name = "TabHolderPadding"
	TabHolderPadding.Parent = TabHolder
	TabHolderPadding.PaddingTop = UDim.new(0, 6)

	GlowMainFrame.Name = "GlowMainFrame"
	GlowMainFrame.Parent = MainFrame
	GlowMainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GlowMainFrame.BackgroundTransparency = 1.000
	GlowMainFrame.BorderSizePixel = 0
	GlowMainFrame.Position = UDim2.new(0, -15, 0, -15)
	GlowMainFrame.Size = UDim2.new(1, 30, 1, 30)
	GlowMainFrame.ZIndex = 0
	GlowMainFrame.Image = "rbxassetid://4996891970"
	GlowMainFrame.ImageColor3 = Color3.fromRGB(15, 15, 15)
	GlowMainFrame.ScaleType = Enum.ScaleType.Slice
	GlowMainFrame.SliceCenter = Rect.new(20, 20, 280, 280)
	MakeDraggable(TopFrame,MainFrame)

	local TabHoldSticker = Instance.new("Frame")
	local GlowTabHoldSticker = Instance.new("ImageLabel")
	local TabHoldStickerText = Instance.new("TextLabel")

	TabHoldSticker.Name = "TabHoldSticker"
	TabHoldSticker.Parent = MainFrame
	TabHoldSticker.AnchorPoint = Vector2.new(1, 0)
	TabHoldSticker.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	TabHoldSticker.BackgroundTransparency = 1.000
	TabHoldSticker.BorderSizePixel = 0
	TabHoldSticker.Position = UDim2.new(0, -10, 0, 37)
	TabHoldSticker.Size = UDim2.new(0, 35, 0, 22)

	GlowTabHoldSticker.Name = "GlowTabHoldSticker"
	GlowTabHoldSticker.Parent = TabHoldSticker
	GlowTabHoldSticker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GlowTabHoldSticker.BackgroundTransparency = 1.000
	GlowTabHoldSticker.BorderSizePixel = 0
	GlowTabHoldSticker.Position = UDim2.new(0, -15, 0, -15)
	GlowTabHoldSticker.Size = UDim2.new(1, 30, 1, 30)
	GlowTabHoldSticker.ZIndex = 0
	GlowTabHoldSticker.Image = "rbxassetid://4996891970"
	GlowTabHoldSticker.ImageColor3 = Color3.fromRGB(15, 15, 15)
	GlowTabHoldSticker.ImageTransparency = 1.000
	GlowTabHoldSticker.ScaleType = Enum.ScaleType.Slice
	GlowTabHoldSticker.SliceCenter = Rect.new(20, 20, 280, 280)

	TabHoldStickerText.Name = "TabHoldStickerText"
	TabHoldStickerText.Parent = TabHoldSticker
	TabHoldStickerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabHoldStickerText.BackgroundTransparency = 1.000
	TabHoldStickerText.Position = UDim2.new(1, -5, 0, 0)
	TabHoldStickerText.Size = UDim2.new(0, 0, 1, 0)
	TabHoldStickerText.Font = Enum.Font.Gotham
	TabHoldStickerText.Text = "Main"
	TabHoldStickerText.TextColor3 = Color3.fromRGB(255, 255, 255)
	TabHoldStickerText.TextSize = 12.000
	TabHoldStickerText.TextTransparency = 1.000
	TabHoldStickerText.TextXAlignment = Enum.TextXAlignment.Right

	local ContainerHold = Instance.new("Folder")
	ContainerHold.Name = "ContainerHold"
	ContainerHold.Parent = MainFrame
	local tabhold = {}
	function tabhold:Tab(text, ico)

		tabcount = tabcount + 1
		local pos = ((28 * tabcount) - 28)
		local TabBtn = Instance.new("ImageButton")

		TabBtn.Name = "TabBtn"
		TabBtn.Parent = TabHolder
		TabBtn.AnchorPoint = Vector2.new(0.5, 0)
		TabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabBtn.BackgroundTransparency = 1.000
		TabBtn.Position = UDim2.new(0.5, -1, 0, pos)
		TabBtn.Size = UDim2.new(0, 22, 0, 22)
		TabBtn.Image = ico
		TabBtn.ImageTransparency = 0.4


		local ContainerFrame = Instance.new("ScrollingFrame")
		local ContainerPadding = Instance.new("UIPadding")
		local ContainerLayout = Instance.new("UIListLayout")
		ContainerFrame.Name = "ContainerFrame"
		ContainerFrame.Parent = ContainerHold
		ContainerFrame.Active = true
		ContainerFrame.Visible = false
		ContainerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ContainerFrame.BackgroundTransparency = 1.000
		ContainerFrame.BorderSizePixel = 0
		ContainerFrame.Position = UDim2.new(0, 44, 0, 40)
		ContainerFrame.Size = UDim2.new(1, -45, 1, -47)
		ContainerFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		ContainerFrame.ScrollBarImageColor3 = Color3.fromRGB(123, 255, 141)
		ContainerFrame.ScrollBarThickness = 2
		ContainerFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

		ContainerPadding.Name = "ContainerPadding"
		ContainerPadding.Parent = ContainerFrame
		ContainerPadding.PaddingLeft = UDim.new(0, 1)
		ContainerPadding.PaddingTop = UDim.new(0, 1)

		ContainerLayout.Name = "ContainerLayout"
		ContainerLayout.Parent = ContainerFrame
		ContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ContainerLayout.Padding = UDim.new(0, 7)
		if fs == false then
			fs = true
			ContainerFrame.Visible = true
			TabBtn.ImageTransparency = 0
		end

		TabBtn.MouseEnter:Connect(function()
			TweenService:Create(TabHoldStickerText,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
			TweenService:Create(GlowTabHoldSticker,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
			TweenService:Create(TabHoldSticker,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
			TabHoldStickerText.Text = text
			TabHoldSticker:TweenSize(UDim2.new(0, TabHoldStickerText.TextBounds.X + 10, 0, 22), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .15, true)
			TabHoldSticker:TweenPosition(UDim2.new(0, -10, 0, 37 + pos), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
		end)

		TabBtn.MouseLeave:Connect(function()
			TweenService:Create(TabHoldStickerText,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
			TweenService:Create(GlowTabHoldSticker,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
			TweenService:Create(TabHoldSticker,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
		end)

		TabBtn.MouseButton1Click:Connect(function()
			for i,v in next, TabHolder:GetChildren() do
				if v.Name == "TabBtn" then
					TweenService:Create(v,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0.4}):Play()
				end
				TweenService:Create(TabBtn,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
			end
			for i,v in next, ContainerHold:GetChildren() do
				if v.Name == "ContainerFrame" then
					v.Visible = false
				end
				ContainerFrame.Visible = true
			end
		end)
		local containerhold = {}
		function containerhold:Section(text)
			local sectiontoggled = false
			local Section = Instance.new("Frame")
			local SectionBtn = Instance.new("TextButton")
			local SectionTitle = Instance.new("TextLabel")
			local SectionArrow = Instance.new("ImageLabel")
			local SectionItemHold = Instance.new("Frame")
			local SectionItemHoldPadding = Instance.new("UIPadding")
			local SectionItemHoldLayout = Instance.new("UIListLayout")

			Section.Name = "Section"
			Section.Parent = ContainerFrame
			Section.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			Section.BackgroundTransparency = 1.000
			Section.BorderColor3 = Color3.fromRGB(27, 27, 27)
			Section.BorderSizePixel = 0
			Section.ClipsDescendants = true
			Section.Position = UDim2.new(0, 1, 0, 0)
			Section.Size = UDim2.new(1, -9, 0, 28)

			SectionBtn.Name = "SectionBtn"
			SectionBtn.Parent = Section
			SectionBtn.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			SectionBtn.BorderColor3 = Color3.fromRGB(27, 27, 27)
			SectionBtn.Position = UDim2.new(0, 1, 0, 1)
			SectionBtn.Size = UDim2.new(1, -2, 0, 26)
			SectionBtn.AutoButtonColor = false
			SectionBtn.Font = Enum.Font.SourceSans
			SectionBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			SectionBtn.TextSize = 14.000
			SectionBtn.Text = ""

			SectionTitle.Name = "SectionTitle"
			SectionTitle.Parent = SectionBtn
			SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionTitle.BackgroundTransparency = 1.000
			SectionTitle.Position = UDim2.new(0, 5, 0, 0)
			SectionTitle.Size = UDim2.new(0, 0, 1, 0)
			SectionTitle.Font = Enum.Font.Gotham
			SectionTitle.Text = text 
			SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			SectionTitle.TextSize = 14.000
			SectionTitle.TextTransparency = 0.4
			SectionTitle.TextXAlignment = Enum.TextXAlignment.Left

			SectionArrow.Name = "SectionArrow"
			SectionArrow.Parent = SectionBtn
			SectionArrow.AnchorPoint = Vector2.new(0, 0.5)
			SectionArrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionArrow.BackgroundTransparency = 1.000
			SectionArrow.Position = UDim2.new(1, -25, 0.5, 0)
			SectionArrow.Size = UDim2.new(0, 20, 0, 20)
			SectionArrow.Image = "http://www.roblox.com/asset/?id=6034818379"

			SectionItemHold.Name = "SectionItemHold"
			SectionItemHold.Parent = Section
			SectionItemHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionItemHold.BackgroundTransparency = 12.000
			SectionItemHold.Position = UDim2.new(0, 0, 0, 33)
			SectionItemHold.Size = UDim2.new(1, 0, 0, 0)

			SectionItemHoldPadding.Name = "SectionItemHoldPadding"
			SectionItemHoldPadding.Parent = SectionItemHold
			SectionItemHoldPadding.PaddingTop = UDim.new(0, 0)

			SectionItemHoldLayout.Name = "SectionItemHoldLayout"
			SectionItemHoldLayout.Parent = SectionItemHold
			SectionItemHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
			SectionItemHoldLayout.Padding = UDim.new(0, 5)

			SectionBtn.MouseButton1Click:Connect(function()
				sectiontoggled = not sectiontoggled
				Section:TweenSize(sectiontoggled and UDim2.new(1, -7, 0, 33 + SectionItemHoldLayout.AbsoluteContentSize.Y) or UDim2.new(1, -7, 0, 28), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
				TweenService:Create(SectionArrow,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = sectiontoggled and 180 or 0}):Play()
				TweenService:Create(SectionTitle,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = sectiontoggled and 0 or 0.4}):Play()
				wait(.3)
				ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
			end)
			local sectionhold = {}
			function sectionhold:Button(text,callback)
				local Button = Instance.new("TextButton")
				local ButtonText = Instance.new("TextLabel")

				Button.Name = "Button"
				Button.Parent = SectionItemHold
				Button.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
				Button.BorderSizePixel = 0
				Button.Size = UDim2.new(1, 0, 0, 25)
				Button.AutoButtonColor = false
				Button.Font = Enum.Font.SourceSans
				Button.Text = ""
				Button.TextColor3 = Color3.fromRGB(0, 0, 0)
				Button.TextSize = 14.000
				Button.ClipsDescendants = true

				ButtonText.Name = "ButtonText"
				ButtonText.Parent = Button
				ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ButtonText.BorderSizePixel = 0
				ButtonText.Position = UDim2.new(0, 5, 0, 0)
				ButtonText.Size = UDim2.new(0, 0, 1, 0)
				ButtonText.Font = Enum.Font.Gotham
				ButtonText.Text = text
				ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
				ButtonText.TextSize = 14.000
				ButtonText.TextXAlignment = Enum.TextXAlignment.Left

				Button.MouseEnter:Connect(function()
					TweenService:Create(Button,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
				end)

				Button.MouseLeave:Connect(function()
					TweenService:Create(Button,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(36, 36, 36)}):Play()
				end)

				Button.MouseButton1Click:Connect(function()
					Ripple(Button)
					pcall(callback)
				end)
			end
			function sectionhold:Toggle(text,def,callback)
				local togglefunc = {}
				local toggled = false
				local Toggle = Instance.new("TextButton")
				local ToggleText = Instance.new("TextLabel")
				local ToggleFrame = Instance.new("Frame")
				local ToggleIco = Instance.new("ImageLabel")

				Toggle.Name = "Toggle"
				Toggle.Parent = SectionItemHold
				Toggle.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
				Toggle.BackgroundTransparency = 1.000
				Toggle.BorderSizePixel = 0
				Toggle.Size = UDim2.new(1, 0, 0, 20)
				Toggle.AutoButtonColor = false
				Toggle.Font = Enum.Font.SourceSans
				Toggle.Text = ""
				Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.TextSize = 14.000

				ToggleText.Name = "ToggleText"
				ToggleText.Parent = Toggle
				ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleText.BorderSizePixel = 0
				ToggleText.Position = UDim2.new(0, 22, 0, 0)
				ToggleText.Size = UDim2.new(0, 0, 1, 0)
				ToggleText.Font = Enum.Font.Gotham
				ToggleText.Text = text
				ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
				ToggleText.TextSize = 14.000
				ToggleText.TextXAlignment = Enum.TextXAlignment.Left

				ToggleFrame.Name = "ToggleFrame"
				ToggleFrame.Parent = Toggle
				ToggleFrame.AnchorPoint = Vector2.new(0, 0.5)
				ToggleFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
				ToggleFrame.BorderSizePixel = 0
				ToggleFrame.Position = UDim2.new(0, 0, 0.5, 0)
				ToggleFrame.Size = UDim2.new(0, 17, 1, -3)

				ToggleIco.Name = "ToggleIco"
				ToggleIco.Parent = ToggleFrame
				ToggleIco.AnchorPoint = Vector2.new(0.5, 0.5)
				ToggleIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleIco.BackgroundTransparency = 1.000
				ToggleIco.Position = UDim2.new(0.5, 0, 0.5, 0)
				ToggleIco.Size = UDim2.new(1, -5, 1, -5)
				ToggleIco.Image = "http://www.roblox.com/asset/?id=6031094667"
				ToggleIco.ImageTransparency = 1

				Toggle.MouseButton1Click:Connect(function()
					toggled = not toggled

					TweenService:Create(ToggleIco,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = toggled and 0 or 1}):Play()
					ToggleIco:TweenSize(toggled and UDim2.new(1, -2, 1, -2) or UDim2.new(1, -5, 1, -5), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)

					pcall(callback, toggled)
				end)
				function togglefunc:Change(tochange)
					toggled = tochange

					TweenService:Create(ToggleIco,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = toggled and 0 or 1}):Play()
					ToggleIco:TweenSize(toggled and UDim2.new(1, -2, 1, -2) or UDim2.new(1, -5, 1, -5), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)

					pcall(callback, toggled)
				end  
				function togglefunc:SilencedChange(tochange)
					toggled = tochange

					TweenService:Create(ToggleIco,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = toggled and 0 or 1}):Play()
					ToggleIco:TweenSize(toggled and UDim2.new(1, -2, 1, -2) or UDim2.new(1, -5, 1, -5), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
					
				end 
				return togglefunc
			end
			function sectionhold:Slider(text,min,max,start,inc,callback)
				local dragging = false
				local Slider = Instance.new("Frame")
				local SliderText = Instance.new("TextLabel")
				local Value = Instance.new("TextLabel")
				local SliderFrame = Instance.new("Frame")
				local SliderCurrentFrame = Instance.new("Frame")

				Slider.Name = "Slider"
				Slider.Parent = SectionItemHold
				Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Slider.BackgroundTransparency = 1.000
				Slider.Size = UDim2.new(1, 0, 0, 34)

				SliderText.Name = "SliderText"
				SliderText.Parent = Slider
				SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderText.BackgroundTransparency = 1.000
				SliderText.BorderSizePixel = 0
				SliderText.Size = UDim2.new(0, 1, 0, 15)
				SliderText.Font = Enum.Font.Gotham
				SliderText.Text = text
				SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderText.TextSize = 14.000
				SliderText.TextXAlignment = Enum.TextXAlignment.Left

				Value.Name = "Value"
				Value.Parent = Slider
				Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Value.BackgroundTransparency = 1.000
				Value.BorderSizePixel = 0
				Value.Position = UDim2.new(1, -1, 0, 0)
				Value.Size = UDim2.new(0, 1, 0, 15)
				Value.Font = Enum.Font.Gotham
				Value.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
				Value.TextColor3 = Color3.fromRGB(255, 255, 255)
				Value.TextSize = 14.000
				Value.TextXAlignment = Enum.TextXAlignment.Right

				SliderFrame.Name = "SliderFrame"
				SliderFrame.Parent = Slider
				SliderFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
				SliderFrame.BorderSizePixel = 0
				SliderFrame.ClipsDescendants = true
				SliderFrame.Position = UDim2.new(0, 0, 0, 20)
				SliderFrame.Size = UDim2.new(1, 0, 0, 10)

				SliderCurrentFrame.Name = "SliderCurrentFrame"
				SliderCurrentFrame.Parent = SliderFrame
				SliderCurrentFrame.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
				SliderCurrentFrame.BorderSizePixel = 0
				SliderCurrentFrame.Size = UDim2.new((start or 0) / max, 0, 1, 0)


				local function move(Input)
					local XSize = math.clamp((Input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1)
					local Increment = inc and (max / ((max - min) / (inc * 4))) or 
						(max >= 50 and max / ((max - min) / 4)) or 
						(max >= 25 and max / ((max - min) / 2)) or 
						(max / (max - min))

					local SizeRounded = UDim2.new((math.round(XSize * ((max / Increment) * 4)) / ((max / Increment) * 4)), 0, 1, 0)
					SliderCurrentFrame:TweenSize(SizeRounded, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)

					local Val = math.round((((SizeRounded.X.Scale * max) / max) * (max - min) + min) * 20) / 20
					Value.Text = tostring(Val)
					pcall(callback, Val)
				end
				SliderFrame.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
						end
					end
				)
				SliderFrame.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
						end
					end
				)
				game:GetService("UserInputService").InputChanged:Connect(
				function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end
				)

			end

			function sectionhold:Dropdown(text, list,def, callback)
				local dropfunc = {}
				local size = 0
				local itemcount = 0
				local droptoggled = false
				def = (typeof(def) == "string") and def

				if def == "" then
					def = nil
				end

				local Dropdown = Instance.new("Frame")
				local DropdownText = Instance.new("TextLabel")
				local DropdownFrame = Instance.new("Frame")
				local DropdownBtn = Instance.new("TextButton")
				local DropdownCurrent = Instance.new("TextLabel")
				local DropdownIco = Instance.new("ImageLabel")
				local GlowMainFrame = Instance.new("ImageLabel")
				local DropdownItemHolder = Instance.new("ScrollingFrame")
				local DropdownItemHolderLayout = Instance.new("UIListLayout")
				local DropdownItemHolderPadding = Instance.new("UIPadding")

				Dropdown.Name = "Dropdown"
				Dropdown.Parent = SectionItemHold
				Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.Size = UDim2.new(1, 0, 0, 39)

				DropdownText.Name = "DropdownText"
				DropdownText.Parent = Dropdown
				DropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownText.BackgroundTransparency = 1.000
				DropdownText.BorderSizePixel = 0
				DropdownText.Size = UDim2.new(0, 1, 0, 12)
				DropdownText.Font = Enum.Font.Gotham
				DropdownText.Text = text
				DropdownText.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownText.TextSize = 14.000
				DropdownText.TextXAlignment = Enum.TextXAlignment.Left

				DropdownFrame.Name = "DropdownFrame"
				DropdownFrame.Parent = Dropdown
				DropdownFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
				DropdownFrame.BorderSizePixel = 0
				DropdownFrame.ClipsDescendants = true
				DropdownFrame.Position = UDim2.new(0, 0, 0, 15)
				DropdownFrame.Size = UDim2.new(1, 0, 0, 20)

				DropdownBtn.Name = "DropdownBtn"
				DropdownBtn.Parent = DropdownFrame
				DropdownBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownBtn.BackgroundTransparency = 1.000
				DropdownBtn.BorderSizePixel = 0
				DropdownBtn.Size = UDim2.new(1, 0, 0, 20)
				DropdownBtn.Font = Enum.Font.SourceSans
				DropdownBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
				DropdownBtn.TextSize = 14.000
				DropdownBtn.Text = ""

				DropdownCurrent.Name = "DropdownCurrent"
				DropdownCurrent.Parent = DropdownBtn
				DropdownCurrent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownCurrent.BackgroundTransparency = 1.000
				DropdownCurrent.BorderSizePixel = 0
				DropdownCurrent.Position = UDim2.new(0, 5, 0, 0)
				DropdownCurrent.Size = UDim2.new(0, 1, 1, 0)
				DropdownCurrent.Font = Enum.Font.Gotham
				DropdownCurrent.Text = typeof(def) == "string" and "" .. def or "..."
				DropdownCurrent.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownCurrent.TextSize = 14.000
				DropdownCurrent.TextXAlignment = Enum.TextXAlignment.Left

				DropdownIco.Name = "DropdownIco"
				DropdownIco.Parent = DropdownBtn
				DropdownIco.AnchorPoint = Vector2.new(0, 0.5)
				DropdownIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownIco.BackgroundTransparency = 1.000
				DropdownIco.Position = UDim2.new(1, -20, 0.5, 0)
				DropdownIco.Size = UDim2.new(0, 17, 0, 17)
				DropdownIco.Image = "http://www.roblox.com/asset/?id=6035047377"

				GlowMainFrame.Name = "GlowMainFrame"
				GlowMainFrame.Parent = DropdownBtn
				GlowMainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				GlowMainFrame.BackgroundTransparency = 1.000
				GlowMainFrame.BorderSizePixel = 0
				GlowMainFrame.Position = UDim2.new(0, -15, 0, -15)
				GlowMainFrame.Size = UDim2.new(1, 30, 1, 30)
				GlowMainFrame.ZIndex = 0
				GlowMainFrame.Image = "rbxassetid://4996891970"
				GlowMainFrame.ImageColor3 = Color3.fromRGB(15, 15, 15)
				GlowMainFrame.ScaleType = Enum.ScaleType.Slice
				GlowMainFrame.SliceCenter = Rect.new(20, 20, 280, 280)

				DropdownItemHolder.Name = "DropdownItemHolder"
				DropdownItemHolder.Parent = DropdownFrame
				DropdownItemHolder.Active = true
				DropdownItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownItemHolder.BackgroundTransparency = 1.000
				DropdownItemHolder.BorderSizePixel = 0
				DropdownItemHolder.Position = UDim2.new(0, 0, 0, 20)
				DropdownItemHolder.Size = UDim2.new(1, 0, 1, -20)
				DropdownItemHolder.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
				DropdownItemHolder.ScrollBarThickness = 5
				DropdownItemHolder.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
				DropdownItemHolder.CanvasSize = UDim2.new(0,0,0,0)

				DropdownItemHolderLayout.Name = "DropdownItemHolderLayout"
				DropdownItemHolderLayout.Parent = DropdownItemHolder
				DropdownItemHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder

				DropdownItemHolderPadding.Name = "DropdownItemHolderPadding"
				DropdownItemHolderPadding.Parent = DropdownItemHolder
				DropdownItemHolderPadding.PaddingLeft = UDim.new(0, 5)

				DropdownBtn.MouseButton1Click:Connect(function()
					droptoggled = not droptoggled
					TweenService:Create(DropdownIco,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = droptoggled and 45 or 0}):Play()
					DropdownFrame.Size = droptoggled and UDim2.new(1, 0, 0, 20 + size) or UDim2.new(1, 0, 0, 20)
					Dropdown.Size = droptoggled and UDim2.new(1, 0, 0, 39 + size) or UDim2.new(1, 0, 0, 39)
					Section:TweenSize(UDim2.new(1, -7, 0, 33 + SectionItemHoldLayout.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
					wait(.3)
					ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end)

				for i,v in next, list do
					local Item = Instance.new("TextButton")

					Item.Name = "Item"
					Item.Parent = DropdownItemHolder
					Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Item.BackgroundTransparency = 1.000
					Item.Size = UDim2.new(1, 0, 0, 20)
					Item.Font = Enum.Font.Gotham
					Item.Text = v
					Item.TextColor3 = Color3.fromRGB(155, 155, 155)
					Item.TextSize = 13.000
					Item.TextXAlignment = Enum.TextXAlignment.Left

					Item.MouseButton1Click:Connect(function()
						def = v
						DropdownCurrent.Text = typeof(def) == "string" and "" .. def or "..."
						droptoggled = not droptoggled
						DropdownFrame.Size = droptoggled and UDim2.new(1, 0, 0, 20 + size) or UDim2.new(1, 0, 0, 20)
						Dropdown.Size = droptoggled and UDim2.new(1, 0, 0, 39 + size) or UDim2.new(1, 0, 0, 39)
						Section:TweenSize(UDim2.new(1, -7, 0, 33 + SectionItemHoldLayout.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
						wait(.3)
						ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
					end)

					Item.MouseButton1Click:Connect(function()
						pcall(callback, v)
					end)


					size = size + 20

					coroutine.wrap(
						function()
							while wait() do
								Item.TextColor3 = (typeof(def) == "string" and def == v) and Color3.fromRGB(215, 215, 215) or Color3.fromRGB(155, 155, 155)
							end
						end
					)()
				end
				function dropfunc:Change(tochange)
					size = 0
					DropdownCurrent.Text = "..."
					droptoggled = false

					for i,v in next, DropdownItemHolder:GetChildren() do
						if v.Name == "Item" then
							v:Destroy()
						end    
					end

					for i,v in next, tochange do
						local Item = Instance.new("TextButton")

						Item.Name = "Item"
						Item.Parent = DropdownItemHolder
						Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						Item.BackgroundTransparency = 1.000
						Item.Size = UDim2.new(1, 0, 0, 20)
						Item.Font = Enum.Font.Gotham
						Item.Text = v
						Item.TextColor3 = Color3.fromRGB(155, 155, 155)
						Item.TextSize = 13.000
						Item.TextXAlignment = Enum.TextXAlignment.Left

						Item.MouseButton1Click:Connect(function()
							def = v
							DropdownCurrent.Text = typeof(def) == "string" and "" .. def or "..."
							droptoggled = not droptoggled
							DropdownFrame.Size = droptoggled and UDim2.new(1, 0, 0, 20 + size) or UDim2.new(1, 0, 0, 20)
							Dropdown.Size = droptoggled and UDim2.new(1, 0, 0, 39 + size) or UDim2.new(1, 0, 0, 39)
							Section:TweenSize(UDim2.new(1, -7, 0, 33 + SectionItemHoldLayout.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
							wait(.3)
							ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						end)

						Item.MouseButton1Click:Connect(function()
							pcall(callback, v)
						end)


						size = size + 20

						coroutine.wrap(
							function()
								while wait() do
									Item.TextColor3 = (typeof(def) == "string" and def == v) and Color3.fromRGB(215, 215, 215) or Color3.fromRGB(155, 155, 155)
								end
							end
						)()
					end    

					TweenService:Create(DropdownIco,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = droptoggled and 45 or 0}):Play()
					DropdownFrame.Size = droptoggled and UDim2.new(1, 0, 0, 20 + size) or UDim2.new(1, 0, 0, 20)
					Dropdown.Size = droptoggled and UDim2.new(1, 0, 0, 39 + size) or UDim2.new(1, 0, 0, 39)
					Section:TweenSize(UDim2.new(1, -7, 0, 33 + SectionItemHoldLayout.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
					wait(.3)
					ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)

				end    
				return dropfunc
			end
			function sectionhold:Colorpicker(text, preset, callback)
				local cptoggled = false
				local Colorpicker = Instance.new("Frame")
				local ColorpickerBtn = Instance.new("TextButton")
				local ColorpickerTitle = Instance.new("TextLabel")
				local BoxColor = Instance.new("Frame")
				local GlowColorpicker = Instance.new("ImageLabel")
				local Color = Instance.new("ImageLabel")
				local ColorCorner = Instance.new("UICorner")
				local ColorSelection = Instance.new("ImageLabel")
				local Hue = Instance.new("ImageLabel")
				local HueCorner = Instance.new("UICorner")
				local HueGradient = Instance.new("UIGradient")
				local HueSelection = Instance.new("ImageLabel")

				Colorpicker.Name = "Colorpicker"
				Colorpicker.Parent = SectionItemHold
				Colorpicker.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
				Colorpicker.BorderSizePixel = 0
				Colorpicker.ClipsDescendants = true
				Colorpicker.Size = UDim2.new(1, 0, 0, 22)

				ColorpickerBtn.Name = "ColorpickerBtn"
				ColorpickerBtn.Parent = Colorpicker
				ColorpickerBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorpickerBtn.BackgroundTransparency = 1.000
				ColorpickerBtn.BorderSizePixel = 0
				ColorpickerBtn.Size = UDim2.new(1, 0, 0, 20)
				ColorpickerBtn.Font = Enum.Font.SourceSans
				ColorpickerBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
				ColorpickerBtn.TextSize = 14.000
				ColorpickerBtn.Text = ""

				ColorpickerTitle.Name = "ColorpickerTitle"
				ColorpickerTitle.Parent = ColorpickerBtn
				ColorpickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorpickerTitle.BackgroundTransparency = 1.000
				ColorpickerTitle.BorderSizePixel = 0
				ColorpickerTitle.Position = UDim2.new(0, 5, 0, 0)
				ColorpickerTitle.Size = UDim2.new(0, 1, 1, 0)
				ColorpickerTitle.Font = Enum.Font.Gotham
				ColorpickerTitle.Text = text
				ColorpickerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				ColorpickerTitle.TextSize = 14.000
				ColorpickerTitle.TextXAlignment = Enum.TextXAlignment.Left

				BoxColor.Name = "BoxColor"
				BoxColor.Parent = ColorpickerBtn
				BoxColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BoxColor.BorderSizePixel = 0
				BoxColor.Position = UDim2.new(1, -30, 0, 0)
				BoxColor.Size = UDim2.new(0, 30, 1, 0)

				GlowColorpicker.Name = "GlowColorpicker"
				GlowColorpicker.Parent = ColorpickerBtn
				GlowColorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				GlowColorpicker.BackgroundTransparency = 1.000
				GlowColorpicker.BorderSizePixel = 0
				GlowColorpicker.Position = UDim2.new(0, -15, 0, -15)
				GlowColorpicker.Size = UDim2.new(1, 30, 1, 30)
				GlowColorpicker.ZIndex = 0
				GlowColorpicker.Image = "rbxassetid://4996891970"
				GlowColorpicker.ImageColor3 = Color3.fromRGB(15, 15, 15)
				GlowColorpicker.ScaleType = Enum.ScaleType.Slice
				GlowColorpicker.SliceCenter = Rect.new(20, 20, 280, 280)

				Color.Name = "Color"
				Color.Parent = Colorpicker
				Color.AnchorPoint = Vector2.new(0.5, 0)
				Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
				Color.Position = UDim2.new(0.5, -27, 0, 30)
				Color.Size = UDim2.new(0, 246, 0, 80)
				Color.ZIndex = 10
				Color.Image = "rbxassetid://4155801252"

				ColorCorner.CornerRadius = UDim.new(0, 3)
				ColorCorner.Name = "ColorCorner"
				ColorCorner.Parent = Color

				ColorSelection.Name = "ColorSelection"
				ColorSelection.Parent = Color
				ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorSelection.BackgroundTransparency = 1.000
				ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
				ColorSelection.Size = UDim2.new(0, 18, 0, 18)
				ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
				ColorSelection.ScaleType = Enum.ScaleType.Fit

				Hue.Name = "Hue"
				Hue.Parent = Colorpicker
				Hue.AnchorPoint = Vector2.new(0.5, 0)
				Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Hue.Position = UDim2.new(0.5, 117, 0, 30)
				Hue.Size = UDim2.new(0, 25, 0, 80)

				HueCorner.CornerRadius = UDim.new(0, 3)
				HueCorner.Name = "HueCorner"
				HueCorner.Parent = Hue

				HueGradient.Color = ColorSequence.new {
					ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
					ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
					ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
					ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
					ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
					ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
					ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
				}			
				HueGradient.Rotation = 270
				HueGradient.Name = "HueGradient"
				HueGradient.Parent = Hue

				HueSelection.Name = "HueSelection"
				HueSelection.Parent = Hue
				HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HueSelection.BackgroundTransparency = 1.000
				HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
				HueSelection.Size = UDim2.new(0, 18, 0, 18)
				HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"

				local function UpdateColorPicker(nope)
					BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

					pcall(callback, BoxColor.BackgroundColor3)
				end

				ColorH =
					1 -
					(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
						Hue.AbsoluteSize.Y)
				ColorS =
					(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
						Color.AbsoluteSize.X)
				ColorV =
					1 -
					(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
						Color.AbsoluteSize.Y)

				BoxColor.BackgroundColor3 = preset
				Color.BackgroundColor3 = preset
				pcall(callback, BoxColor.BackgroundColor3)

				Color.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then


							if ColorInput then
								ColorInput:Disconnect()
							end

							ColorInput =
								RunService.RenderStepped:Connect(
									function()
									local ColorX =
										(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
											Color.AbsoluteSize.X)
									local ColorY =
										(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
											Color.AbsoluteSize.Y)

									ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
									ColorS = ColorX
									ColorV = 1 - ColorY

									UpdateColorPicker(true)
								end
								)
						end
					end
				)

				Color.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if ColorInput then
								ColorInput:Disconnect()
							end
						end
					end
				)

				Hue.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then


							if HueInput then
								HueInput:Disconnect()
							end

							HueInput =
								RunService.RenderStepped:Connect(
									function()
									local HueY =
										(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
											Hue.AbsoluteSize.Y)

									HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
									ColorH = 1 - HueY

									UpdateColorPicker(true)
								end
								)
						end
					end
				)

				Hue.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if HueInput then
								HueInput:Disconnect()
							end
						end
					end
				)

				ColorpickerBtn.MouseButton1Click:Connect(function()
					cptoggled = not cptoggled
					Colorpicker.Size = cptoggled and UDim2.new(1, 0, 0, 122) or UDim2.new(1, 0, 0, 22)
					Section:TweenSize(UDim2.new(1, -7, 0, 33 + SectionItemHoldLayout.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
					wait(.3)
					ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end)
			end
			function sectionhold:Label(text)
				local Label = Instance.new("TextLabel")

				Label.Name = "ToggleText"
				Label.Parent = SectionItemHold
				Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Label.BorderSizePixel = 0
				Label.BackgroundTransparency = 1
				Label.Position = UDim2.new(0, 22, 0, 0)
				Label.Size = UDim2.new(1, 0, 0, 17)
				Label.Font = Enum.Font.Gotham
				Label.Text = text
				Label.TextColor3 = Color3.fromRGB(255, 255, 255)
				Label.TextSize = 14.000
				Label.TextXAlignment = Enum.TextXAlignment.Left
			end
			function sectionhold:Textbox(text, numonly,disapper, callback)
				local Textbox = Instance.new("TextLabel")
				local TextBox = Instance.new("TextBox")

				Textbox.Name = "Textbox"
				Textbox.Parent = SectionItemHold
				Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Textbox.BackgroundTransparency = 1.000
				Textbox.BorderSizePixel = 0
				Textbox.Position = UDim2.new(0, 22, 0, 0)
				Textbox.Size = UDim2.new(1, 0, 0, 22)
				Textbox.Font = Enum.Font.Gotham
				Textbox.Text = text
				Textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
				Textbox.TextSize = 14.000
				Textbox.TextXAlignment = Enum.TextXAlignment.Left

				TextBox.Parent = Textbox
				TextBox.AnchorPoint = Vector2.new(1, 0)
				TextBox.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
				TextBox.BorderSizePixel = 0
				TextBox.Position = UDim2.new(1, 0, 0, 0)
				TextBox.Size = UDim2.new(0, 80, 1, 0)
				TextBox.Font = Enum.Font.Gotham
				TextBox.PlaceholderText = "Type Here"
				TextBox.Text = ""
				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.TextSize = 14.000

				TextBox.Changed:Connect(function(ep)
					if ep then
						if #TextBox.Text > 0 then
							pcall(callback, TextBox.Text)
						end
						TextBox:TweenSize(UDim2.new(0, TextBox.TextBounds.X + 18, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
					end
				end)

				TextBox.FocusLost:Connect(function(ep)
					if ep then
						if #TextBox.Text > 0 then
							if disapper then
								TextBox.Text = ""
							end
						end
					end
				end)

				TextBox:GetPropertyChangedSignal("Text"):Connect(function()
					if numonly == true then
						TextBox.Text = TextBox.Text:gsub("%D+", "")
					end
				end)
			end
			return sectionhold
		end
		return containerhold
	end
	return tabhold
end
return lib
