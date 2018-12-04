//
//  WLSegmentBarConfig.h
//  WLSegmentBar_Example
//
//  Created by wlighting on 2018/3/3.
//  Copyright © 2018年 wlighting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLSegmentBarConfig : NSObject


/** 默认选项卡配置 */
+ (instancetype)defaultConfig;

/** 选项卡背景颜色 */
@property (nonatomic,strong) UIColor *segmentBackgroudColor;

/** 文字普通颜色 */
@property (nonatomic,strong) UIColor *normalTitleColor;

/** 文字选中颜色 */
@property (nonatomic,strong) UIColor *selectedTitleColor;

/** 选项文字颜色 */
@property (nonatomic,strong) UIColor *indicatorColor;

/** 选项文字大小 */
@property (nonatomic,strong) UIFont *titleFont;

/** 指示器高度 */
@property (nonatomic,assign) CGFloat indicatorHeight;

/** 指示器额外宽度 */
@property (nonatomic,assign) CGFloat indicatorExtraW;



@property (nonatomic,copy,readonly) WLSegmentBarConfig *(^titleNormalColor)(UIColor *color);

@property (nonatomic,copy,readonly) WLSegmentBarConfig *(^titleSelectedColor)(UIColor *color);

@property (nonatomic,copy,readonly) WLSegmentBarConfig *(^barBackgroudColor)(UIColor *color);

@property (nonatomic,copy,readonly) WLSegmentBarConfig *(^bottomIndicatColor)(UIColor *color);

@property (nonatomic,copy,readonly) WLSegmentBarConfig *(^itemTitleFont)(UIFont *font);
/** 指示器高度 */
@property (nonatomic,copy,readonly) WLSegmentBarConfig *(^indicatorH)(CGFloat height);
/** 指示器高度 */
@property (nonatomic,copy,readonly) WLSegmentBarConfig *(^indicatorEW)(CGFloat extraW);



//- (WLSegmentBarConfig *(^)(UIColor *color))titleNormalColor;
//
//- (WLSegmentBarConfig *(^)(UIColor *color))titleSelectedColor;




@end
