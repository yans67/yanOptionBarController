//
//  selectionBar.m
//  SelectionController
//
//  Created by yans67 on 16/11/15.
//  Copyright © 2016年 Minstone. All rights reserved.
//

#import "yan_optionBar.h"





@implementation yan_optionBar{
    CGFloat originX ;
    UIColor * scrollBarColor ;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)configScorllBarHeight:(CGFloat )height Color:(UIColor *)color{
    yanScrollBarHeight = height;
    // 懒加载设置 scrollBar 的背景颜色并且初始化
    self.scrollBar.backgroundColor = color ;
}

-(void)setNeedsLayout{
    [super setNeedsLayout] ;
    _scrollBar.frame = CGRectMake(0, self.frame.size.height - yanScrollBarHeight, self.frame.size.width/yanOptionItemsCount, yanScrollBarHeight) ;
    for(int i=0 ;i< yanOptionItemsCount ;i++){
        self.subviews[i].frame = CGRectMake(i * (YANWIDTH / yanOptionItemsCount), 0, (YANWIDTH / yanOptionItemsCount), yanOptionBarHeight-yanScrollBarHeight) ;
        [self.subviews[i] setNeedsLayout] ;
    }
}

-(UIView *)scrollBar{
    if (_scrollBar==nil) {
        _scrollBar = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - yanScrollBarHeight, YANWIDTH/yanOptionItemsCount, yanScrollBarHeight)] ;
        originX = 0 ;
        [self addSubview:_scrollBar]; 
    }
    return _scrollBar;

}

-(void)offestX:(CGFloat)offest{
    CGRect rect = self.scrollBar.frame ;
    rect.origin.x = originX + offest ;
    self.scrollBar.frame = rect ;
}

-(void)configOptionBarItemWithDic:(NSDictionary *)Attributes index:(NSInteger)index{
    
    _barItem = [[yan_optionBarItem alloc]initWithFrame:CGRectMake(index * (YANWIDTH / yanOptionItemsCount), 0, (YANWIDTH / yanOptionItemsCount), yanOptionBarHeight-yanScrollBarHeight)] ;
    
    _barItem.itemIndex = index ;
    
    if(index == 0){
        _barItem.titleBtn.selected = YES ;
    }
    if(Attributes[yanOptionItemTitle]){
        [_barItem.titleBtn setTitle:Attributes[yanOptionItemTitle] forState:UIControlStateNormal] ;
        
        if(Attributes[yanOptionItemTitleSelectedColor] == nil){
            [Attributes setValue:[UIColor blackColor] forKey:yanOptionItemTitleSelectedColor] ;
        }
        else if(Attributes[yanOptionItemTitleNormalColor] == nil){
            [Attributes setValue:[UIColor whiteColor] forKey:yanOptionItemTitleNormalColor] ;
        }else{
            [_barItem.titleBtn setTitleColor:Attributes[yanOptionItemTitleSelectedColor] forState:UIControlStateSelected];
            [_barItem.titleBtn setTitleColor:Attributes[yanOptionItemTitleNormalColor] forState:UIControlStateNormal] ;
        }
    }
    if(Attributes[yanOptionItemImage]){
        UIImage *normalImage = [UIImage imageNamed:Attributes[yanOptionItemImage]];
        normalImage = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _barItem.normalImage = normalImage;
    }
    if (Attributes[yanOptionItemSelectedImage]) {
        UIImage *selectedImage = [UIImage imageNamed:Attributes[yanOptionItemSelectedImage]];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _barItem.selectedImage = selectedImage;
    }
    
    [self addSubview:_barItem] ;
}

@end
