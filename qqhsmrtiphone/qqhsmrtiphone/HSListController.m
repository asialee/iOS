//
//  HSListController.m
//  qqhsmrtiphone
//
//  Created by  李亚洲 on 14-9-20.
//  Copyright (c) 2014年 hstl. All rights reserved.
//

#import "HSListController.h"

@interface HSListController ()

@end

@implementation HSListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.text = [NSString stringWithFormat:@"%d",self.region_id];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (id)initWithRegionId:(int)region_index
{
    self = [super init];
    if(self)
    {
        _region_id = region_index;
    }
    return self;
}

-(void)refresh
{
    
}
@end
