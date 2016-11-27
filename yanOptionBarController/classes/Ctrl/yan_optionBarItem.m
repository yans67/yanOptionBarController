
//  yan_optionBarButtonItem.m
//  SelectionController
//
//  Created by yans67 on 16/11/16.
//  Copyright © 2016年 Minstone. All rights reserved.
//

#import "yan_optionBarItem.h"

NSString *const yanOptionItemTitle = @"yanOptionItemTitle";

NSString *const yanOptionItemTitleNormalColor = @"yanOptionItemTitleNormalColor";
NSString *const yanOptionItemTitleSelectedColor = @"yanOptionItemTitleSelectedColor" ;

NSString *const yanOptionItemImage = @"yanOptionItemImage";
NSString *const yanOptionItemSelectedImage = @"yanOptionItemSelectedImage";

NSString *const yanOptionItemScrollBarColor = @"yanOptionItemScrollBarColor" ;

CGFloat yanOptionBarHeight = 44.0f ;
CGFloat yanScrollBarHeight = 2.0f ;
NSUInteger yanOptionItemsCount = 0.0f ;
CGFloat yanOptionItemsWidth = 0.0f ;

@interface yan_optionBarItem()

@end

@implementation yan_optionBarItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleBtn] ;
    }
    return self;
}

- (void)setNeedsLayout{
    [super setNeedsLayout] ;
    _titleBtn.frame = CGRectMake(0, 0, self.frame.size.width, yanOptionBarHeight - yanScrollBarHeight) ;
}

-(UIButton *)titleBtn{
    if (_titleBtn==nil) {
        _titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, yanOptionBarHeight - yanScrollBarHeight)] ;
        [_titleBtn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside] ;
    }
    return _titleBtn ;
}
-(void)configState{
    _titleBtn.highlighted = !_titleBtn.highlighted ;
    _titleBtn.selected = !_titleBtn.selected ;
    
}
-(void)btnAction{
    self.titleBtnSelectBlock(_itemIndex) ;
}

@end
