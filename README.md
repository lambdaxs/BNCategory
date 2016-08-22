# BNCategory
封装了常用的集合类，NSArray类、NSNumber类、NSString类赋予了函数式的高阶函数

##NSArray
####forEach 元素遍历 -- output a b c d

```objc
[@[@"a",@"b",@"c",@"d"] forEach:^(id obj) {
	NSLog(@"%@",obj);
}];
```

####forEach 带索引的遍历 -- output a=0 b=1 c=2 d=3
```objc
[@[@"a",@"b",@"c",@"d"] forEach:^(id obj,NSUInteger index) {
	NSLog(@"%@=%d",obj,index);
}];
```

####reverseEach 反序遍历 -- output d c b a
```objc
[@[@"a",@"b",@"c",@"d"] reverseEach:^(id obj) {
	NSLog(@"%@",obj);
}];
```

####reverseEach 带索引的反序遍历 -- output d=0 c=1 b=2 a=3
```objc
[@[@"a",@"b",@"c",@"d"] reverseEach:^(id obj,NSUInteger index) {
	NSLog(@"%@=%d",obj,index);
}];
```

####asynEach异步遍历 用于处理大量数据 无法保证顺序 b a c d
```objc
[@[@"a",@"b",@"c",@"d"] asynEach:^(id obj) {
  NSLog(@"%@",obj);
}];
```
       
####map -- output @[@"1个",@"2个",@"3个",@"4个"]
```objc
NSArray *data =
@[@"a",@"b",@"c",@"d"].map(^id (id obj){
  return [obj stringByAppendingString:@"个"];
});   
NSLog(@"%@",data);
```

####map filter  取data数组每个元素的第一个字符，然后过滤得到整数值大于2的元素-- output @[@"3",@"4"]
```objc
NSArray *data = @[@"10",@"20",@"30",@"40"];
NSArray *result =
data.map(^id (id obj){
  return [obj substringFromIndex:0];
})
.filter(^BOOL (id obj){
  return [obj integerValue] > 2;
});
NSLog(@"%@",result);
```

####新增map动态闭包实现
```objc
@[@"a",@"b",@"c"].map(^id (id obj,NSUinteger index){
	NSLog(@"%@==%d",obj,index);//output a=1 b=2 c=3
});
```

####新增filter动态闭包实现 过滤得到数组里从第三个元素后大于20的元素
```objc
@[@"11",@"20",@"13",@"34","9"].filter(^BOOL (id obj,NSUInteger index){
	if (index > 2){
		return [obj integerValue] > 20;
	}else {
		return NO;
	}	
});
```

####reduce -- output @12
```objc
NSArray *data = @[@"1",@"2",@"3",@"4"];
id result =
[data reduce:@"2" with:^id(id a, id b) {
  return @([a integerValue] + [b integerValue]);
}];
NSLog(@"%@",result);
```

####将数组中字符串用某个字符聚合 -- output @"1+2+3+4"
```objc
NSArray *data = @[@"1",@"2",@"3",@"4"];
NSString *resultStr = data.join(@"+");
NSLog(@"%@",resultStr);
```

####连接数组 -- output @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]
```objc
NSLog(@"%@",@[@"1",@"2",@"3",@"4"].concat(@"5",@"6",@[@"7",@"8"],nil));
```

####索引
```objc
[@[@1,@2,@3,@4] indexOf:@2]; //1
[@[@1,@2,@3,@4] indexOf:@5]; //-1
```

####二维矩阵转置 -- output [[1,5,9],[2,6,10],[3,7,11],[4,8,12]]
```objc
NSArray *matrix = 
@[@[@"1",@"2",@"3",@"4"],
@[@"5",@"6",@"7",@"8"],
@[@"9",@"10",@"11",@"12"]];
NSLog(@"%@",[NSArray turn:matrix]);
```

##NSMutableArry
```objc
//pop push	模拟栈
//shift unshift 模拟队列
```

##NSNumber
```objc
//output hello hello hello hello
[@4 times:^{
  NSLog(@"hello ");
}];

//output 0 1 2 3 4
[@5 timesWithIndex:^(NSInteger i) {
	NSLog(@"%ld ",i);
}];

//output 10 11 12 13 14 15
[@10 to:15 do:^(NSInteger i) {
  NSLog(@"%ld ",i);
}];

//output 20 19 18 17 16 15
[@20 to:15 do:^(NSInteger i) {
	NSLog(@"%ld ",i);
}];

//字符串转NSNumber output -- @12
NSLog(@"%@",[NSNumber numberByString:@"12"]);

//NSNumber整数相加 output -- @32
NSLog(@"%@",@12.add(@20));

//NSNumber浮点数相加 output -- @32.1
NSLog(@"%@",@12.add(@20.1));

//NSNumber链式操作  output -- 8.666666
NSLog(@"%@",(@12).add(@1).mul(@2).div(@3.0));
```

