# BNCategory
封装了常用的集合类，NSNumber类，NSString类赋予了函数式的高阶函数

##NSArray
```objc


//forEach 遍历 -- output 1 2 3 4
NSArray *data = @[@"1",@"2",@"3",@"4"];
[data forEach:^(id obj) {
	NSLog(@"%@",obj);
}];

//reverseEach 反序遍历 -- output 4 3 2 1
NSArray *data = @[@"1",@"2",@"3",@"4"];
[data reverseEach:^(id obj) {
	NSLog(@"%@",obj);
}];

//eachTimes遍历 带数组索引 -- output 1:0 2:1 3:2 4:3
NSArray *data = @[@"1",@"2",@"3",@"4"];
[data eachTimes:^(id obj, NSUInteger index) {
 	NSLog(@"%@:%ld",obj, index);
}];

//reverseEachTimes 反序遍历 -- output 4:3 3:2 2:1 1:0
NSArray *data = @[@"1",@"2",@"3",@"4"];
[data reverseEachTimes:^(id obj, NSUInteger index) {
 	NSLog(@"%@:%ld",obj, index);
}];

//apply异步遍历 用于处理大量数据 无法保证顺序 2 3 1 4...
NSArray *data = @[@"1",@"2",@"3",@"4"];
[datas apply:^(id obj) {
  NSLog(@"%@",obj);
}];
       
//map -- output [1个,2个,3个,4个]
NSArray *data = @[@"1",@"2",@"3",@"4"];
NSArray *data1 =
data.map(^id (id obj){
  return [obj stringByAppendingString:@"个"];
});   
NSLog(@"%@",data1);

//map filter -- output [3,4]
NSArray *data = @[@"10",@"20",@"30",@"40"];
NSArray *data2 =
data.map(^id (id obj){
  return [obj substringFromIndex:0];
})
.filter(^BOOL (id obj){
  return [obj integerValue] > 2;
});
NSLog(@"%@",data2);

//reduce -- output 12
NSArray *data = @[@"1",@"2",@"3",@"4"];
id result =
[data reduce:@"2" with:^id(id a, id b) {
  return @([a integerValue] + [b integerValue]);
}];
NSLog(@"%@",result);

//将数组中字符串用某个字符聚合 -- output @"1:2:3:4"
NSArray *data = @[@"1",@"2",@"3",@"4"];
NSString *resultStr = data.join(@":");
NSLog(@"%@",resultStr);

//连接数组 -- output @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]
NSArray *data = @[@"1",@"2",@"3",@"4"];
NSLog(@"%@",data.concat(@"5",@"6",@[@"7",@"8"],nil));

//索引


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

###UIView
```objc

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



