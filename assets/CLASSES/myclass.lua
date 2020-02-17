-- *******************************************************************
xCircle = Core.class(Sprite)

function xCircle:init(radius, steps, color)
   color = color or 0xff0000
   local sin, cos, d2r = math.sin, math.cos, math.pi / 180
   local c = Shape.new()
   c:setFillStyle(Shape.SOLID, color)
   c:setLineStyle(0)
   c:beginPath()
   c:moveTo(radius * sin(0 * d2r), radius * cos(0 * d2r))
   for i = 0, 360, 360 / steps  do
     c:lineTo(radius * sin(i * d2r), radius * cos(i * d2r))
   end    
   c:endPath()
   self:addChild(c)
end
-- *******************************************************************





