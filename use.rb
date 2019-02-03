#！/home/asen/ruby253/bin/ruby
#根据book 《ruby programming》学习ruby程序设计语言
#单行注释
=begin 
	不能放在程序里，end 必须单独一行
	多行注释的方法
=end
def first_function()
#基本概念
puts  "hello word"
print "hello world"," nothing","\n"
#($name) 全局变量标志
#you can't define const in function
# Asd=Asd+1 #error: dynamic constant assignment
#capital letters(upcase) is constant value
name=gets.chomp  #输入
puts name.upcase!  # 叹号改变原对象，否则不改变（传参）
puts "your name is #{name} "
#ruby will return the last expression evaluated
end

def condition()
	numbe_a= 10*rand
	#condition case 1
	if numbe_a < 5 
		puts "low five #{numbe_a}"
	elsif  numbe_a > 6
		puts "big six #{numbe_a}"
	else
		puts "five or six #{numbe_a}"
	end
	#condition case 2:need notice 
	unless numbe_a > 5
		puts "number is <= 5,#{numbe_a}"
	else
		puts "number is >5,#{numbe_a}"
	end
	#condition case 3 : one line
	if numbe_a < 3 then puts"number is less 3" end
	#condition 4
	num=numbe_a.round
	case 
		when num < 5 then puts"num < 5"
		when num > 5 then puts"num > 5"
		when num == 5 then puts "num is 5"
	end
	case num
		when 0..3 then puts"<4" 
		when 3..7 then puts"num between 3-7"
		when 7..8 then puts">7"
		else
			puts"except"
	end
end

def loopcase()
	numbe_a=(10*rand).round
  #loop case 1
	while numbe_a > 1 #item=array.next
		puts"first loop #{numbe_a}",' '
		numbe_a -= 1
		#break
	end
  #loop case 2
	until numbe_a > 9
		puts"second loop #{numbe_a}",' '
		numbe_a += 1
	end
  #loop case 3
  	(1..8).each do |item|
  		puts item																																																																																									
  	end
end

def use_yield()
	yield
	yield #use code block example
end
#use_yield {puts"your yield used}

def data_type()
  #Everything is an object
  	asd = 1234435
  	puts asd.object_id
  	print 1.class,'asqwed'.class,(:+.class),nil.class,"\n"
  #array
  	array1=[1,2,3,4,5,6,7,8]
  	puts array[1..3]
  #hash
	ash = { :leia => "Princess from Alderaan", :han => "Rebel without acause", 
		:luke => "Farmboy turned Jedi"}
	ash1={"a":1,"b":2,"c":3}
	puts ash[:leia]
  # mod:%,+=,-=,*=,/=,**=
	1.upto(5) {|x| print x,","}
  	5.downto(1) {|x| print x ,"-"}
  	5.step(50, 5) {|x| print x," "}
  	puts""
  	puts 123.to_s ,4.5.to_i,5.to_f
  #String
  	if "jieba is ok !".match("jieba")
		puts "regular expression".sub("regular","regex")#first occurrence to sub
	end
	puts"sun jonson".hash  #hash value
	puts 'A'.ord ,66.chr  #65:ascii
  	puts "待连接"+"字符串"
	puts "reverse".reverse,"AAAAA".sum
  	puts 'a'<'z'
  #operate:and or
	bool_1=true
	bool_1== true ? (puts"true"):(puts"false")

end	
#ruby class 
class Grape
	@@number=55  #class variable
	def initialize(p)
		@@number=p
		@heavy=6
	end
	def eat
		puts "good"
	end
	def self.color
		return "red"
	end
	def num
		puts @@number
	end
	
end
class My_grape < Grape
	def eat
		super
		puts"just so so!"
	end
end
def class_used()
	Grape.color
	asd=Grape.new(66)
	puts asd.num
	qwe=My_grape.new(55)
	qwe.eat

end
#first_function()
#condition()
loopcase()
#data_type()
#class_used()
=begin
	module: File ,Dir,marshal(serializing),
		regexp,
=end