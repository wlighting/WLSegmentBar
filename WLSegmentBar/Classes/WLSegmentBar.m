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

{
    /** 最后一次点击的按钮 */
    UIButton *_preButton;
    
}
/** 内容承载视图 */
@property (nonatomic,weak) UIScrollView *contentScrollView;
/** 添加的按钮数据 */
@property (nonatomic,strong) NSMutableArray <UIButton *>*itemButtonS;
/** 指示器 */
@property (nonatomic,weak) UIView *indicatorView;
/** 选项卡参数配置 */
@property (nonatomic, strong) WLSegmentBarConfig *config;

@end


@implementation WLSegmentBar

+ (instancetype)segmentBarWithFrame:(CGRect)frame{
    WLSegmentBar *segmentBar = [[WLSegmentBar alloc] initWithFrame:frame];

    return segmentBar;
    
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = self.config.segmentBackgroudColor;
    }
    return self;
}


- (void)updateWithConfig: (void(^)(WLSegmentBarConfig *config))configBlock {
    
    if (configBlock) {
        configBlock(self.config);
    }
    
    // 按照当前的 self.config 进行刷新
    self.backgroundColor = self.config.segmentBackgroudColor;
    
    for (UIButton *btn in self.itemButtonS) {
        [btn setTitleColor:self.config.normalTitleColor forState:UIControlStateNormal];
        [btn setTitleColor:self.config.selectedTitleColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.titleFont;
    }
    
    // 指示器
    self.indicatorView.backgroundColor = self.config.indicatorColor;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    // 数据过滤
    if (self.itemS.count == 0 || selectIndex < 0 || selectIndex > self.itemS.count - 1) {
        return;
    }
    _selectIndex = selectIndex;
    UIButton *btn = self.itemButtonS[selectIndex];
    [self titleButtonClicked:btn];
    
}

- (void)setItemS:(NSArray<NSString *> *)itemS {
    _itemS = itemS;
    [self.itemButtonS makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.itemButtonS = nil;
    for (NSString *titleStr in itemS) {
        UIButton *button = [[UIButton alloc] init];
        button.tag = self.itemButtonS.count;
        [button setTitle:titleStr forState:UIControlStateNormal];
        
        [button setTitleColor:self.config.normalTitleColor forState:UIControlStateNormal];
        [button setTitleColor:self.config.selectedTitleColor forState:UIControlStateSelected];
        [button addTarget:self action:@selector(titleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = self.config.titleFont;
        [self.contentScrollView addSubview:button];
        [self.itemButtonS addObject:button];
    }
    
    //手动刷新布局
    [self setNeedsDisplay];
    [self layoutIfNeeded];
    
}


#pragma mark - 按钮点击事件
- (void)titleButtonClicked:(UIButton *)button {
    
    if ([self.delegate respondsToSelector:@selector(segmentBar:didSelectIndex:fromIndex:)]) {
        [self.delegate segmentBar:self didSelectIndex:button.tag fromIndex:_preButton.tag];
    }
    _selectIndex = button.tag;
    
    _preButton.selected = NO;
    button.selected = YES;
    _preButton = button;
    
    CGFloat offset = button.wl_centerX - self.wl_width * 0.5;
    if (offset < 0) {
        offset = 0;
    }
    
    if (offset > self.contentScrollView.contentSize.width - self.wl_width) {
        offset = self.contentScrollView.contentSize.width - self.wl_width;
    }
    [self.contentScrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
    
    
    [UIView animateWithDuration:0.2 animations:^{
        self.indicatorView.wl_width = button.wl_width + self.config.indicatorExtraW * 2;
        self.indicatorView.wl_centerX = button.wl_centerX;
    }];
    
    
    
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
    
    UIButton *btn = self.itemButtonS[self.selectIndex];
    self.indicatorView.wl_width = btn.wl_width + self.config.indicatorExtraW * 2;
    self.indicatorView.wl_centerX = btn.wl_centerX;
    self.indicatorView.wl_height = self.config.indicatorHeight;
    self.indicatorView.wl_y = self.wl_height - self.indicatorView.wl_height;
    
}

- (NSMutableArray<UIButton *> *)itemButtonS {
    
    if (_itemButtonS == nil) {
        _itemButtonS = [NSMutableArray array];
    }
    return _itemButtonS;
}

- (UIView *)indicatorView {
    
    if (_indicatorView == nil) {
        CGFloat height = self.config.indicatorHeight;
        UIView *indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.wl_height - height, 0, height)];
        [self.contentScrollView addSubview:indicatorView];
        indicatorView.backgroundColor = self.config.indicatorColor;
        _indicatorView = indicatorView;
        
    }
    return _indicatorView;
}

- (UIScrollView *)contentScrollView {
    if (!_contentScrollView) {
        UIScrollView *contentScrollView = [[UIScrollView alloc] init];
        [self addSubview:contentScrollView];
        contentScrollView.showsHorizontalScrollIndicator = NO;
        _contentScrollView = contentScrollView;
    }
    return _contentScrollView;
}

- (WLSegmentBarConfig *)config {
    if (!_config) {
        _config = [WLSegmentBarConfig defaultConfig];
    }
    return _config;
}









@end
