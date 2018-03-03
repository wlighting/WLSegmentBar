//
//  WLSegmentBarConfig.m
//  WLSegmentBar_Example
//
//  Created by wlighting on 2018/3/3.
//  Copyright © 2018年 wlighting. All rights reserved.
//

#import "WLSegmentBarConfig.h"

@implementation WLSegmentBarConfig

+ (instancetype)defaultConfig {
    
    WLSegmentBarConfig *defaultConfig = [[WLSegmentBarConfig alloc] init];
    
    defaultConfig.segmentBackgroudColor = [UIColor clearColor];
    defaultConfig.titleFont = [UIFont systemFontOfSize:15];
    defaultConfig.normalTitleColor = [UIColor blackColor];
    defaultConfig.selectedTitleColor = [UIColor redColor];
    
    defaultConfig.indicatorColor = [UIColor redColor];
    defaultConfig.indicatorHeight = 2;
    defaultConfig.indicatorExtraW = 10;
    
    return defaultConfig;
    
}

- (WLSegmentBarConfig *(^)(UIColor *))titleNormalColor {
    
    return ^(UIColor * color){
        self.normalTitleColor = color;
        return self;
    };
    
}

- (WLSegmentBarConfig *(^)(UIColor *))titleSelectedColor {
    
    return ^(UIColor *color) {
        self.selectedTitleColor = color;
        return self;
    };
    
}

- (WLSegmentBarConfig *(^)(UIColor *))barBackgroudColor {
    
    return ^(UIColor *color) {
        self.segmentBackgroudColor = color;
        return self;
    };
    
}

- (WLSegmentBarConfig *(^)(UIColor *))bottomIndicatColor {
    
    return ^(UIColor *color) {
        self.indicatorColor = color;
        return self;
    };
    
}

- (WLSegmentBarConfig *(^)(UIFont *))itemTitleFont {
    
    return ^(UIFont *font) {
        self.titleFont = font;
        return self;
    };
    
}

- (WLSegmentBarConfig *(^)(CGFloat))indicatorH {
    
    return ^(CGFloat height){
        self.indicatorHeight = height;
        return self;
    };
    
}

- (WLSegmentBarConfig *(^)(CGFloat))indicatorEW {
    
    return ^(CGFloat width){
        self.indicatorExtraW = width;
        return self;
    };
    
}


@end
