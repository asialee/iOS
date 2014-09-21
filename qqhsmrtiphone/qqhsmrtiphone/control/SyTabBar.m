//
//  SyTabBar.m
//  SyFramework
//
//  Created by dadai on 13-12-18.
//  Copyright (c) 2013年 dadai. All rights reserved.
//

#import "SyTabBar.h"

#define TABBAR_ITEM_WIDTH 188.0f
#define TABBAR_ITEM_HEIGHT 45.0f
#define TABBAR_ITEM_SPACING 16.0f

@interface SyTabBar ()

@property (nonatomic,retain) NSMutableArray *tabItems;

@end

@implementation SyTabBar

@synthesize delegate = _delegate;
@synthesize selectedIndex = _selectedIndex;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initialize];
        
    }
    return self;
}

- (void)dealloc
{
}

+ (id)tabWithDelegate:(id<SyTabBarDelegate>)delegate
{
    SyTabBar *tabBar = [[[NSBundle mainBundle] loadNibNamed:@"SyTabBar" owner:self options:nil] lastObject];
    
    tabBar.delegate = delegate;
    
    return tabBar;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    
    return self;
}

- (void)initialize
{
    [self setBackgroundColor:[UIColor grayColor]];
    _selectedIndex = -1;
    self.tabItems = [NSMutableArray array];
    
    float topOffset = self.frame.size.height - TABBAR_ITEM_HEIGHT;
    topOffset = 0;

    float itemW = (self.frame.size.width - 4*TABBAR_ITEM_SPACING)/5.0;
    float itemH = self.frame.size.height;
    //first
    SyTabBarItem *tabItem = [[SyTabBarItem alloc] initWithFrame:CGRectMake(0, topOffset, itemW , itemH)] ;
    [tabItem setTitle:@"首页" icon:nil highlight:nil];
    
    [self.tabItems addObject:tabItem];
    [self addSubview:tabItem];
    //tabItem.backgroundColor = [UIColor grayColor];
    
    
    //second
    tabItem = [[SyTabBarItem alloc] initWithFrame:CGRectMake(itemW + TABBAR_ITEM_SPACING, topOffset, itemW , itemH)];
    [tabItem setTitle:@"大陆" icon:nil highlight:nil];
    [self.tabItems addObject:tabItem];
    [self addSubview:tabItem];
    
    

    
    
    //****************************
    [self greatMessageCount:tabItem];
    //****************************
   // tabItem.backgroundColor = [UIColor blackColor];
    //third
    tabItem = [[SyTabBarItem alloc] initWithFrame:CGRectMake((itemW + TABBAR_ITEM_SPACING) * 2, topOffset, itemW , itemH)];
    [tabItem setTitle:@"港澳台" icon:nil highlight:nil];
    [self.tabItems addObject:tabItem];
    [self addSubview:tabItem];
   // tabItem.backgroundColor = [UIColor redColor];
    
    
    
    //fourth
    tabItem = [[SyTabBarItem alloc] initWithFrame:CGRectMake((itemW + TABBAR_ITEM_SPACING) * 3, topOffset, itemW , itemH)];
    [tabItem setTitle:@"海外" icon:nil highlight:nil];
    [self.tabItems addObject:tabItem];
    [self addSubview:tabItem];
//tabItem.backgroundColor = [UIColor orangeColor];
    
    //fourth
    tabItem = [[SyTabBarItem alloc] initWithFrame:CGRectMake((itemW + TABBAR_ITEM_SPACING) * 4, topOffset, itemW , itemH)];
    [tabItem setTitle:@"收藏" icon:nil highlight:nil];
    [self.tabItems addObject:tabItem];
    [self addSubview:tabItem];
    //tabItem.backgroundColor = [UIColor orangeColor];
    
    for (SyTabBarItem *item in self.tabItems) {
        [item addTarget:self action:@selector(onTabItemClick:)];
    }
    
}

- (void)onTabItemClick:(id)sender
{
    int idx = [self.tabItems indexOfObject:sender];
    
    self.selectedIndex = idx;
}

- (void)setSelectedIndex:(int)selectedIndex
{
    if (selectedIndex != _selectedIndex) {
        SyTabBarItem *item = nil;
        
        if (_selectedIndex >=0) {
            item = [self.tabItems objectAtIndex:_selectedIndex];
            item.selected = NO;
        }
        
        _selectedIndex = selectedIndex;
        
        item = [self.tabItems objectAtIndex:_selectedIndex];
        item.selected = YES;
    }
    
    
    SyTabBarItem *item = [self.tabItems objectAtIndex:_selectedIndex];
    if (self.delegate) {
        [self.delegate tabBar:self didSelectItem:item];
    }
}

- (void) greatMessageCount:(UIView *)sView
{
    
    UITabBar *tabBar = [[UITabBar alloc]initWithFrame:CGRectMake(30,0,0,0)];
    UITabBarItem *barItem = [[UITabBarItem alloc]initWithTitle:nil image:nil tag:0];
    NSArray *item = [NSArray arrayWithObjects:barItem, nil];
    tabBar.items = item;
    
    [sView addSubview:tabBar];
    self.messageItem = barItem;
    self.messageItem.badgeValue = @"33";
    self.messageTabBar = tabBar;
    self.messageTabBar.hidden = YES;
}

@end
