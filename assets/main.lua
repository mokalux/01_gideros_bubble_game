scenemanager = SceneManager.new(
	{
		["menu"] = Menu,
		["game"] = Game,
		["gameover"] = GameOver,
	}
)

stage:addChild(scenemanager)

scenemanager:changeScene("menu", 1, transitions[1], easing.outBack)


