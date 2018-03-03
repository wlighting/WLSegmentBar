//
//  WLSegmentBarVC.h
//  WLSegmentBar_Example
//
//  Created by wlighting on 2018/3/3.
//  Copyright © 2018年 wlighting. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WLSegmentBar.h"

@interface WLSegmentBarVC : UIViewController

@property (nonatomic,weak) WLSegmentBar *segmentBar;

- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs;


@end
