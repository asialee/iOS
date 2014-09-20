//
//  SyTabBarItem.h
//  SyFramework
//
//  Created by dadai on 13-12-18.
//  Copyright (c) 2013年 dadai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SyTabBarItem : UIView

@property (nonatomic,assign, getter = isSelected) BOOL selected;


- (void)setTitle:(NSString *)aTitle icon:(NSString *)aIcon highlight:(NSString *)aHighlight;

- (void)addTarget:(id)aTarget action:(SEL)aAction;

@end
