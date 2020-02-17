GameOver = Core.class(Sprite)

function GameOver:init()
	-- BG
	application:setBackgroundColor(colors_bgs[4])

	-- TITLE
	local mytitle = TextField.new(nil, "GAME OVER")
	mytitle:setAnchorPoint(0.5, 0.5)
	mytitle:setPosition(myapplicationwidth / 2, 2 * myapplicationheight / 10)
	mytitle:setScale(7)
	mytitle:setTextColor(colors_texts[3])
	self:addChild(mytitle)

	-- RESTART
	local mybtnplayupbmp = Bitmap.new(Texture.new("GFX/ui/restart_up.png"))
	local mybtnplaydownbmp = Bitmap.new(Texture.new("GFX/ui/restart_down.png"))
	local mybtnplay = Button.new(mybtnplayupbmp, mybtnplaydownbmp)
	mybtnplay:setAnchorPoint(0.5, 0.5)
	mybtnplay:setPosition(myapplicationwidth / 2, 4 * myapplicationheight / 10)
	mybtnplay:addEventListener("click", function()
		scenemanager:changeScene("game", 1, transitions[1], easing.inBack)
	end)
	self:addChild(mybtnplay)

	-- MENU
	local mybtnmenuupbmp = Bitmap.new(Texture.new("GFX/ui/menu_up.png"))
	local mybtnmenudownbmp = Bitmap.new(Texture.new("GFX/ui/menu_down.png"))
	local mybtnmenu = Button.new(mybtnmenuupbmp, mybtnmenudownbmp)
	mybtnmenu:setAnchorPoint(0.5, 0.5)
	mybtnmenu:setPosition(myapplicationwidth / 2, 7 * myapplicationheight / 10)
	mybtnmenu:addEventListener("click", function()
		scenemanager:changeScene("menu", 1, transitions[1], easing.inBack)
	end)
	self:addChild(mybtnmenu)

end
