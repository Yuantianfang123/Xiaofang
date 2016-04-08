
local MainScene = class("MainScene", function()
    return display.newScene("MainScene") --创建的是场景 
end)

function MainScene:ctor()
    -- cc.ui.UILabel.new({
    --         UILabelType = 2, text = "Hello, World", size = 64})
    --     :align(display.CENTER, display.cx, display.cy)
    --     :addTo(self)

    --精灵 你去死吧
    local sprite = cc.Sprite:create("sunset.png")
    sprite:setPosition(display.cx,display.cy)
    self:addChild(sprite)

    local sp = display.newSprite("SliderButton.png")
    sp:setPosition(display.cx,display.cy)
    self:addChild(sp)
   display.addSpriteFrames("minerAction.plist","minerAction.png")--添加到缓存

    local sp1 = display.newSprite("#miner_0701.png"); --添加＃代表从缓存中获取图片
    sp1:setPosition(200,300)
    self:addChild(sp1)

    --菜单  图片菜单
    local item = cc.MenuItemImage:create("projectile-button-off.png","projectile-button-on.png")
    item:registerScriptTapHandler(function(tag)
    	print(tag) 
        --进入下一个场景
    	local Secondscene = require("app.scenes.Secondscene")
         local scens = Secondscene.new()
         display.replaceScene(scens,"fade",2,cc.c3b(255,0,0)) --替换场景 后面的参数是动作，时间，以及颜色
    	print("nan")
    end)

    item:setTag(100)
    local menu = cc.Menu:create(item)
    menu:setPosition(200,400)
    self:addChild(menu)

     --文字菜单
     -- local item1 =cc.ui.newTTFLabelMenuitem.new({
     --   text = "AAAAA",
     --   size = 30,
     --   align = cc.ui.TEXT_ALIGN_CENTER,
     --   listener = neterNext,
     --   x = display.cx,
     --   y = display.cy,
     --   tag = 102
     --    })
     -- local menu1 = cc.Menu:create(item1)
     -- self:addChild(menu1)

     -- local function neterNext()
     --     if tag == 102 then
     --         local nextScene = require("app.scenes.Secondscene").new()
     --         cc.Director:getInstance():replaceScene(nextScene)
     --     end
     -- end

end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
