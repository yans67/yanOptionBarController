//
//  selectionBar.h
//  SelectionController
//
//  Created by yans67 on 16/11/15.
//  Copyright © 2016年 Minstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "yan_optionBarItem.h"


@interface yan_optionBar : UIView

@property (strong, nonatomic)UIView *scrollBar ;
@property (strong, nonatomic)yan_optionBarItem *barItem ;


/**
 x 坐标偏移

 @param offest 偏移值
 */
-(void)offestX:(CGFloat)offest ;



- (void)configOptionBarItemWithDic:(NSDictionary *)Attributes index:(NSInteger)index ;

/**
 配置 scrollbar 的高度和颜色

 @param height 高度
 @param color  颜色
 */
-(void) configScorllBarHeight:(CGFloat )height Color:(UIColor *)color ;

@end


