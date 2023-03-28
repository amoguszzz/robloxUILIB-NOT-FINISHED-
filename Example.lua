local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/amoguszzz/pipowareUiLib-NOT-FINISHED-/main/Library.lua"))()
local main = library:New("test") -- new library
local tab1 = main:CreateTab("1") --tab

tab1:CreateButton("TEXT", function() --button
    print("hi")
end)
tab1:CreateToggle("HELLO MADAFAKA", function(v) --toggle
    print(v)
end)
tab1:Separador("TEXT") --separator

tab1:CreateSlider("SLIDER", 1,100, function(value) --slider
    print(value)
end)
tab1:CreateColorPicker("XD", Color3.fromRGB(255,255,255), function(v) --color picker
    main:changeColor1(v) --set UILIB accent color
end)
tab1:CreateKeyBind("KeyBind", Enum.KeyCode.F1, function() -- keybind
	main:UIToggle() --make ui lib inivislble
end)
