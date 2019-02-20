
local widget = require( "widget" )
local physics = require( "physics" )

local Fs={}
physics.start( )
local function payRespect( event )
     
    if ( "ended" == event.phase ) then
    local newF = display.newImageRect( "F_OFF.png", 25, 25 )
    newF.x = math.random(25, display.contentWidth)
    newF.rotation = math.random(-30,30)
    physics.addBody( newF, {halfHeight = 12.5, halfWidth = 12.5} )
    window:insert(1,newF)
    end
end

display.setDefault("background",1,0.5,0)
local F_button = widget.newButton(
    {   
        x = 0,
        y = 0,
        onEvent = payRespect,
        emboss = false,
        defaultFile = "F_OFF.png",
        overFile = "F_ON.png"
    }
)
h = display.newGroup()
f = display.newGroup()
f.x, f.y = display.contentCenterX, display.contentCenterY


local headerback = display.newRoundedRect(h, 0, 0, 200, 30, 10); headerback:setFillColor(0,0.7)
local header = display.newText(h,'Press "F" to pay respect', 0, 0,"ERASFONT", 15)
local underline = display.newRoundedRect(h, 0, 0, 190, 3, 0)

f:insert(h)

local shadow = display.newRoundedRect(f,0,0,110,110, 10):setFillColor(0,0.7)
f:insert(F_button)

header.y = -11
h.y = -70

headerback.y = -8

window = display.newGroup()

window:insert(1,f)
window.x = 0
window.y = 0

bot = display.newLine( -2,display.contentHeight+2, display.contentWidth+2,display.contentHeight+2 ) 
bot.x = display.contentCenterX
physics.addBody( bot, "static")
left = display.newLine( -2,-2, -2,display.contentHeight+2 )
left.y = display.contentCenterY
physics.addBody( left, "static")
right = display.newLine( display.contentWidth+2,-1, display.contentWidth+2,display.contentHeight+2 )
right.y = display.contentCenterY
physics.addBody( right, "static")
top = display.newLine( -2,-100, display.contentWidth+2,-100 ) 
top.x = display.contentCenterX
physics.addBody( top, "static")