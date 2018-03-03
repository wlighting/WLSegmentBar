//
//  WLSegmentBar.h
//  WLSegmentBar_Example
//
//  Created by wlighting on 2018/1/14.
//  Copyright © 2018年 wlighting. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WLSegmentBarConfig.h"


@class WLSegmentBar;



@protocol WLSegmentBarDelegate <NSObject>

/**
 通知内部点击事件
 @param segmentBar segmentBar
 @param toIndex 选中的索引(从0开始)
 @param fromIndex 上一个索引
 */
- (void)segmentBar:(WLSegmentBar *)segmentBar didSelectIndex:(NSInteger )toIndex fromIndex:(NSInteger )fromIndex;

@end

@interface WLSegmentBar : UIView


/**
 快速创建选项卡
 @param frame frame
 @return 选项卡
 */
+ (instancetype)segmentBarWithFrame:(CGRect)frame;

/** 数据源 */
@property (nonatomic,strong) NSArray <NSString *>*itemS;
/** 代理 */
@property (nonatomic,weak) id <WLSegmentBarDelegate>delegate;
/** 当前选中的索引, 双向设置 */
@property (nonatomic, assign) NSInteger selectIndex;

- (void)updateWithConfig: (void(^)(WLSegmentBarConfig *config))configBlock;






@end
