# yanOptionBarController
`yanOptionBarController` 是一个基于UIViewController等原生控件封装的选项卡控制器，目前适配 iphone、ipad，目前能够自定义：

- 选项卡普通文字颜色 
- 选中文字颜色
- 选项卡背景颜色
- 选项栏滚动条高度，颜色
- 选项卡个数

使用方式如下：

```objc
// 创建三个控制器
IHHireViewController *hire = [IHHireViewController new] ;
IHTaskViewController *task = [IHTaskViewController new] ;
IHTopicViewController *topic = [IHTopicViewController new] ;
NSArray *ctrlArr = @[hire,task,topic] ;

// 配置选项卡要显示文字的颜色
NSDictionary *dic1 = @{
                       yanOptionItemTitle:@"A",
                       yanOptionItemTitleNormalColor:[UIColor blackColor],
                       yanOptionItemTitleSelectedColor:[UIColor blueColor],
                       } ;
    
NSDictionary *dic2 = @{
                       yanOptionItemTitle:@"B",
                       yanOptionItemTitleNormalColor:[UIColor blackColor],
                       yanOptionItemTitleSelectedColor:[UIColor blueColor],
                       } ;
NSDictionary *dic3 = @{
                       yanOptionItemTitle:@"C",
                       yanOptionItemTitleNormalColor:[UIColor blackColor],
                       yanOptionItemTitleSelectedColor:[UIColor blueColor],
                       } ;
                       
NSArray *itemDict = @[dic1,dic2,dic3] ;
    
// 初始化控制器以及 optionitem 的属性
yan_optionController *optionCtrl = [[yan_optionController alloc]initWithViewControllers:ctrlArr optionItemsAttributes:itemDict addTarget:self] ;
    
// 配置选项栏滚动条的颜色和高度
[optionCtrl.optionBar configScorllBarHeight:4 Color:[UIColor orangeColor]] ;

// 配置选项栏的颜色（不设置默认为白色）
optionCtrl.optionBar.backgroundColor = [UIColor yellowColor] ;

```

`yanOptionBarController` 开放两个协议，分别为：

```objc
-(void)DidSelectIndexOptionItem:(NSInteger)index // 选中选项卡的回调
-(void)DidscrollToViewController:(UIViewController *)viewController // 滑动控制器结束的回调
```
