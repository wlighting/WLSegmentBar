//
//  WLViewController.m
//  WLSegmentBar
//
//  Created by wlighting on 01/14/2018.
//  Copyright (c) 2018 wlighting. All rights reserved.
//

#import "WLViewController.h"

#import "WLSegmentBarVC.h"

#import "UIView+WLSegmentBarViewFrame.h"


@interface WLViewController ()

@property (nonatomic, weak) WLSegmentBarVC *segmentBarVC;

@end

@implementation WLViewController


- (WLSegmentBarVC *)segmentBarVC {
    
    if (_segmentBarVC == nil) {
        WLSegmentBarVC *segmentBarVC = [[WLSegmentBarVC alloc] init];
        _segmentBarVC = segmentBarVC;
        [self addChildViewController:segmentBarVC];
    }
    return _segmentBarVC;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
  
    self.segmentBarVC.view.frame = self.view.bounds;
    
    [self.view addSubview:self.segmentBarVC.view];
    
    //segmentBar.itemS = @[@"测试1",@"测试2",@"测试3"];
    NSArray *itemS = @[@"测试0",@"测试1",@"测试2"];
    
    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = [UIColor redColor];
    
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor yellowColor];
    
    [self.segmentBarVC setUpWithItems:itemS childVCs:@[vc1,vc2,vc3]];
    
    
}










@end
