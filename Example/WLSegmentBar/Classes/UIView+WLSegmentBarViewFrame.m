//
//  UIView+WLSegmentBarViewFrame.m
//  WLSegmentBar_Example
//
//  Created by wlighting on 2018/1/17.
//  Copyright © 2018年 wlighting. All rights reserved.
//

#import "UIView+WLSegmentBarViewFrame.h"

@implementation UIView (WLSegmentBarViewFrame)

- (CGFloat)wl_centerX{
    
    return self.center.x;
    
}
- (void)setWl_centerX:(CGFloat)wl_centerX{
    
    CGPoint temCenter = self.center;
    temCenter.x =wl_centerX;
    self.center = temCenter;
    
}

- (CGFloat)wl_centerY{
    
    return self.center.y;
    
}
- (void)setWl_centerY:(CGFloat)wl_centerY{
    
    CGPoint temCenter = self.center;
    temCenter.y =wl_centerY;
    self.center = temCenter;
    
}

- (CGFloat)wl_x{
    
    return self.frame.origin.x;
}

- (void)setWl_x:(CGFloat)wl_x{
    
    CGRect temFrame = self.frame;
    temFrame.origin.x =wl_x;
    self.frame = temFrame;
    
}

- (CGFloat)wl_y{
    
    return self.frame.origin.y;
}

- (void)setWl_y:(CGFloat)wl_y{
    
    CGRect temFrame = self.frame;
    temFrame.origin.y = wl_y;
    self.frame = temFrame;
    
}
- (CGFloat)wl_height{
    
    return self.frame.size.height;
}

- (void)setWl_height:(CGFloat)wl_height{
    
    CGRect temFrame = self.frame;
    temFrame.size.height = wl_height;
    self.frame = temFrame;
    
}
- (CGFloat)wl_width{
    
    return self.frame.size.width;
}

- (void)setWl_width:(CGFloat)wl_width{
    
    CGRect temFrame = self.frame;
    temFrame.size.width = wl_width;
    self.frame = temFrame;
    
}

@end
