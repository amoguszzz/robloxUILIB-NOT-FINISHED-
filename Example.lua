local main = library:New("test") -- new library
local tab1 = main:CreateTab("1") --tab

tab1:CreateButton("TEXT", function() --button
    print("hi")
end)
tab1:CreateToggle("HELLO MADAFAKA", function(v)
    print(v)
end)
tab1:Separador("TEXT") --separator

tab1:CreateSlider("SLIDER", 1,100, function(value) --slider
    print(value)
end)
tab1:CreateColorPicker("XD", Color3.fromRGB(255,255,255), function(v) --color picker
    print(v)
end)
