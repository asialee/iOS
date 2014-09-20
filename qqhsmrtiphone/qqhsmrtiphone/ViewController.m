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
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.text = @"fff";
    [self.view addSubview:label];
    
    self.tabBar =  [[SyTabBar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 100, self.view.frame.size.width, 100)];
    [self.view addSubview:self.tabBar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
