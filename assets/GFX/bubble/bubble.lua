Bubble = Core.class(Sprite)

function Bubble:init(xradius, xsteps, xcolor)
	-- circle
	--function xCircle:init(radius, steps, color)
	local mybubble = xCircle.new(xradius, xsteps, xcolor)
	self:addChild(mybubble)

	-- fx
	local mylittlebubble = xCircle.new(xradius / 2, xsteps / 2, colors_bgs[2])
	mylittlebubble:setAlpha(0.25)
	mylittlebubble:setPosition(16, 16)
	self:addChild(mylittlebubble)
end


