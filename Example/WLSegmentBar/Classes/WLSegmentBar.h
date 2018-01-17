//
//  WLSegmentBar.h
//  WLSegmentBar_Example
//
//  Created by wlighting on 2018/1/14.
//  Copyright © 2018年 wlighting. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WLSegmentBar;

@protocol WLSegmentBarDelegate <NSObject>

- (void)segmentBar:(WLSegmentBar *)segmentBar didSelectIndex:(NSInteger )toIndex fromIndex:(NSInteger )fromIndex;

@end

@interface WLSegmentBar : UIView

+ (instancetype)segmentBarWithFrame:(CGRect)frame;

@property (nonatomic,strong) NSArray <NSString *>*itemS;


@end
