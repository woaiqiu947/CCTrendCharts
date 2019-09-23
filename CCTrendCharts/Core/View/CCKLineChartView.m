//
//  CCKLineChartView.m
//  CCTrendCharts
//
//  Created by Cocos on 2019/9/6.
//  Copyright © 2019 Cocos. All rights reserved.
//

#import "CCKLineChartView.h"


@interface CCKLineChartView ()

@end

@implementation CCKLineChartView
@synthesize renderer = _renderer;
@synthesize yAxisrenderer = _yAxisrenderer;
@synthesize xAxisrenderer = _xAxisrenderer;
@synthesize data = _data;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.leftAxis = [[CCDefaultYAxis alloc] init];
        self.xAxis = [[CCDefaultXAxis alloc] init];
        
        _yAxisrenderer = [[CCDefaultYAxisRenderer alloc] initWithAxis:self.leftAxis viewHandler:self.viewPixelHandler transform:self.transformer];
        
        _xAxisrenderer = [[CCDefaultXAxisRenderer alloc] initWithAxis:self.xAxis viewHandler:self.viewPixelHandler transform:self.transformer];
        
        _clipEdgeInsets = UIEdgeInsetsMake(30, 30, 30, 30);
        
    }
    return self;
}

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (NSString *)description {
    return [super description];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self updateViewPixelHandler];
}

#pragma mark - Param update
- (void)updateViewPixelHandler {
    self.viewPixelHandler.viewFrame = self.bounds;
    self.viewPixelHandler.contentRect = CGRectClipRectUsingEdge(self.bounds, self.clipEdgeInsets);
}


#pragma mark - Protocol: CCProtocolKLineChartDataProvider

- (CCKLineChartData *)klineChartData {
    return (CCKLineChartData *)_data;
}

- (CGFloat)chartMinX {
    return 0;
}

- (CGFloat)chartMaxX {
    return 0;
}

- (CGFloat)chartMinY {
    return 0;
}

- (CGFloat)chartMaxY {
    return 0;
}

- (NSInteger)lowestVisibleXIndex {
    return 0;
}

- (NSInteger)highestVisibleXIndex {
    return 0;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end