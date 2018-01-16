//
//  WLSegmentBar.m
//  WLSegmentBar_Example
//
//  Created by wlighting on 2018/1/14.
//  Copyright © 2018年 wlighting. All rights reserved.
//

#import "WLSegmentBar.h"

#import "UIView+WLSegmentBarViewFrame.h"

#define kMinMargin 30

@interface WLSegmentBar ()

@property (nonatomic,weak) UIScrollView *contentScrollView;

@property (nonatomic,strong) NSMutableArray *itemButtonS;

@end


@implementation WLSegmentBar

+ (instancetype)segmentBarWithFrame:(CGRect)frame{
    WLSegmentBar *segmentBar = [[WLSegmentBar alloc] initWithFrame:frame];
    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
    [segmentBar addSubview:contentScrollView];
    contentScrollView.showsHorizontalScrollIndicator = NO;
    segmentBar.contentScrollView = contentScrollView;
    
    return segmentBar;
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentScrollView.frame = self.bounds;
    
    CGFloat totalButtonWidth = 0;
    for (UIButton *button in self.itemButtonS) {
        [button sizeToFit];
        totalButtonWidth += button.wl_width;
    }
    
    CGFloat calculateWidth = (self.wl_width - totalButtonWidth)/(self.itemButtonS.count + 1);
    if (calculateWidth < kMinMargin) {
        calculateWidth = kMinMargin;
    }
    
    
    
    
    CGFloat lastX = calculateWidth;
    for (UIButton *button in self.itemButtonS) {
        [button sizeToFit];
        button.wl_y = 0;
        button.wl_x = lastX;
        lastX += (button.wl_width + calculateWidth);
    }
    
    self.contentScrollView.contentSize = CGSizeMake(lastX, self.wl_height);
    
}

- (NSMutableArray *)itemButtonS {
    
    if (_itemButtonS == nil) {
        _itemButtonS = [NSMutableArray array];
    }
    return _itemButtonS;
}

- (void)setItemS:(NSArray<NSString *> *)itemS {
    _itemS = itemS;
    [self.itemButtonS makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.itemButtonS = nil;
    for (NSString *titleStr in itemS) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:titleStr forState:UIControlStateNormal];
        [self.contentScrollView addSubview:button];
        [self.itemButtonS addObject:button];
    }
    
    //手动刷新布局
    [self setNeedsDisplay];
    [self layoutIfNeeded];
    
}










@end
