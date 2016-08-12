# BNCategory
封装了常用的集合类，NSNumber类，NSString类赋予了函数式的高阶函数

##NSArray
```objc
NSArray *data = @[@"1",@"2",@"3",@"4"];

//each 遍历 -- output 1 2 3 4
[datas each:^(id obj) {
	NSLog(@"%@",obj);
}];

//reverseEach 反序遍历 -- output 4 3 2 1
[datas reverseEach:^(id obj) {
	NSLog(@"%@",obj);
}];

//eachTimes遍历 -- output 1:0 2:1 3:2 4:3
[datas eachTimes:^(id obj, NSUInteger index) {
 	NSLog(@"%@:%ld",obj, index);
}];

//reverseEachTimes 反序遍历 -- output 4:3 3:2 2:1 1:0
[datas reverseEachTimes:^(id obj, NSUInteger index) {
 	NSLog(@"%@:%ld",obj, index);
}];

//apply异步遍历 用于处理大量数据 无法保证顺序
[datas apply:^(id obj) {
  NSLog(@"%@",obj);
}];
       
//map -- output [1个,2个,3个,4个]
NSArray *data1 =
data.map(^id (id obj){
  return [obj stringByAppendingString:@"个"];
});   
NSLog(@"%@",data1);

//map filter -- output [3,4]
NSArray *data2 =
data1.map(^id (id obj){
  return [obj substringFromIndex:0];
})
.filter(^BOOL (id obj){
  return [obj integerValue] > 2;
});
NSLog(@"%@",data2);

//reduce -- output 9
id result =
[data2 reduce:@"2" with:^id(id a, id b) {
  return @([a integerValue] + [b integerValue]);
}];
NSLog(@"%@",result);

//将数组中字符串用某个字符聚合 -- output @"1:2:3:4"
NSString *resultStr = [datas implode:@":"];
NSLog(@"%@",resultStr);

//二维矩阵转置 -- output [[1,5,9],[2,6,10],[3,7,11],[4,8,12]]
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
NSLog(@"%@",[@12 OperaInt:@20 type:BNAdd]);

//NSNumber浮点数相加 output -- @32.1
NSLog(@"%@",[@12 OperaFloat:@20.1 type:BNAdd]);
```

##NSString
```objc
//去掉两端空格 output -- 123
NSLog(@"%@",[@" 123 " stringByTrim]);

//以某个字符拆分字符串 output -- [1,2,3]
NSLog(@"%@",[@"1,2,3" explode:@","]);

//将字符串中的某个字符替换 output -- 1=2=3
NSLog(@"%@",[@"1,2,3" replace:@"," to:@"="]);

//拼接字符串 output -- xiaos.hello
NSLog(@"%@",@"xiaos".append(@",").append(@"xiaos"));
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
[btn tapped:UIControlEventTouchDown do:(^id sender:{
	NSLog(@"hello");
}];
```
##NSObject
```objc
//用运行时为Object绑定了一个字典属性，用于在一些场景下的多参数传值。例如：
UIButton *btn = [[UIButton alloc] init];
[btn setExtraInfo:@{@"name":@"xiaos"}];
[bnt onClick:(^id sender){
	NSLog(@"%@",[sender extraInfo][@"name"]);
}];
//output @"xiaos"
```


