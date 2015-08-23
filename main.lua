-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local physics = require "physics"

physics.start( )




local centerX = display.contentCenterX
local centerY = display.contentCenterY

local ancho = display.contentWidth
local alto = display.contentHeight

display.setStatusBar (display.HiddenStatusBar)


local bkg = display.newImage( "background.png", centerX, centerY )
bkg:scale( display.contentWidth/bkg.contentWidth, display.contentHeight/bkg.contentHeight )
bkg.x = display.contentWidth/2
bkg.y = display.contentHeight/2

local geek = display.newImage( "superGeek.png", centerX - 150, centerY + 20 )

physics.addBody( geek, "dynamic", {density = 0.6, friction=0.2 ,bounce=0.2 })

local suelo = display.newRect( centerX, alto, ancho, 10 )

physics.addBody( suelo, "static", {density = 0.1, friction=0.6 ,bounce=0.0 } )

local paredIzq = display.newRect( 1, alto/2, 2, alto )
physics.addBody( paredIzq, "static", {density = 0.1, friction=0.6 ,bounce=0.0 } )

local paredDr = display.newRect( ancho, alto/2, 2, alto )
physics.addBody( paredDr, "static", {density = 0.1, friction=0.6 ,bounce=0.0 } )


for i=1, 4 do

   for j=1, i do
   	 
local crate = display.newImage( "crate2.png", centerX - 60 + 60 * i, centerY - 60 + 60 * j )

physics.addBody( crate, "dynamic", {density = 0.5, friction=0.1 ,bounce=0.0 } )


   	end

   	
   	local hipster = display.newImage("hipster.png", centerX - 60 + 60 * i, centerY - 30 - 5 * 62)

   	physics.addBody( hipster, "dynamic", {density = 0.1, friction=0.9 ,bounce=0.1 } )

   end




   --Movimientos SuperGeek
function geekTouched(event)

if event.phase == "began" then
	display.getCurrentStage( ):setFocus(geek)
elseif event.phase == "ended" then
geek:applyLinearImpulse( event.xStart - event.x, event.yStart - event.y )
display.getCurrentStage( ):setFocus( nil)

    end
end

geek:addEventListener( "touch", geekTouched )





