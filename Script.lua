local RedPart = script.Parent.BluePart
local BluePart = script.Parent.RedPart

local function RedFunction()
	RedPart.Transparency = 0
	wait(.01)
	RedPart.Transparency = 1
end

local function BlueFunction()
	BluePart.Transparency = 0
	wait(.01)
	BluePart.Transparency = 1	
end

while true do 
	BlueFunction()
	wait(.01)
	RedFunction()
	wait(.01)	
end

