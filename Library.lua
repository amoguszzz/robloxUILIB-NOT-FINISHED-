local library = {}	

function library:New(TituloString)
	local ScreenGui = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local Titulo = Instance.new("TextLabel")
	local Juego = Instance.new("TextLabel")
	local TabsHolder = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local Container2 = Instance.new("Frame")
	local Containers = Instance.new("Folder")
	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = ScreenGui
	Main.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
	Main.BorderColor3 = Color3.fromRGB(89, 80, 140)
	Main.BorderSizePixel = 2
	Main.Position = UDim2.new(0.178433895, 0, 0.0535714291, 0)
	Main.Size = UDim2.new(0, 500, 0, 500)
	
	task.spawn(function() --make draggable
		local UserInputService = game:GetService("UserInputService")
		local gui = Main
		local dragging
		local dragInput
		local dragStart
		local startPos
		local function update(input)
			local delta = input.Position - dragStart
			gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
		gui.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = gui.Position

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
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				update(input)
			end
		end)
	end)
	
	Titulo.Name = "Titulo"
	Titulo.Parent = Main
	Titulo.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
	Titulo.BorderColor3 = Color3.fromRGB(89, 80, 140)
	Titulo.BorderSizePixel = 0
	Titulo.Size = UDim2.new(0, 100, 0, 30)
	Titulo.Font = Enum.Font.SourceSans
	Titulo.Text = TituloString
	Titulo.TextColor3 = Color3.fromRGB(255, 255, 255)
	Titulo.TextScaled = true
	Titulo.TextSize = 14.000
	Titulo.TextWrapped = true

	Juego.Name = "Juego"
	Juego.Parent = Main
	Juego.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
	Juego.BorderColor3 = Color3.fromRGB(255, 255, 255)
	Juego.BorderSizePixel = 0
	Juego.Position = UDim2.new(0.200000003, 0, 0, 0)
	Juego.Size = UDim2.new(0, 400, 0, 30)
	Juego.Font = Enum.Font.SourceSans
	Juego.Text = "Game_Name"
	Juego.TextColor3 = Color3.fromRGB(255, 255, 255)
	Juego.TextScaled = true
	Juego.TextSize = 14.000
	Juego.TextWrapped = true

	TabsHolder.Name = "TabsHolder"
	TabsHolder.Parent = Main
	TabsHolder.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TabsHolder.BorderColor3 = Color3.fromRGB(89, 80, 140)
	TabsHolder.BorderSizePixel = 2
	TabsHolder.Position = UDim2.new(0, 0, 0.0599999987, 0)
	TabsHolder.Size = UDim2.new(0, 100, 0, 470)

	UIListLayout.Parent = TabsHolder
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	Container2.Name = "Container2"
	Container2.Parent = Main
	Container2.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	Container2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Container2.BorderSizePixel = 2
	Container2.Position = UDim2.new(0.217999995, 0, 0.0759999976, 0)
	Container2.Size = UDim2.new(0, 383, 0, 456)

	Containers.Name = "Containers"
	Containers.Parent = Container2

	
	local amogus = {}
	
	
	function amogus:CreateTab(name) 
		local TextButton = Instance.new("TextButton")
		local Container2_2 = Instance.new("Frame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		
		TextButton.Parent = TabsHolder
		TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		TextButton.BorderColor3 = Color3.fromRGB(159, 143, 249)
		TextButton.BorderSizePixel = 2
		TextButton.Size = UDim2.new(0, 100, 0, 30)
		TextButton.Font = Enum.Font.SourceSans
		TextButton.Text = name
		TextButton.TextColor3 = Color3.fromRGB(244, 244, 244)
		TextButton.TextScaled = true
		TextButton.TextSize = 14.000
		TextButton.TextWrapped = true
		TextButton.BorderMode = Enum.BorderMode.Inset
		
		Container2_2.Name = name.." Container"
		Container2_2.Parent = Containers
		Container2_2.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		Container2_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Container2_2.Position = UDim2.new(0, 1, 0, 1)
		Container2_2.Size = UDim2.new(0, 383, 0, 456)
		
		UIListLayout_2.Parent = Container2_2
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0.00999999978, 0)
		
		TextButton.MouseButton1Up:Connect(function()
			for i,v in next, Containers:GetChildren() do
				v.Visible = false
			end
			Container2_2.Visible = true
		end)
		
		local proLib = {}
		local focusing = false
		
		function proLib:CreateButton(Text, callback)
			local callback = callback or function() end

			local TextButton = Instance.new("TextButton")
			TextButton.Parent = Container2_2
			TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			TextButton.BorderColor3 = Color3.fromRGB(159, 143, 249)
			TextButton.Position = UDim2.new(0.0339425579, 0, 0.0263157897, 0)
			TextButton.Size = UDim2.new(0, 358, 0, 19)
			TextButton.Visible = true
			TextButton.Font = Enum.Font.SourceSans
			TextButton.Text = Text
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextScaled = true
			TextButton.TextSize = 14.000
			TextButton.TextWrapped = true

			TextButton.MouseButton1Up:Connect(function()
				pcall(callback)
			end)
		end
		function proLib:CreateToggle(text, callback)
			local options = {}
			local toggled = false

			text = text or "New toggle"
			callback = callback or function() end

			local TextButton_2 = Instance.new("TextButton")
			local TextLabel = Instance.new("TextLabel")
			TextButton_2.Parent = Container2_2
			TextButton_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			TextButton_2.BorderColor3 = Color3.fromRGB(159, 143, 249)
			TextButton_2.Position = UDim2.new(0.0339425579, 0, 0.0986842066, 0)
			TextButton_2.Size = UDim2.new(0, 358, 0, 19)
			TextButton_2.Font = Enum.Font.SourceSans
			TextButton_2.Text = text
			TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton_2.TextScaled = true
			TextButton_2.TextSize = 14.000
			TextButton_2.TextWrapped = true

			TextLabel.Parent = TextButton_2
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.921787739, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 28, 0, 19)
			TextLabel.Font = Enum.Font.SourceSans
			TextLabel.Text = ""
			TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.TextSize = 14.000
			local function fire()
				toggled = not toggled
				pcall(callback, toggled)
				if toggled then
					TextLabel.BackgroundColor3 = Color3.fromRGB(55, 255, 0)
				else
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
				end
			end
			TextButton_2.MouseButton1Up:Connect(fire)
		end
		function proLib:CreateSlider(text, minValue, maxValue, callback)
			text = text or "slida"
			minValue = minValue or 0
			maxValue = maxValue or 100

			callback = callback or function() end

			local mouse = game.Players.LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")
			local Value = nil


			local TextButton_3 = Instance.new("TextButton")
			local Frame = Instance.new("Frame")
			local ValueDisplay = Instance.new("TextLabel")
			local ActionText = Instance.new("TextLabel")
			TextButton_3.Parent = Container2_2
			TextButton_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			TextButton_3.BorderColor3 = Color3.fromRGB(159, 143, 249)
			TextButton_3.Position = UDim2.new(0.0313315913, 0, 0.199561402, 0)
			TextButton_3.Size = UDim2.new(0, 358, 0, 19)
			TextButton_3.ZIndex = 2
			TextButton_3.Font = Enum.Font.SourceSans
			TextButton_3.Text = ""
			TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton_3.TextScaled = true
			TextButton_3.TextSize = 14.000
			TextButton_3.TextWrapped = true

			Frame.Parent = TextButton_3
			Frame.BackgroundColor3 = Color3.fromRGB(181, 97, 255)
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, 0, 1, 0)

			ValueDisplay.Name = "ValueDisplay"
			ValueDisplay.Parent = TextButton_3
			ValueDisplay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ValueDisplay.BackgroundTransparency = 1.000
			ValueDisplay.Position = UDim2.new(0.812849164, 0, 0, 0)
			ValueDisplay.Size = UDim2.new(0, 67, 0, 19)
			ValueDisplay.Font = Enum.Font.SourceSans
			ValueDisplay.Text = "unknown"
			ValueDisplay.TextColor3 = Color3.fromRGB(253, 253, 251)
			ValueDisplay.TextScaled = true
			ValueDisplay.TextSize = 14.000
			ValueDisplay.TextWrapped = true

			ActionText.Name = "ActionText"
			ActionText.Parent = TextButton_3
			ActionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ActionText.BackgroundTransparency = 1.000
			ActionText.Position = UDim2.new(0.402793288, 0, 0, 0)
			ActionText.Size = UDim2.new(0, 67, 0, 19)
			ActionText.Font = Enum.Font.SourceSans
			ActionText.Text = text
			ActionText.TextColor3 = Color3.fromRGB(253, 253, 251)
			ActionText.TextScaled = true
			ActionText.TextSize = 14.000
			ActionText.TextWrapped = true

			TextButton_3.MouseButton1Down:Connect(function()
				Value = math.floor((((tonumber(maxValue) - tonumber(minValue)) / 318) * Frame.AbsoluteSize.X) + tonumber(minValue)) or 0
				pcall(function()
					callback(Value)
				end)
				Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 318), 0, 16)
				local moveconnection
				moveconnection = mouse.Move:Connect(function()
					ValueDisplay.Text = Value
					Value = math.floor((((tonumber(maxValue) - tonumber(minValue)) / 318) * Frame.AbsoluteSize.X) + tonumber(minValue))
					pcall(function()
						ValueDisplay.Text = Value.."/"..maxValue
						callback(Value)
					end)
					Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 318), 0, 16)
				end)
				local releaseconnection
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(maxValue) - tonumber(minValue)) / 318) * Frame.AbsoluteSize.X) + tonumber(minValue))
						pcall(function()
							ValueDisplay.Text = Value.."/"..maxValue
							callback(Value)
						end)
						Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 318), 0, 16)
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)
		end
		function proLib:Separador(texto)
			local Separador = Instance.new("TextLabel")
			Separador.Name = "Separador"
			Separador.Parent = Container2_2
			Separador.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			Separador.BorderColor3 = Color3.fromRGB(159, 143, 249)
			Separador.BorderSizePixel = 0
			Separador.Position = UDim2.new(0.0326370746, 0, 0.154999986, 0)
			Separador.Size = UDim2.new(0, 358, 0, 25)
			Separador.Font = Enum.Font.SourceSans
			Separador.Text = texto
			Separador.TextColor3 = Color3.fromRGB(255, 255, 255)
			Separador.TextScaled = true
			Separador.TextSize = 14.000
			Separador.TextWrapped = true
		end
		function proLib:CreateColorPicker(colText, defcolor, callback)
			colText = colText or "ColorPicker"
			callback = callback or function() end
			defcolor = defcolor or Color3.fromRGB(1,1,1)
			local h, s, v = Color3.toHSV(defcolor)
			local ms = game.Players.LocalPlayer:GetMouse()
			local colorOpened = false
			local colorElement = Instance.new("TextButton")
			local UICorner = Instance.new("UICorner")
			local colorHeader = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local touch = Instance.new("ImageLabel")
			local togName = Instance.new("TextLabel")
			local colorCurrent = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local UIListLayout = Instance.new("UIListLayout")
			local colorInners = Instance.new("Frame")
			local UICorner_4 = Instance.new("UICorner")
			local rgb = Instance.new("ImageButton")
			local UICorner_5 = Instance.new("UICorner")
			local rbgcircle = Instance.new("ImageLabel")
			local darkness = Instance.new("ImageButton")
			local UICorner_6 = Instance.new("UICorner")
			local darkcircle = Instance.new("ImageLabel")
			local toggleDisabled = Instance.new("ImageLabel")
			local toggleEnabled = Instance.new("ImageLabel")
			local onrainbow = Instance.new("TextButton")
			local togName_2 = Instance.new("TextLabel")

			--Properties:
			local Sample = Instance.new("ImageLabel")
			Sample.Name = "Sample"
			Sample.Parent = colorHeader
			Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Sample.BackgroundTransparency = 1.000
			Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
			Sample.ImageColor3 = Color3.fromRGB(96, 43, 103)
			Sample.ImageTransparency = 1

			local btn = colorHeader
			local sample = Sample

			colorElement.Name = "colorElement"
			colorElement.Parent = Container2_2
			colorElement.BackgroundColor3 = Color3.fromRGB(96, 43, 103)
			colorElement.BackgroundTransparency = 1.000
			colorElement.ClipsDescendants = true
			colorElement.Position = UDim2.new(0, 0, 0.566834569, 0)
			colorElement.Size = UDim2.new(0, 352, 0, 33)
			colorElement.AutoButtonColor = false
			colorElement.Font = Enum.Font.SourceSans
			colorElement.Text = ""
			colorElement.TextColor3 = Color3.fromRGB(0, 0, 0)
			colorElement.TextSize = 14.000
			colorElement.MouseButton1Click:Connect(function()
				if not focusing then
					if colorOpened then
						colorOpened = false
						colorElement:TweenSize(UDim2.new(0, 352, 0, 33), "InOut", "Linear", 0.08)
						wait(0.1)
						local c = sample:Clone()
						c.Parent = btn
						local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
						c.Position = UDim2.new(0, x, 0, y)
						local len, size = 0.35, nil
						if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
							size = (btn.AbsoluteSize.X * 1.5)
						else
							size = (btn.AbsoluteSize.Y * 1.5)
						end
						c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
						for i = 1, 10 do
							c.ImageTransparency = c.ImageTransparency + 0
							wait(len / 12)
						end
						c:Destroy()
					else
						colorOpened = true
						colorElement:TweenSize(UDim2.new(0, 352, 0, 141), "InOut", "Linear", 0.08, true)
						wait(0.1)
						local c = sample:Clone()
						c.Parent = btn
						local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
						c.Position = UDim2.new(0, x, 0, y)
						local len, size = 0.35, nil
						if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
							size = (btn.AbsoluteSize.X * 1.5)
						else
							size = (btn.AbsoluteSize.Y * 1.5)
						end
						c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
						for i = 1, 10 do
							c.ImageTransparency = c.ImageTransparency + 0
							wait(len / 12)
						end
						c:Destroy()
					end
				end
			end)

			colorHeader.Name = "colorHeader"
			colorHeader.Parent = colorElement
			colorHeader.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			colorHeader.Size = UDim2.new(0, 352, 0, 33)
			colorHeader.ClipsDescendants = true
			colorHeader.BorderSizePixel = 1
			colorHeader.BorderColor3 = Color3.fromRGB(159, 143, 249)
			colorHeader.BorderMode = Enum.BorderMode.Inset

			touch.Name = "touch"
			touch.Parent = colorHeader
			touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			touch.BackgroundTransparency = 1.000
			touch.BorderColor3 = Color3.fromRGB(27, 42, 53)
			touch.Position = UDim2.new(0.0199999996, 0, 0.180000007, 0)
			touch.Size = UDim2.new(0, 21, 0, 21)
			touch.Image = "rbxassetid://3926305904"
			touch.ImageColor3 = Color3.fromRGB(96, 43, 103)
			touch.ImageRectOffset = Vector2.new(44, 964)
			touch.ImageRectSize = Vector2.new(36, 36)
			touch.ImageTransparency = 1

			togName.Name = "togName"
			togName.Parent = colorHeader
			togName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			togName.BackgroundTransparency = 1.000
			togName.Position = UDim2.new(0.096704483, 0, 0.272727281, 0)
			togName.Size = UDim2.new(0, 288, 0, 14)
			togName.Font = Enum.Font.GothamSemibold
			togName.Text = colText
			togName.TextColor3 = Color3.fromRGB(255, 255, 255)
			togName.TextSize = 14.000
			togName.RichText = true
			togName.TextXAlignment = Enum.TextXAlignment.Left
			

			colorCurrent.Name = "colorCurrent"
			colorCurrent.Parent = colorHeader
			colorCurrent.BackgroundColor3 = defcolor
			colorCurrent.Position = UDim2.new(0.792613626, 0, 0.212121218, 0)
			colorCurrent.Size = UDim2.new(0, 42, 0, 18)


			UIListLayout.Parent = colorElement
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 3)

			colorInners.Name = "colorInners"
			colorInners.Parent = colorElement
			colorInners.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			colorInners.Position = UDim2.new(0, 0, 0.255319148, 0)
			colorInners.Size = UDim2.new(0, 352, 0, 105)
			colorInners.BorderSizePixel = 1
			colorInners.BorderColor3 = Color3.fromRGB(159, 143, 249)

			rgb.Name = "rgb"
			rgb.Parent = colorInners
			rgb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			rgb.BackgroundTransparency = 1.000
			rgb.Position = UDim2.new(0.0198863633, 0, 0.0476190485, 0)
			rgb.Size = UDim2.new(0, 211, 0, 93)
			rgb.Image = "http://www.roblox.com/asset/?id=6523286724"


			rbgcircle.Name = "rbgcircle"
			rbgcircle.Parent = rgb
			rbgcircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			rbgcircle.BackgroundTransparency = 1.000
			rbgcircle.Size = UDim2.new(0, 14, 0, 14)
			rbgcircle.Image = "rbxassetid://3926309567"
			rbgcircle.ImageColor3 = Color3.fromRGB(0, 0, 0)
			rbgcircle.ImageRectOffset = Vector2.new(628, 420)
			rbgcircle.ImageRectSize = Vector2.new(48, 48)

			darkness.Name = "darkness"
			darkness.Parent = colorInners
			darkness.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			darkness.BackgroundTransparency = 1.000
			darkness.Position = UDim2.new(0.636363626, 0, 0.0476190485, 0)
			darkness.Size = UDim2.new(0, 18, 0, 93)
			darkness.Image = "http://www.roblox.com/asset/?id=6523291212"


			darkcircle.Name = "darkcircle"
			darkcircle.Parent = darkness
			darkcircle.AnchorPoint = Vector2.new(0.5, 0)
			darkcircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			darkcircle.BackgroundTransparency = 1.000
			darkcircle.Size = UDim2.new(0, 14, 0, 14)
			darkcircle.Image = "rbxassetid://3926309567"
			darkcircle.ImageColor3 = Color3.fromRGB(0, 0, 0)
			darkcircle.ImageRectOffset = Vector2.new(628, 420)
			darkcircle.ImageRectSize = Vector2.new(48, 48)

			toggleDisabled.Name = "toggleDisabled"
			toggleDisabled.Parent = colorInners
			toggleDisabled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggleDisabled.BackgroundTransparency = 1.000
			toggleDisabled.Position = UDim2.new(0.7049999833106995, 0, 0.5, 0)
			toggleDisabled.Size = UDim2.new(0, 21, 0, 21)
			toggleDisabled.Image = "rbxassetid://3926309567"
			toggleDisabled.ImageColor3 = Color3.fromRGB(130, 4, 6)
			toggleDisabled.ImageRectOffset = Vector2.new(628, 420)
			toggleDisabled.ImageRectSize = Vector2.new(48, 48)

			toggleEnabled.Name = "toggleEnabled"
			toggleEnabled.Parent = colorInners
			toggleEnabled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggleEnabled.BackgroundTransparency = 1.000
			toggleEnabled.Position = UDim2.new(0.7049999833106995, 0, 0.5, 0)
			toggleEnabled.Size = UDim2.new(0, 21, 0, 21)
			toggleEnabled.Image = "rbxassetid://3926309567"
			toggleEnabled.ImageColor3 = Color3.fromRGB(29, 103, 32)
			toggleEnabled.ImageRectOffset = Vector2.new(784, 420)
			toggleEnabled.ImageRectSize = Vector2.new(48, 48)
			toggleEnabled.ImageTransparency = 1.000

			onrainbow.Name = "onrainbow"
			onrainbow.Parent = toggleEnabled
			onrainbow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			onrainbow.BackgroundTransparency = 1.000
			onrainbow.Position = UDim2.new(2.90643607e-06, 0, 0, 0)
			onrainbow.Size = UDim2.new(1, 0, 1, 0)
			onrainbow.Font = Enum.Font.SourceSans
			onrainbow.Text = ""
			onrainbow.TextColor3 = Color3.fromRGB(252, 252, 252)
			onrainbow.TextSize = 14.000

			togName_2.Name = "togName"
			togName_2.Parent = colorInners
			togName_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			togName_2.BackgroundTransparency = 1.000
			togName_2.Position = UDim2.new(0.7699999809265137, 0, 0.550000011920929, 0)
			togName_2.Size = UDim2.new(0, 278, 0, 14)
			togName_2.Font = Enum.Font.GothamSemibold
			togName_2.Text = "Rainbow"
			togName_2.TextColor3 = Color3.fromRGB(254, 254, 254)
			togName_2.TextSize = 14.000
			togName_2.TextXAlignment = Enum.TextXAlignment.Left

			local hovering = false

			colorElement.MouseEnter:Connect(function()
				if not focusing then
					hovering = true
				end 
			end)
			colorElement.MouseLeave:Connect(function()
				if not focusing then
					hovering = false
				end
			end)        

			local plr = game.Players.LocalPlayer
			local mouse = plr:GetMouse()
			local uis = game:GetService('UserInputService')
			local rs = game:GetService("RunService")
			local colorpicker = false
			local darknesss = false
			local dark = false
			local rgb = rgb    
			local dark = darkness    
			local cursor = rbgcircle
			local cursor2 = darkcircle
			local color = {1,1,1}
			local rainbow = false
			local rainbowconnection
			local counter = 0
			--
			local function zigzag(X) return math.acos(math.cos(X*math.pi))/math.pi end
			counter = 0
			local function mouseLocation()
				return plr:GetMouse()
			end
			local function cp()
				if colorpicker then
					local ml = mouseLocation()
					local x,y = ml.X - rgb.AbsolutePosition.X,ml.Y - rgb.AbsolutePosition.Y
					local maxX,maxY = rgb.AbsoluteSize.X,rgb.AbsoluteSize.Y
					if x<0 then x=0 end
					if x>maxX then x=maxX end
					if y<0 then y=0 end
					if y>maxY then y=maxY end
					x = x/maxX
					y = y/maxY
					local cx = cursor.AbsoluteSize.X/2
					local cy = cursor.AbsoluteSize.Y/2
					cursor.Position = UDim2.new(x,-cx,y,-cy)
					color = {1-x,1-y,color[3]}
					local realcolor = Color3.fromHSV(color[1],color[2],color[3])
					colorCurrent.BackgroundColor3 = realcolor
					callback(realcolor)
				end
				if darknesss then
					local ml = mouseLocation()
					local y = ml.Y - dark.AbsolutePosition.Y
					local maxY = dark.AbsoluteSize.Y
					if y<0 then y=0 end
					if y>maxY then y=maxY end
					y = y/maxY
					local cy = cursor2.AbsoluteSize.Y/2
					cursor2.Position = UDim2.new(0.5,0,y,-cy)
					cursor2.ImageColor3 = Color3.fromHSV(0,0,y)
					color = {color[1],color[2],1-y}
					local realcolor = Color3.fromHSV(color[1],color[2],color[3])
					colorCurrent.BackgroundColor3 = realcolor
					callback(realcolor)
				end
			end

			local function setcolor(tbl)
				local cx = cursor.AbsoluteSize.X/2
				local cy = cursor.AbsoluteSize.Y/2
				color = {tbl[1],tbl[2],tbl[3]}
				cursor.Position = UDim2.new(color[1],-cx,color[2]-1,-cy)
				cursor2.Position = UDim2.new(0.5,0,color[3]-1,-cy)
				local realcolor = Color3.fromHSV(color[1],color[2],color[3])
				colorCurrent.BackgroundColor3 = realcolor
			end
			local function setrgbcolor(tbl)
				local cx = cursor.AbsoluteSize.X/2
				local cy = cursor.AbsoluteSize.Y/2
				color = {tbl[1],tbl[2],color[3]}
				cursor.Position = UDim2.new(color[1],-cx,color[2]-1,-cy)
				local realcolor = Color3.fromHSV(color[1],color[2],color[3])
				colorCurrent.BackgroundColor3 = realcolor
				callback(realcolor)
			end
			local function togglerainbow()
				if rainbow then
					game.TweenService:Create(toggleEnabled, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
						ImageTransparency = 1
					}):Play()
					rainbow = false
					rainbowconnection:Disconnect()
				else
					game.TweenService:Create(toggleEnabled, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
						ImageTransparency = 0
					}):Play()
					rainbow = true
					rainbowconnection = rs.RenderStepped:Connect(function()
						setrgbcolor({zigzag(counter),1,1})
						counter = counter + 0.01
					end)
				end
			end

			onrainbow.MouseButton1Click:Connect(togglerainbow)
			--
			mouse.Move:connect(cp)
			rgb.MouseButton1Down:connect(function()colorpicker=true end)
			dark.MouseButton1Down:connect(function()darknesss=true end)
			uis.InputEnded:Connect(function(input)
				if input.UserInputType.Name == 'MouseButton1' then
					if darknesss then darknesss = false end
					if colorpicker then colorpicker = false end
				end
			end)
			setcolor({h,s,v})
		end
		return proLib
	end
	return amogus
end	

return library
