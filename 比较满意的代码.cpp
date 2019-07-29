

//utf8字符串的iter


vector<string> line2vec(string& sentence)//utf8串转换为字符向量：方法2
{
	vector<string> line;
	if(sentence.empty()==true){return line;} //待识别句子内容为空
	
	int 	i=0;
	string	 tmp="";
	unsigned int  val=0;
	
	for(auto x:sentence){
		unsigned char item=(unsigned char)x;//不转换也行，直接负数比较。也可以使用位操作
			 if((0<item)    && (item<128)){val=1;} 
		else if((128<=item) && (item<192)){i++;continue;}
		else if((192<=item) && (item<224)){val=2;}
		else if((224<=item) && (item<240)){val=3;}
		else if((240<=item) && (item<248)){val=4;}
		else{cout<<"异常值"<<endl;}//异常情况 0~-8
		line.push_back(sentence.substr(i,val) );  //此处不进行符数转换，直接切分
		i++;
	}
	return line;
}





/****************无注释·泛型版～快速排序**********************/
template<typename T>
void show_data(vector<T> data){
	cout << endl;
	for(auto iter:data){
		cout << iter << " ";
	}
}
template<typename T>
void bi_swap(T& A,T& B){
	static T C = 0;
	C = A;
	A = B;
	B = C;
}

template<typename T>
int flat1(vector<T>& data, int start, int end){
	int tmp = start++;
	while (end > start){
		if ((data[start]>data[tmp]) && (data[end]<data[tmp]))	bi_swap<T>(data[start++], data[end--]);
		if (data[start] <= data[tmp])	start++;
		if (data[end] >= data[tmp])		end--;
	}
	data[tmp]>data[end] ? bi_swap<int>(data[tmp], data[end]) : void(0);  //更为严格的类型检查
	return end;
}
template<typename T>
void quick_sort2(vector<T>& data, int start, int end){
	if (end>start){
		int middle = flat1(data, start, end);
		quick_sort2(data, start, middle - 1);
		quick_sort2(data, middle, end);  
	}
}
