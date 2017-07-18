-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local widget = require("widget")

local y = display.contentWidth * .075
local fontSize = display.contentWidth * .065
local lineInc = fontSize * 3.75

local X = display.contentWidth / 2
local W = display.contentWidth * 0.9

local title = display.newText("Font Listing", X, y, native.systemFontBold, fontSize*2)
title:setFillColor(1, 1, 0)

local systemFonts = native.getFontNames()

local scrollView = widget.newScrollView(
    {
        width = display.contentWidth,
        height = display.contentHeight - fontSize * 3,
        x = X,
        y = (display.contentHeight + fontSize * 3) / 2,
        hideBackground = true,
        horizontalScrollDisabled = true
    }
)

local function showFont(i, font, scrollView, fontName)
	local options = 
	{
	    text = "Abc Déf Ghì Jkl Mnñ 123 @#$ 我أناЯεγώ",     
	    x = X,
	    y = lineInc * (i - .4),
	    width = W,
	    font = font,   
	    fontSize = fontSize,
	    align = "left"
	}
	local text = display.newText(options)
	scrollView:insert(text)
	local options2 = 
	{
	    text = i..") "..fontName,     
	    x = X,
	    y = lineInc * i,
	    width = W,
	    font = native.systemFont,   
	    fontSize = fontSize * .7,
	    align = "right"
	}
	local text2 = display.newText(options2)
	text2:setFillColor(0, 1, 1)
	scrollView:insert( text2)
end


showFont(1, native.systemFont, scrollView, "native.systemFont")
showFont(2, native.systemFontBold, scrollView, "native.systemFontBold")
for i, fontName in ipairs( systemFonts ) do
	showFont(i + 2, fontName, scrollView, fontName)
end