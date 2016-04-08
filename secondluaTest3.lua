
--[[
t1 = {x = 10,y = 20}
t2 = {x = 20,y = 30}
--元表 备用的库，某些内容在自己这个表中找不到，那么可以到元表中找
mt = {}
mt.__add = function (a,b) --__add 是自动有的
	
	local t = {}
	t.x = a.x + b.x
	t.y = a.y + b.y
	return t
end


mt.__mul = function (a,b)
	local  ta = {}
	ta.x = a.x * b.x
	ta.y = a.y * b.y
	return ta
end
setmetatable(t1, mt)  --设置t1的元表 为mt 
t3 = t1 + t2  -- 加减乘除  首先是找第一个操作数，如果有 执行，如果第一个没有，找第二个，如果都没有，就会报错
             -- __sub减法 __mul乘法 __div除法 __unm相反数 __mod取模 __pow乘幂
t4 = t1 * t2
print(t3.x)
print(t3.y)

print(t4.x) --200
print(t4.y) --600
print(getmetatable(t1)) -- 获取t1元表


print("-----关系--------------------") --两个表的元表要一致
--__eq 等于  __lt  小于  __le 小于等于
t5 = {x =10 ,y =10}
t6 = {x = 10,y = 10}
rt = {}
rt.__eq = function (a,b)
    print("Hello")
	if a.x == b.x and a.y == b.y then
		return true
	end
	return false
end
setmetatable(t5, rt)
setmetatable(t6, rt)

print(t5==t6) --true
]]


print("-----------__index-----------")
-- __index   在查找某个字段时（包括函数），会在这个表中查找，如果没有且这个表没有元表 ，输出nil ，
-- 如果有元表就会去元表中查找，并且元表有__index字段是函数，就会调用这个函数,如果这个__index是表(下面的t2表)，就在这个表中查找（说到底就是__index指向谁，就去那里查找）
t1 = {}
print(t1.x) --nil
mt = {}
t2 = {x = 1}
mt.__index = t2
-- mt.__index = function (t,k)
-- 	print("Hello")
-- 	print(k)
-- 	return 1

-- end
setmetatable(t1, mt)
print(t1.x) --1