##NSString
```objc
//去掉两端空格 output -- 123
NSLog(@"%@",@" 123 ".trim());

//以某个字符拆分字符串 output -- [1,2,3]
NSLog(@"%@",@"1,2,3".split(@","));

//将字符串中的某个字符替换 output -- 1=2=3
NSLog(@"%@",@"1,2,3".replace(@",",@"="));

//拼接字符串 output -- xiaos.hello
NSLog(@"%@",@"xiaos".append(@",").append(@"xiaos"));

NSLog(@"%@",@"abcde".substr(1,2));	//bc
NSLog(@"%@",@"abcde".subback(3));//cde
NSLog(@"%@",@"abcde".subfront(3));//abc
NSLog(@"%@",@"abcde".indexOf(3));//d
NSLog(@"%d",[@"a" hex]);//10
```

####16进制的a转为10进制
```obj
NSLog(@"%d",[@"a" itoa:16]);//10
```

####2进制的101010转为10进制
```objc
NSLog(@"%d",[@"101010" itoa:2]);//42
```

####十六进制与十进制之间的转换
```obj
NSLog(@"%@",[@"15" hexStr]);	//@"f"
NSLog(@"%@",[@"16" hexStr]);	//@"10"
NSLog(@"%@",[@"17" hexStr]);	//@"11"
    
NSLog(@"%d",[@"a" hex]);		//10
NSLog(@"%d",[@"b" hex]);		//11
NSLog(@"%d",[@"ff" hex]);		//255
```

##NSTimer
```objc
//创建一个自动运行的定时器
NSTimer *timer =
[NSTimer scheduledTimer:2 repeats:YES block:^(NSTimer *timer) {
    NSLog(@"hello");
}];
//开始运行
[timer start];
//暂停运行
[timer stop];
//结束运行
[timer invalidate];
```
##UIButton
```objc
//为按钮添加点击事件 默认onClick是touchUpInside
UIButton *btn = [[UIButton alloc]init];
[btn onClick:(^id sender){
	NSLog(@"hello");
}];
//添加其他事件 UIControlEventTouchDown
[btn on:UIControlEventTouchDown do:(^id sender:{
	NSLog(@"hello");
}];
```

###UIView
```objc
//为UIView元素添加点击事件
UIView *viewa = [UIView new];
[viewa onCilck:(^UIGestureRecognizer g){
	//do somthing...
}];
```

##NSObject
```objc
//KVO的闭包实现
Person *p = [[Person alloc] initWithName:@"xiaos"];
//监听p.name的改变 此观察者自动释放 若需提前释放 [p unWatchForKeyPath:@"name"] 全部释放[p unWathAll]
[p watchForKeyPath:@"name" block:^(id obj, id oldVal, id newVal) {
	NSLog(@"%@:%@",oldVal,newVal); 
}];
   

//用运行时为Object绑定了一个字典属性，用于在一些场景下的多参数传值。例如：
UIButton *btn = [[UIButton alloc] init];
btn.extraInfo = @{@"name":@"xiaos"};
[bnt onClick:(^id sender){
	NSLog(@"%@",[sender extraInfo][@"name"]);
}];
//output @"xiaos"

//控制器间跳转时
HomeViewController *homeVC = [HomeViewController new];
homeVC.extraInfo = @{@"name":@"xiaos",@"age":@"20"};
[self.navigationController pushViewController:homeVC animated:YES];
//在homeVC中即可取extraInfo获取传过来的信息
NSLog(@"%@",self.extraInfo[@"name"]); //输出 xiaos


//模仿css的ID选择器
//在controller或者view中 避免在控制器或者View中新建属性
//将btn按钮添加到self的管理中
UIButton *btn = [UIButton new];
[self setView:btn byId:@"#dateBtn"];
//在其他地方引用
UIButton *btn = [self viewById:@"#dateBtn"];

//todo：模仿css的类选择器 增加一组同类型控件的管理

```

##DEV 实验性特性
###UILabel
```objc
//模仿css 通过设置键值对属性来定义控件样式 
//对于数值的NSString NSNumber，颜色的UIColor 十六进制 RGB都做容错处理，尽量兼容css的属性。 
//定位布局属性暂时不做支持
UILabel *label = [UILabel cssLabel:@{
@"text":@"hello world",
@"color":@"red",
@"font-size":@"17",
@"background-color":@"#aabbcc",
@"border-color":@"RGB(10,20,30)",
@"border-width":@1,
@"border-raduis":@"3"
}];
```



