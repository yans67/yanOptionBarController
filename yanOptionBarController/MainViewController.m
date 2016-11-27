//
//  MainViewController.m
//  SelectionController
//
//  Created by yans67 on 16/11/17.
//  Copyright © 2016年 Minstone. All rights reserved.
//

#import "MainViewController.h"
#import "yan_optionController.h"
#import "yan_optionBar.h"
#import "yan_optionBarItem.h"

#import "IHHireViewController.h"
#import "IHTaskViewController.h"
#import "IHTopicViewController.h"

@interface MainViewController ()<YANOptionControllerDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor] ;

}
- (IBAction)present:(id)sender {
    IHHireViewController *hire = [IHHireViewController new] ;
    IHTaskViewController *task = [IHTaskViewController new] ;
    IHTopicViewController *topic = [IHTopicViewController new] ;
    NSArray *ctrlArr = @[hire,task,topic] ;
    // 配置 item 显示文字的颜色
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
    
    // 配置滑动条的颜色和高度
    [optionCtrl.optionBar configScorllBarHeight:4 Color:[UIColor orangeColor]] ;
    optionCtrl.optionBar.backgroundColor = [UIColor yellowColor] ;
    
    [self presentViewController:optionCtrl animated:YES completion:^{
        ;
    }] ;
}

-(void)DidSelectIndexOptionItem:(NSInteger)index{
    NSLog(@"--mainViewController--%ld",index) ;
}

-(void)DidscrollToViewController:(UIViewController *)viewController{
    NSLog(@"%@",NSStringFromClass([viewController class])) ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
