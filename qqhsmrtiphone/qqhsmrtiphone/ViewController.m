//
//  ViewController.m
//  qqhsmrtiphone
//
//  Created by Wang Hongbo on 9/20/14.
//  Copyright (c) 2014 hstl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //init the sytabbar
    self.tabBar =  [[SyTabBar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 100, self.view.frame.size.width, 100)];
    [self.view addSubview:self.tabBar];
    [self.tabBar setDelegate:self];
    
    
    
    //init the banner
    _banner = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    [_banner setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:_banner];
    
    
    
    //init all the controllers
    self.mainPageController = [[HSMainPageControllerController alloc] init];
    self.listController_mainland = [[HSListController alloc]initWithRegionId:1];
    self.listController_gat = [[HSListController alloc]initWithRegionId:2];
    self.listController_oversea = [[HSListController alloc]initWithRegionId:3];
    self.generalPageController = [[HSGeneralPageController alloc]init];
    
    self.controllerArray = [[NSMutableArray alloc] initWithCapacity:4];
    [self.controllerArray addObject:self.mainPageController];
    [self.controllerArray addObject:self.listController_mainland];
    [self.controllerArray addObject:self.listController_gat];
    [self.controllerArray addObject:self.listController_oversea];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        
        _mainPageController.view.frame = CGRectMake(0, _banner.frame.size.height + _banner.frame.origin.y, self.view.frame.size.width,_tabBar.frame.origin.y - _banner.frame.origin.y - _banner.frame.size.height);
        [self.view addSubview:_mainPageController.view];
    }else{

        _mainPageController.view.frame = CGRectMake(0, _banner.frame.size.height + _banner.frame.origin.y, self.view.frame.size.width, _tabBar.frame.origin.y - _banner.frame.origin.y - _banner.frame.size.height);
        
        [self.view addSubview:_mainPageController.view];
        self.curController = _mainPageController;
    }
    [self.tabBar setSelectedIndex:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - SyTabBarDelegate
-(void)tabBar:(SyTabBar *)tabBar didSelectItem:(SyTabBarItem *)item
{
    if (tabBar.selectedIndex == 4) {
        //收藏页面
        return ;
    }
    
    
    UIViewController *tmpViewController = [self.controllerArray objectAtIndex:tabBar.selectedIndex];
    if (tabBar.selectedIndex == 0) {
        [(HSMainPageControllerController*)tmpViewController refresh];
    }
    else if(1 <= tabBar.selectedIndex && 3 >= tabBar.selectedIndex)
    {
        [(HSListController*)tmpViewController refresh];
    }
    if (self.curController == tmpViewController) {
        return;
    }
    else
    {
        [self.curController removeFromParentViewController];
        self.curController = tmpViewController;
        self.curController.view.frame = CGRectMake(0, _banner.frame.size.height + _banner.frame.origin.y, self.view.frame.size.width, _tabBar.frame.origin.y - _banner.frame.origin.y - _banner.frame.size.height - 10);
        [self.view addSubview:self.curController.view];
    }
    
}
@end
