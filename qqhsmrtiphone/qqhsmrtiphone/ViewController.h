//
//  ViewController.h
//  qqhsmrtiphone
//
//  Created by Wang Hongbo on 9/20/14.
//  Copyright (c) 2014 hstl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SyTabBar.h"
#import "HSMainPageControllerController.h"
#import "HSListController.h"
#import "HSGeneralPageController.h"

@interface ViewController : UIViewController<SyTabBarDelegate>
@property(nonatomic,strong) SyTabBar *tabBar;
@property(nonatomic,strong) UIView *banner;
@property(nonatomic,strong) NSMutableArray *bannerImageArray;


@property(nonatomic,strong) HSMainPageControllerController *mainPageController;
@property(nonatomic,strong) HSListController *listController_mainland;
@property(nonatomic,strong) HSListController *listController_gat;
@property(nonatomic,strong) HSListController *listController_oversea;
@property(nonatomic,strong) HSGeneralPageController *generalPageController;
@property(nonatomic,assign) UIViewController *curController;
@property(nonatomic,strong) NSMutableArray *controllerArray;

@end

