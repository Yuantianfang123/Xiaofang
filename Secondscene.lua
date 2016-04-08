local Secondscene = class("Secondscene", function()
	return display.newScene("Secondscene")
end)
function Secondscene:ctor()
	local sp = display.newSprite("sunset.png")
	sp:setPosition(display.cx,display.cy)
	self:addChild(sp) 

    self.mySp = display.newSprite("projectile-button-off.png",200,500)
    self:addChild(self.mySp)
	--self:actionDemo()--调用函数
	--self:scheduleDemo()
	--self:musicDemo()
	--self:touchDemo()
	--self:buttonDemo()
	--self:LoadingBarDemo()
	--self:sliderDemo()
	--self:editBoxDemo()
	--self:checkBoxDemo()
	--self:scrollViewDemo()
	self:pageViewDemo()
	--self:listViewDemo()

end
function Secondscene:actionDemo()
	--移动
	local move = cc.MoveTo:create(2.0,cc.p(300,300))
	--self.mySp:runAction(move)
	--旋转
	local rotate = cc.RotateBy:create(2.0,180)
	--self.mySp:runAction(rotate)
	--缩放
	local scale = cc.ScaleBy:create(2.0,2)
	--序列
	local seq = cc.Sequence:create(move,scale,totate)
 --     local seque = transition.sequence({cc.MoveTo:create(1.0.cc.p(display.cx,display.cy)),
 --           cc.FadeOut:create(0.2),
 --           cc.DelayTime:create(0.5),
 --           cc.FadeIn:create(0.3)
 --     	})

	--self.mySp:runAction(seq)

	--帧动画
	local frames = display.newFrames("miner_0%d.png",701,10,true) --
	local animation = display.newAnimation(frames,0.1) --时间间隔
	local animate = cc.Animate:create(animation)
	self.mySp:runAction(cc.RepeatForever:create(animate))

end
function Secondscene:scheduleDemo()--定时器
	local s = cc.Director:getInstance():getScheduler()--创建调度器
	self.num = s:scheduleScriptFunc(handler(self, Secondscene.myfunc),0,false)

end
function Secondscene:myfunc(t)
	local s = cc.Director:getInstance():getScheduler()
	s:unscheduleScriptEntry(self.num)
end

--音乐
 function Secondscene:musicDemo()
 	--audio.preloadMusic("")--预加载音乐 --一般音乐不需要预加载（不需要经常播放）
 	audio.playMusic("backMU.mp3",true) --是否循环播放
 	print(auto.getMusicVolune()) --获取音量
 	--audio.pauseMusic()--暂停音乐
 	audio.isMusicPlaying()--判断音乐是否正在播放

 	audio.preloadSound("bird.mp3") --预加载音效
 	audio.playSound("bird.mp3,false",false) -- 播放音效
 	audio.unloadSound("bird.mp3")-- 从内存中移除

 end

 --触摸
 function Secondscene:touchDemo()
 	function onTouchBegan(touch, event)
 		local p = touch:getLocation()
 		print(p.x)
 		print(p.y)
 		print("began")
 	  return true
 	end
 	function onTouchMoved(touch, event)
 		print("moved")
 	end
 	function onTouchEnded(touch, event)
 		print("end")
 	end

 	local d = cc.Director:getInstance():getEventDispatcher() --分发器
 	local l = cc.EventListenerTouchOneByOne:create()
 	l:setSwallowTouches(true)--设置吞噬（）
 	l:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN)
 	l:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED)
 	l:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED)
 	d:addEventListenerWithSceneGraphPriority(l, self)
 end

 --button按钮
 function Secondscene:buttonDemo()
 	--cc.ui.UIPushButton 这种创建的方式已经不推荐，因为没人维护了
 -- 	local btn = cc.ui.UIPushButton.new({normal = "btn-play-normal.png",pressed = "btn-play-selected.png"}, {scale9 = true})
 -- 	btn:setPosition(400,400)
 -- 	self:addChild(btn)
 -- 	btn:onButtonClicked(function ()
 -- 		-- audio.preloadSound("bird.mp3") --预加载音效
 -- 	    --audio.playSound("bird.mp3",false) -- 播放音效
 -- 	    audio.playMusic("backMU.mp3",true)
 -- end)
        --正常图片，点击的图片，不可点击的图片 是从本地找还是从缓存中找图片  （2，3，4个参数可以省略 ） ccui.TextureResType.localType
       local button = ccui.Button:create("btn-about-normal.png","btn-about-selected.png","btn-play-selected.png",ccui.TextureResType.localType)
        button:setPosition(400,400)
        button:setTag(101)
        self:addChild(button)
        print(ccui.TextureResType.localType)

        button:setTouchEnabled(true) --设置是否可以触摸
        button:setBright(true) --设置显示不可点击的图片
        button:setPressedActionEnabled(true)
        button:setZoomScale(0.1) --1+0.1 变大系数 就是变大1.1倍
        
        button:setTitleText("nan")
        button:setTitleColor(cc.c3b(255, 0, 0)) --设置文字的颜色
        button:setTitleFontName("menlo") --字体类型
        button:setTitleFontSize(20) --字体大小
        --添加触摸函数
        local key
        button:addTouchEventListener(function (sender,event)
        	print(sender:getTag())
        	--print(event) --0 1 2  0开始 1移动 2在button范围中结束，3button范围外面结束
        	if event == 0 then
        		key = false
        	end
        	if event == 1 then
        		key =true
        	end
        	if key==2 and not key then
        		print("Nan")
        	end
        end)

 end

