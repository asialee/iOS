//
//  SyTabBar.h
//  SyFramework
//
//  Created by dadai on 13-12-18.
//  Copyright (c) 2013年 dadai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SyTabBarItem.h"

@class SyTabBar;

@protocol SyTabBarDelegate <NSObject>

- (void)tabBar:(SyTabBar *)tabBar didSelectItem:(SyTabBarItem *)item;

@end

@interface SyTabBar : UIView

@property (nonatomic, assign)id<SyTabBarDelegate>delegate;
@property (nonatomic,assign) int selectedIndex;
@property (nonatomic,strong) UITabBarItem *messageItem;
@property (nonatomic,strong) UITabBar *messageTabBar;

+ (id)tabWithDelegate:(id<SyTabBarDelegate>)delegate;

@end
