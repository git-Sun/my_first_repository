
function fundmental()
	x=123
	println("x的类型为$(x):",typeof(x))
	println("x类型最小|大值",typemin(x),"_",typemax(x) )

	# 为防止溢出 建议使用 BigInt 类 BigFloat
	# Float64 Int32 UInt64 {8,16,32,64,128}
	println("float64 size:",sizeof(Float64(1.2)),"----",sizeof(1.234)  )
	println("查看二进制表示:",bitstring(888) )
	println("0.0==-0.0  is ",(0.0==-0.0))
	println("1.0与下一个浮点数间的差值:",eps(Float32 ))
	println("2x+4=",(2x+4) )   # 变量数字间的运算默认为乘法
	println(7÷ 2,"-",xor(123, 234),"-")  #整除
	# +=  -=  *=  /=  \=  ÷=  %=  ^=  &=  |=  ⊻= (异或) >>>=(逻辑右移)  >>=  <<=
	println("逐元素运算",[1,2,3] .* 2,"NaN 不等于它自己")
	# isequal 认为 NaN 之间是相等的
	# isfinite(x) 有限数,isinf();  isnan()
	println("链式比较:",(1<2<=23==23< 66))  #链式比较中的顺序是不确定的
	println("sin .([1,2,3])",sin.([1,2,3]))
	println("舍入运算:",round(4.49),"---",trunc(pi))  #ceil():向+inf 取整; trunc 向0取整
	# 除法: fld()下取整; cld(x,y) 上取整 gcd(x,y,z):最大公约数;lcm:最小公倍数
	println("尾数",significand(x/7))
	println("分数:6//9= $(6//9)=$(float(6//9))")
	#  transcode 函数是 提供 Unicode 编码和其他编码转换的函数
	println('G',typeof('G'),Int('\n')  )
	str="hello word!"
	println(str[end-2],str[3:6],length(str*"第二个字符串*链接而不是+"))
	# """三引号 :多行文本"""
	# 正则表达式: r"..."  ,  版本号字面量: v" ... "  原生字符串: raw" ... "
end
#fundmental()   # 函数名字表示函数对象 ; 引用方式传递阐述
# return 函数返回的值是最后计算的表达式的值
# 匿名函数 x -> x^2+2x-1
# 元组: array1=(a=1,'123',345)
function 流程控制()
	println("流程控制函数被调用")
	plus12 = 	begin 
		x=1;y=2;
		println("begin---end 使用" )
		#return x+y  #函数被截断
	end
	asd=true
	if asd == true
		println("条件语句为真")
	elseif asd == false
		println("条件语句为假")
	end
	# if 代码块是"有渗漏的"，也就是说它们不会引入局部作用域。这意味着在 if 语句中新定义的变量依然可以在 if 代码块之后使用
	#(?:) 三元运算符
	i=1
	while i<5
		print(i,"+")
		i+=1
	end
	println("while end")
	for i= 1:5
		print(i,"+")
	end
	println("for end")
	for i in[1,2,3,4],j in [6,7,8,9]
		print(i,"+",j,"=")   #16种组合
	end
	println("for  in  end")
	# 用 throw 显式地创建异常
	# Julia 提供了 rethrow, backtrace 和 catch_backtrace 函数进行更高级的错误处理
	# 一个 Channel 是一个先进先出的队列
	# 全局声明常量 const ASD=666.666
	# struct 关键字与复合类型一起引入，后跟一个字段名称的块
	# 紧接在对象（函数，宏，类型和实例）之前的字符串都会被认为是对应对象的文档
	# 在 Julia Base 中，@assert 的实际定义更复杂。它允许用户可选地制定自己的错误信息
end
#流程控制()

function test()
	# test Julia's speed
	last_num=100000000
	tmp=1.0
	for  i=1:last_num
		tmp+=i
		#tmp-=i
		tmp*=i
		tmp/=i
	end
	println("result is $tmp")
end

test()
# 实验性的多线程库
#  特性不错;以后再学
