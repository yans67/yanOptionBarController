//
//  IHSquareViewController.h
//  Inhere
//
//  Created by yans67 on 16/11/8.
//  Copyright © 2016年 minstone. All rights reserved.
//

#import <UIKit/UIKit.h>

@class yan_optionBar ;
@class yan_optionBarItem ;


NS_ASSUME_NONNULL_BEGIN
/**
 协议：选项卡按钮和滑动
 */
@protocol YANOptionControllerDelegate <NSObject>

@optional
- (void)DidSelectIndexOptionItem:(NSInteger)index ;
- (void)DidscrollToViewController:(UIViewController *)viewController;
@end

@interface yan_optionController : UIViewController


@property (weak, nonatomic)id<YANOptionControllerDelegate> delegate ;

- (instancetype )initWithViewControllers:(NSArray<UIViewController *>*)viewControllers optionItemsAttributes:(NSArray<NSDictionary *>*)optionItemsAttributes addTarget:(id)delegate;

@property (strong, nonatomic)yan_optionBar *optionBar ;

NS_ASSUME_NONNULL_END

@end
