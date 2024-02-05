--// Spectrum is a very simple color based module, providing all sorts of useful functions & methods wrapped into a datatype.
--// Written by IncredulousFocus

local Spectrum = {}
Spectrum.__index = Spectrum

function Interpret(Color,...)
	local toret = Color
	if typeof(Color) == "number" then
		local args = {...}
		local clr = {
			R = Color,
			B = args[1],
			G = args[2]
		}
		if (clr.R + clr.G + clr.B) <= 3 then
			toret = Color3.new(clr.R,clr.G,clr.B)
		else
			toret = Color3.fromRGB(clr.R,clr.G,clr.B)
		end
	end
	return toret
end

function Spectrum.Invert(Color,...)
	local Color = Interpret(Color,...)
	return Color3.new(1-Color.R,1-Color.G,1-Color.B)
end

function Spectrum.Grayscale(Color,...)
	local Color = Interpret(Color,...)
	local gs = (Color.R*.3)+(Color.G*.59)+(Color.B*.11)
	return Color3.new(gs,gs,gs)
end

function Spectrum.Colorize(BiasColor,BaseColor,...)
	local Grayscale = Spectrum.Grayscale(BaseColor,...).R
	return Color3.new(math.clamp(BiasColor.R*Grayscale,0,1),math.clamp(BiasColor.G*Grayscale,0,1),math.clamp(BiasColor.B*Grayscale,0,1))
end
