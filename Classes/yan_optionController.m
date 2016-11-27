//
//  IHSquareViewController.m
//  Inhere
//
//  Created by yans67 on 16/11/8.
//  Copyright © 2016年 minstone. All rights reserved.
//

/*使用scrollView添加子控制器的视图，不能直接初始
 化多个视图，而是应该滚动条滑动到相应子控制器时才触
 发相应子控制器的某些事件，例如网络请求等操作
 */
#import "yan_optionController.h"
#import "yan_optionBar.h"

#define BARHEIGHT 44

@interface yan_optionController ()<UIScrollViewDelegate>

@property (strong, nonatomic)UIScrollView *scrollView ;

// optionController 包含很多controller，
// controller 包含各自的item
@property (strong, nonatomic)NSArray *optionViewControllers ;
@property (strong, nonatomic)NSArray *optionItemsAttributes ;

@end
@implementation yan_optionController{
    NSInteger selectedIndex ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - ============== viewController ==============
- (void)viewDidLoad {
    [super viewDidLoad];
}
// 适配旋转 _scrollView、optionBar、optionBar.scrollBar、optionBar.barItem
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews] ;
    _scrollView.frame = CGRectMake(0, yanOptionBarHeight + 20, YANWIDTH, YANHEIGHT) ;
    _scrollView.contentSize = CGSizeMake(yanOptionItemsCount * YANWIDTH, 0) ;
    int idx = 0 ;
    for (UIViewController *viewController in _optionViewControllers) {
        [viewController.view setFrame:CGRectMake(idx++ * YANWIDTH, 0, YANWIDTH, YANHEIGHT)] ;
    }
    _optionBar.frame = CGRectMake(0, 20,YANWIDTH,BARHEIGHT) ;
    [_optionBar setNeedsLayout] ;
}

#pragma mark - ============== init ==============
- (instancetype)initWithViewControllers:(NSArray<UIViewController *>*)optionViewControllers optionItemsAttributes:(NSArray<NSDictionary *>*)optionItemsAttributes addTarget:(id)delegate{
    if(self = [super init]){
        self.view.backgroundColor = [UIColor whiteColor] ;
        self.optionItemsAttributes = optionItemsAttributes;
        self.optionViewControllers = optionViewControllers;
        self.delegate = delegate ;
    }
    return self ;
}
#pragma mark - ============== config ==============
-(void)setOptionViewControllers:(NSArray *)optionViewControllers{
    
    _optionViewControllers = optionViewControllers ;
    yanOptionItemsCount = optionViewControllers.count ;
 
    NSAssert(optionViewControllers,@"the optionViewControllers is nil") ;
    NSAssert(_optionViewControllers.count == _optionItemsAttributes.count, @"The count of yanOptionViewController is not equal to the count of tabBarItemsAttributes") ;

    // 清除原来的optionViewControllers的关系链
    if(_optionViewControllers && _optionViewControllers.count){
        for (UIViewController *viewController in optionViewControllers) {
            [viewController willMoveToParentViewController:nil] ;
            [viewController.view removeFromSuperview] ;
            [viewController removeFromParentViewController] ;
        }
    }
    
    int idx = 0;
    
    // 添加子viewController
    for (UIViewController *viewController in _optionViewControllers) {
        [self addChildViewController:viewController] ;
        [viewController.view setFrame:CGRectMake(idx++ * YANWIDTH, 0, YANWIDTH, YANHEIGHT)] ;
        [self.scrollView addSubview:viewController.view];
    }
    idx = 0 ;
    
    // 为每个子控制器配置相应的 optionItem
    for (NSDictionary *itemDic in _optionItemsAttributes) {
        
        [self.optionBar configOptionBarItemWithDic:itemDic index:idx++] ;
        
        
        // 点击按钮的回调
        __weak typeof(self) weakSelf = self ;
        self.optionBar.barItem.titleBtnSelectBlock = ^(NSInteger index){
            if([weakSelf.delegate respondsToSelector:@selector(DidSelectIndexOptionItem:)]){
                [weakSelf.delegate DidSelectIndexOptionItem:index] ;
            }
            [UIView animateWithDuration:0.2 animations:^{
                [weakSelf.optionBar offestX:(index * CGRectGetWidth(self.optionBar.scrollBar.frame))];
                weakSelf.scrollView.contentOffset = CGPointMake(index * YANWIDTH,0) ;
            }] ;
            for(int i=0 ; i<yanOptionItemsCount ;i++){
                yan_optionBarItem *item = weakSelf.optionBar.subviews[i] ;
                if( i==index ){
                    item.titleBtn.selected = YES ;
                    selectedIndex = index ;
                }
                else{
                    item.titleBtn.selected = NO ;
                }
            }
        } ;
    }
}

#pragma mark - ============== easyload ==============
-(UIScrollView *)scrollView{
    if (_scrollView==nil) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, yanOptionBarHeight + 20, YANWIDTH, YANHEIGHT)] ;
        _scrollView.backgroundColor = [UIColor whiteColor] ;
        _scrollView.contentSize = CGSizeMake(yanOptionItemsCount * YANWIDTH, 0) ;
        _scrollView.pagingEnabled = YES ;
        _scrollView.bounces = NO ;
        _scrollView.delegate = self ;
        [self.view addSubview:_scrollView] ;
    }
    return _scrollView;
}
-(yan_optionBar *)optionBar
{
    if ( !_optionBar) {
        _optionBar = [[yan_optionBar alloc]initWithFrame:CGRectMake(0, 20,YANWIDTH,BARHEIGHT)] ;
        [self.view addSubview:_optionBar] ;
    }
    return _optionBar;
}

#pragma mark -  ============== scrollView delegate ==============
/**
 设置optionBar的scrollbar随着scrollView滚动而滚动
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat multiple = CGRectGetWidth(self.optionBar.scrollBar.frame) / CGRectGetWidth(self.optionBar.frame) ;
    [self.optionBar offestX:(scrollView.contentOffset.x * multiple)];
}

/**
 根据optionBar的scrollBar滑动距离判断滑动停留在哪个页面
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
   
    NSInteger index = (NSInteger)ceil(YANWIDTH / CGRectGetMaxX(self.optionBar.scrollBar.frame)) ;
    if(selectedIndex != (yanOptionItemsCount - index)){
        yan_optionBarItem *selectedItem = self.optionBar.subviews[selectedIndex] ;
            selectedItem.titleBtn.selected = NO ;
    }
    yan_optionBarItem *willSelectItem = self.optionBar.subviews[yanOptionItemsCount - index] ;
    willSelectItem.titleBtn.selected = YES ;
    // 设置按钮为选中状态：
    if ([self.delegate respondsToSelector:@selector(DidscrollToViewController:)]) {
        [self.delegate DidscrollToViewController:_optionViewControllers[yanOptionItemsCount - index]] ;
    }
    selectedIndex = yanOptionItemsCount - index ;
}

@end
