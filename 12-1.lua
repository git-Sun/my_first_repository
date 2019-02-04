print("hello world")
print("true is a ",type(true))
print("print is a",type(print))
--table example
local tbl = {"apple", "pear", "orange", "grape"}
for key, val in pairs(tbl) do
    print("Key", key,"value",val)
end
--在 Lua 中，函数是被看作是"第一类值（First-Class Value）"，函数可以存在变量里:
function factorial1(n)
    if n == 0 then
        return 1
    else
        return n * factorial1(n - 1)
    end
end
print("f1 is",factorial1(5))
factorial2 = factorial1
print("f2 is"..factorial2(5)) 
--  ..  链接符
--   匿名函数
function anonymous(tab, fun)
    for k, v in pairs(tab)
    do
        print(fun(k, v))
    end
end
tab = { key1 = "val1", key2 = "val2" , key3="val3"}
anonymous(tab, function(key, val)
    return key .. " = " .. val
end)   
--if   then   end
--if   then   else end              条件控制
--local function name(argv...)
--      return   
---      end                 函数形式  
--[[ 函数返回两个值的最大值 --]]
function max(num1, num2)

   if (num1 > num2) then
      result = num1;
   else
      result = num2;
   end

   return result; 
end
-- 调用函数
print("两值比较最大值为 ",max(10,4))
print("两值比较最大值为 ",max(5,6))
--变参
function average(...)
   result = 0
   local arg={...}
   for i,v in ipairs(arg)
	do
		result = result + v
	end
   print("总共传入 " .. #arg .. " 个数")
   return result/#arg
end

print("平均值为",average(10,5,34,4,55,6,33))
--    	-=   不等于       %取余    ^ 平方
-- 逻辑运算符 and or not
--  #	一元运算符，返回字符串或表的长度。
--[[Lua 语言中字符串可以使用以下三种方式来表示：
     单引号间的一串字符。双引号间的一串字符。两个中括号间的一串字符
--]]

str="sun qiongsen is ME" 
print(string.upper(str))
print(string.lower(str))
print(string.gsub(str,'s','a',3))
--str 中的s被a替换 3次
print(string.reverse(str))
print(string.format("the value is:%d",4))
print(string.len("abcszvdsffghfghjghjtjt"))
print(string.rep("abcd",3))
-- 字符转换
-- 转换第一个字符
print(string.byte("Lua"))
-- 转换第三个字符
print(string.byte("Lua",3))
-- 转换末尾第一个字符
print(string.byte("Lua",-1))
-- 第二个字符
print(string.byte("Lua",2))
-- 转换末尾第二个字符
print(string.byte("Lua",-2))

-- 整数 ASCII 码转换为字符
print(string.char(97))
array = {"Lua", "Tutorial"}
--array从1开始计数
for i= 0, 2 do
   print(array[i])
end
--[[迭代器（iterator）是一种对象，
它能够用来遍历标准模板库容器中的部分或全部元素，
每个迭代器对象代表容器中的确定的地址
在Lua中迭代器是一种支持指针类型的结构，
它可以遍历集合的每一个元素。--]]
--泛型 for 在自己内部保存迭代函数，
--实际上它保存三个值：迭代函数、状态常量、控制变量。
array = {"Lua", "Tutorial"}

for k,v in ipairs(array) 
do
   print(k, v)
end
--迭代函数 ipairs（）控制变量 k，v 状态常量#array
--Lua也是通过table来解决模块（module）、包（package）和对象（Object）的。
-- 初始化表
mytable = {}

-- 指定值
mytable[1]= "Lua"

-- 移除引用
mytable = nil
-- lua 垃圾回收会释放内存
fruits = {"banana","orange","apple"}
-- 返回 table 连接后的字符串
print("连接后的字符串 ",table.concat(fruits))

-- 指定连接字符
print("连接后的字符串 ",table.concat(fruits,", "))

-- 指定索引来连接 table
print("连接后的字符串 ",table.concat(fruits,", ", 2,3))
-- 在末尾插入
table.insert(fruits,"mango")
print("索引为 4 的元素为 ",fruits[4])

-- 在索引为 2 的键处插入
table.insert(fruits,2,"grapes")
print("索引为 2 的元素为 ",fruits[2])

print("最后一个元素为 ",fruits[5])
table.remove(fruits)
print("移除后最后一个元素为 ",fruits[5])
fruits = {"banana","orange","apple","grapes"}
print("排序前")
for k,v in ipairs(fruits) do
	print(k,v)
end

table.sort(fruits)
print("排序后")
for k,v in ipairs(fruits) do
	print(k,v)
end
--require "<模块名>"
--[[添加c的动态链接库
local path = "/usr/local/lua/lib/libluasocket.dll"
local f = loadlib(path, "luaopen_socket")
--]]
--[[Lua查找一个表元素时的规则，其实就是如下3个步骤:
1.在表中查找，如果找到，返回该元素，找不到则继续
2.判断该表是否有元表，如果没有元表，返回nil，有元表则继续。
3.判断元表有没有__index方法，如果__index方法为nil，
则返回nil；如果__index方法是一个表，则重复1、2、3；如果__index方法是一个函数，则返回该函数的返回值。
__newindex 元方法用来对表更新，__index则用来对表访问 。
--]]
mytable = setmetatable({key1 = "value1"}, { __index = { key2 = "metatablevalue" } })
print(mytable.key1,mytable.key2)


mymetatable = {}
mytable = setmetatable({key1 = "value1"}, { __newindex = mymetatable })

print(mytable.key1)

mytable.newkey = "新值2"
print(mytable.newkey,mymetatable.newkey)

mytable.key1 = "新值1"
print(mytable.key1,mymetatable.key1)
--[[__add	对应的运算符 '+'.
__sub	对应的运算符 '-'.
__mul	对应的运算符 '*'.
__div	对应的运算符 '/'.
__mod	对应的运算符 '%'.
__unm	对应的运算符 '-'.
__concat	对应的运算符 '..'.
__eq	对应的运算符 '=='.
__lt	对应的运算符 '<'.
__le	对应的运算符 '<='.
--]]
--__tostring 元方法用于修改表的输出行为。
--[[Lua 协同程序(coroutine)与线程比较类似：
拥有独立的堆栈，独立的局部变量，独立的指令指针，
同时又与其它协同程序共享全局变量和其它大部分东西。
在任一指定时刻只有一个协同程序在运行，
并且这个正在运行的协同程序只有在明确的被要求挂起的时候才会被挂起。
协同程序有点类似同步的多线程，在等待同一个线程锁的几个线程有点类似协同。
coroutine.create()\coroutine.wrap() :创建协程
coroutine.resume() :重启
coroutine.yield() :挂起
coroutine.status() ： 查看状态
coroutine.running() :返回正在运行的协程号；
见 ：consumer.lua 生产者消费者问题
--]]
