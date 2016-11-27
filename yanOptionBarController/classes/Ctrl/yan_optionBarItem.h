//
//  yan_optionBarButtonItem.h
//  SelectionController
//
//  Created by yans67 on 16/11/16.
//  Copyright © 2016年 Minstone. All rights reserved.
//

#import <UIKit/UIKit.h>


#define YANSCREAN [UIScreen mainScreen].bounds
#define YANWIDTH [UIScreen mainScreen].bounds.size.width
#define YANHEIGHT [UIScreen mainScreen].bounds.size.height




NS_ASSUME_NONNULL_BEGIN




FOUNDATION_EXTERN NSString *  const yanOptionItemTitle ;

FOUNDATION_EXTERN NSString * const yanOptionItemTitleNormalColor ;
FOUNDATION_EXTERN NSString * const yanOptionItemTitleSelectedColor ;

FOUNDATION_EXTERN NSString * const yanOptionItemImage ;
FOUNDATION_EXTERN NSString * const yanOptionItemSelectedImage ;

FOUNDATION_EXTERN NSString * const yanOptionItemScrollBarColor ;

FOUNDATION_EXTERN NSUInteger yanOptionItemsCount;
FOUNDATION_EXTERN CGFloat yanOptionItemsWidth;
FOUNDATION_EXTERN CGFloat yanScrollBarHeight ;
FOUNDATION_EXTERN CGFloat yanOptionBarHeight ;

typedef void(^titleBtnBlock)(NSInteger index) ;



@interface yan_optionBarItem : UIView



@property (copy, nonatomic)titleBtnBlock titleBtnSelectBlock ;

//@property(nonatomic, weak) id<YANOptionItemDelegate> delegate;
@property (strong, nonatomic)UIImage *normalImage ;
@property (strong, nonatomic)UIImage *selectedImage ;

@property (strong, nonatomic)UIButton *titleBtn ;

@property (assign, nonatomic)NSInteger itemIndex ;

-(void)configState ;

NS_ASSUME_NONNULL_END



@end
