Menu = Core.class(Sprite)

function Menu:init()
	-- BG
	application:setBackgroundColor(colors_bgs[3])

	-- ads
   self.ADMOB_APP_ID = "ca-app-pub-3940256099942544~3347511713" -- google test id
   self.ADMOB_UNIT_ID = "ca-app-pub-3940256099942544/6300978111" -- google test id

   -- admob (setup for simple banner adverts), note: only visible on phone/tablet
   if application:getDeviceInfo() == "Android" then
      require 'ads' --create real object for on device
      self.ADMOB = Ads.new('admob')
      self.ADMOB:setKey(self.ADMOB_APP_ID)
      self.ADMOB:addEventListener(Event.AD_RECEIVED, function() -- show ad
         self.ADMOB:showAd('banner')
         self.ADMOB:setAlignment('center', 'bottom')
--         self.ADMOB:setAlignment('center', 'top')
      end)
      self.ADMOB:addEventListener(Event.AD_FAILED, function(e) end)
      self.ADMOB:addEventListener(Event.AD_ACTION_BEGIN, function() end)
      self.ADMOB:addEventListener(Event.AD_ACTION_END, function() end)
      self.ADMOB:addEventListener(Event.AD_DISMISSED, function() end)
	  
	self.ADMOB:loadAd("banner", self.ADMOB_UNIT_ID)

	else
      self.ADMOB = {} -- create fake object for testing in windows player
      self.ADMOB.loadAd = function() end
      self.ADMOB.showAd = function() end
   end

	-- TITLE
	local mytitle = TextField.new(nil, "BUBBLE")
	mytitle:setAnchorPoint(0.5, 0.5)
	mytitle:setPosition(myapplicationwidth / 2, 2 * myapplicationheight / 10)
	mytitle:setScale(7)
	mytitle:setTextColor(colors_texts[3])
	self:addChild(mytitle)

	-- PLAY BUTTON
	local mybtnplayupbmp = Bitmap.new(Texture.new("GFX/ui/play_up.png"))
	local mybtnplaydownbmp = Bitmap.new(Texture.new("GFX/ui/play_down.png"))
	local mybtnplay = Button.new(mybtnplayupbmp, mybtnplaydownbmp)
	mybtnplay:setAnchorPoint(0.5, 0.5)
	mybtnplay:setPosition(myapplicationwidth / 2, 4 * myapplicationheight / 10)
	mybtnplay:addEventListener("click", function()
		scenemanager:changeScene("game", 1, transitions[1], easing.inBack)
	end)
	self:addChild(mybtnplay)

end