-- LoadingBar
 function Secondscene:LoadingBarDemo()
 	local loadBar = ccui.LoadingBar:create("barH.png")
 	loadBar:setPosition(cc.p(200,400))
 	self:addChild(loadBar)
 	loadBar:setDirection(0) -- 0左右  1右左
 	loadBar:setPercent(10)
 	print(loadBar:getPercent()) --获取进度值

 end
--滑块
 function Secondscene:sliderDemo()
 	print("slider")
    local slider = ccui.Slider:create()
    slider:setPosition(200,200)
    self:addChild(slider)
    slider:loadBarTexture("SliderBarFixed.png")--背景图片
    slider:loadSlidBallTextures("Button01.png","Button01Pressed.png","Button02.png") --点击按钮的图片   正常， 点击 ，不可点击 
    slider:setPercent(20)
    slider:setTag(200)
    slider:addEventListener(function(sender,event)
    	print(sender:getTag())
    	print(sender:getPercent()) --获取滑块的值
    	print(event)
    end)
 end

 --输入框
 -- function Secondscene:editBoxDemo()
 -- 	local editbox = ccui.EditBox:create(cc.size(320,60),"bar.png")--第一个与c＋＋相比有改动，Scale9Sprite 会根据设置的大小 拉伸图片
 -- 	editbox:setPosition(display.cx,display.cy)
 -- 	self:addChild(editbox) --在模拟器上不会出现虚拟键盘
 --    --提示的文字
 -- 	editbox:setPlaceholderFontColor(cc.cc.c3b(255, 0, 0)) --
 -- 	editbox:setPlaceholderFontName("menlo") --提示文字的字体
 -- 	editbox:setPlaceholderFontSize(22) --提示文字的大小
 -- 	editbox:setPlaceholder（"xiaonanhua"）--提示文字
    

 -- 	editbox:setFontName("menlo")--输入文本的字体
	-- editbox:setFontSize(30)--输入文本的大小
	-- editbox:setFontColor(cc.c3b(0, 255, 0))--输入文本的颜色
	-- editbox:setText("唯有爱与美食不可妥协")--设置输入的文本
	-- print(editbox:getText())--获得输入的文本


 -- 	local function editboxEventhandler(eventType,sender)
 -- 		print(sender:getText()) -- 文本输入的neirong
 -- 		if eventType == "began" then
 -- 			print("begen")
 		
 -- 		elseif eventType == "ended" then
 -- 			print("ended")
 -- 		elseif eventType == "change" then
 -- 		print("change")
 -- 		elseif eventType == "return" then
 -- 		print("return")	
 -- 	end
 -- end
 --        editbox:registerScriptEditBoxHandler(editboxEventhandler)
 --        editbox:setinputFlag(0) --密码形势
 --        editbox:setMaxLength(10)-- 限制文本的长度
 -- end

 --选择框
 function Secondscene:checkBoxDemo()
 	local checkbox = ccui.CheckBox:create("CheckBoxButton2Off.png","CheckBoxButton2On.png","CheckBoxButtonOff.png","CheckBoxButtonOffDisabled.png","CheckBoxButtonOffPressed.png")
 	checkbox:setSelected(true) --设置选中的状态
 	checkbox:setTouchEnabled(false) --设置是否可以触摸
 	checkbox:isSelected() --是不是选中的状态
 	checkbox:setTag(101)
 	checkbox:addEventListener(function(sender,event)
 		print(sender:getTag())
 		print(checkbox:isSelected()) --0 1 是否选中
 	end)
 	checkbox:setPosition(cc.p(240,160))
 	self:addChild(checkbox,10)
 end

 -- 滚动视图
 function Secondscene:scrollViewDemo()
 	local scrollView = ccui.ScrollView:create()
 	scrollView:setContentSize(cc.size(480, 640))--窗口大小
	scrollView:getInnerContainer():setContentSize(cc.size(1600, 640))--方内容容器的大小
 	scrollView:setPosition(cc.p(240,20))
 	scrollView:setBounceEnabled(false) --弹性效果
 	local key
 	for j = 1, 3  do

 	    for i =1 ,10 do
 		local button = ccui.Button:create("btn-about-normal.png","btn-about-selected.png")
 	    button:setTag(101 + i)
 	    button:setTitleText(tostring(i+(j-1)*10))
 	    button:setTitleColor(cc.c3b(255, 0, 0)) --设置颜色
 	    button:setTitleFontName("menlo") --字体类型
 	    button:setTitleFontSize(20)
 	    button:addTouchEventListener(function(sender,event)
 	    	if event ==0 then
 	    		key = false
                print("111")
 	    	end
 	    	if event == 1 then
 	    		key = true
                print("222")
 	    	end
 	    	if event ==2 and not key then
 	    		print("33")
 	    	end
 	    end)
 	    button:setPosition(cc.p(40+i*150,420-(j-1)*100))
 	    scrollView:addChild(button)
 	    end
    end
 	scrollView:setDirection(ccui.ScrollViewDir.both)--滑动的方向
 	self:addChild(scrollView)
 	

 end
 --pageView 一页一页的
 function Secondscene:pageViewDemo()
 	local pageView = ccui.PageView:create()
 	pageView:setPosition(cc.p(240,100))
 	pageView:setContentSize(cc.size(480,400)) --设置窗口的大小
 	for i = 1,10 do
 		local lo = ccui.Layout:create()--层
 		lo:setBackGroundImage("HelloWorld.png") --背景图片
 		lo:setBackGroundImageScale9Enabled(true)
 		lo:setContentSize(cc.size(480,320)) --背景图片根据size进行缩放
 		local button = ccui.Button:create("btn-about-normal.png","btn-about-selected.png")
 		button:setTag(101 + i)
 		button:setTitleText(tostring(i .. "pageView"))
 	    button:setTitleColor(cc.c3b(255, 0, 0)) --设置颜色
 	    button:setTitleFontName("menlo") --字体类型
 	    button:setTitleFontSize(20)
 		button:addTouchEventListener(function(sender,event)
 			print(sender:getTag())
 			
 		end)
 		button:setPosition(240,160)
 		lo:addChild(button)
 		pageView:addPage(lo) --不是addChild
 	end
 	self:addChild(pageView)

 end
 --  listView
 function Secondscene:listViewDemo()
 	local listView = ccui.ListView:create();
 	listView:setContentSize(cc.size(200,480)) --窗口的大小
 	listView:setItemsMargin(50)--控件之间的间距
 	listView:setBounceEnabled(true) -- 弹性效果
 	listView:setDirection(1) --1 竖 2 横
 	for i=1,10 do
 		local button = ccui.Button:create("btn-about-normal.png","btn-about-selected.png")
 		button:setTag(101 + i)
 		button:setTitleText(tostring(i .. "listView"))
 	    button:setTitleColor(cc.c3b(255, 0, 0)) --设置颜色
 	    button:setTitleFontName("menlo") --字体类型
 	    button:setTitleFontSize(20)

 		button:addTouchEventListener(function(sender,event)
 			print(sender:getTag())
 		end)
 		listView:pushBackCustomItem(button)--添加函数 不是addChild
 	end
 	listView:setTag(100)
 	listView:setPosition(100,50)
 	self:addChild(listView)
 end


return Secondscene