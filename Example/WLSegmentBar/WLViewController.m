//
//  WLViewController.m
//  WLSegmentBar
//
//  Created by wlighting on 01/14/2018.
//  Copyright (c) 2018 wlighting. All rights reserved.
//

#import "WLViewController.h"

#import "WLSegmentBar.h"

#import "UIView+WLSegmentBarViewFrame.h"


@interface WLViewController ()

@end

@implementation WLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    WLSegmentBar *segmentBar = [WLSegmentBar segmentBarWithFrame:CGRectMake(0, 64, self.view.wl_width, 50)];
    //segmentBar.itemS = @[@"测试1",@"测试2",@"测试3"];
    segmentBar.itemS = @[@"测试0",@"测试1",@"测试2",@"测试3",@"测试4",@"测试5",@"测试6",@"测试7",@"测试8"];
    segmentBar.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:segmentBar];
    
    
    
}










@end
