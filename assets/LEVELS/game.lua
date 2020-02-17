Game = Core.class(Sprite)

function Game:init()
	-- BG
	application:setBackgroundColor(colors_bgs[3])

	-- CLASS VARIABLES
	self.bubbles_list = {}
	self.myscore = 100
--	self.mysound = Sound.new("AUDIO/sfx/pop.ogg")
--	self.mychanel = self.sound:play()

	-- SCORE
	self.myscoretext = TextField.new(nil, self.myscore)
	self.myscoretext:setPosition(8, 32)
	self.myscoretext:setScale(4)
	self.myscoretext:setTextColor(colors_texts[3])
	self:addChild(self.myscoretext)
	
	-- LISTENERS
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)	

end

function Game:onTransitionInBegin()
end

function Game:onTransitionInEnd()
	-- BACK BUTTON
	local mybtnbackbmp = Bitmap.new(Texture.new("GFX/ui/x.png"))
	local mybtnback = Button.new(mybtnbackbmp, mybtnbackbmp)
	mybtnback:setAnchorPoint(0.5, 0.5)
	mybtnback:setPosition(myapplicationwidth - mybtnback:getWidth() / 2, mybtnback:getHeight() / 2)
	mybtnback:addEventListener("click", function()
		scenemanager:changeScene("menu", 1, transitions[2], easing.outBack)
	end)
	self:addChild(mybtnback)

	-- load some bubbles
	self:creatBubbles()
	
	-- the gameloop
	self:addEventListener(Event.ENTER_FRAME, self.OnEnterFrame, self)

end

function Game:onTransitionOutBegin()
end

function Game:onTransitionOutEnd()
end

-- GAME LOOP
function Game:OnEnterFrame(e)
	-- show some bubbles
	for b = #self.bubbles_list, 1, -1 do
		local tempb = self.bubbles_list[b]
		local posy = tempb:getY() - tempb.speedy
		local posx = tempb:getX() + math.random(1, 4) * math.cos(0.01 * posy) -- posy first
		tempb:setPosition(posx, posy)
		self:addChild(tempb)

		-- check y bubble position
		if tempb:getY() < 0 then
			self.myscore -= 1
			self:spawn(tempb)
		end

		-- check clicks
		if tempb.isclicked then
			self.myscore += 1
--			local mychanel = self.mysound:play()
			-- remove from bubbles_list
			table.remove(self.bubbles_list, b)
			-- remove from game scene
			self:removeChild(tempb)
			self:creatBubbles()
		end
	end

	-- update the score
	self.myscoretext:setText(self.myscore)
	
	-- game over condition
	if self.myscore <= 0 then
		-- GAME OVER SCENE
		scenemanager:changeScene("gameover", 0.5, transitions[3], easing.inCircular)
	end

end

-- FUNCTIONS
function Game:creatBubbles()
	-- create some bubbles
	local mymaxbubbles = 5
	if #self.bubbles_list < mymaxbubbles then
		for b = 1, mymaxbubbles - #self.bubbles_list do
			--function Bubble:init(xradius, xsteps, xcolor)
			local mybubble = Bubble.new(math.random(32, 96), 32, colors_bubbles[math.random(1, #colors_bubbles)])
			mybubble.isclicked = false
			mybubble:addEventListener(Event.MOUSE_DOWN, function(e)
				if mybubble:hitTestPoint(e.x, e.y) then
					self.myscore += 1
					mybubble.isclicked = true
					e:stopPropagation()
				else
					self.myscore -= 1 / #self.bubbles_list -- any better way?
				end
			end)
			self:spawn(mybubble)
			self.bubbles_list[#self.bubbles_list + 1] = mybubble
		end
	end
end

function Game:spawn(xbubble)
	xbubble:setX(math.random(0, myapplicationwidth))
	xbubble:setY(math.random(myapplicationheight, 2 * myapplicationheight))
	xbubble.speedy = math.random(1, 10)
end


