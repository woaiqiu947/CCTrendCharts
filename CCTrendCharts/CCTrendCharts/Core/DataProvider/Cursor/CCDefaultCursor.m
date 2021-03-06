//
//  CCDefaultCursor.m
//  CCTrendCharts
//
//  Created by Cocos on 2019/11/5.
//  Copyright © 2019 Cocos. All rights reserved.
//

#import "CCDefaultCursor.h"

@implementation CCDefaultCursor
@synthesize lineWidth       = _lineWidth;
@synthesize lineDashPhase   = _lineDashPhase;
@synthesize lineDashLengths = _lineDashLengths;
@synthesize lineColor       = _lineColor;
@synthesize lineCap         = _lineCap;
@synthesize font = _font;
@synthesize labelColor      = _labelColor;
@synthesize impactFeedback  = _impactFeedback;
@synthesize intensity       = _intensity;
@synthesize yAxisYLabelOffset = _yAxisYLabelOffset;
@synthesize xAxisYLabelOffset = _xAxisYLabelOffset;

- (instancetype)init {
    self = [super init];
    if (self) {
        _lineWidth     = 1.f;
        _lineColor     = [UIColor.whiteColor colorWithAlphaComponent:0.5];
        _font          = [UIFont systemFontOfSize:10];
        _lineCap       = kCGLineCapRound;
        _labelColor    = UIColor.whiteColor;
        _lineDashPhase = 0.f;
        _yAxisYLabelOffset = _xAxisYLabelOffset = 0.f;

        if (@available(iOS 13.0, *)) {
            _impactFeedback = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
        } else {
            if (@available(iOS 10.0, *)) {
                _impactFeedback = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
            } else {
                // Fallback on earlier versions
            }
        }
        _intensity = 0.5;
    }
    return self;
}

@end
