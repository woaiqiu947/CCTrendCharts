//
//  CCDefaultYAxis.m
//  CCTrendCharts
//
//  Created by Cocos on 2019/9/6.
//  Copyright © 2019 Cocos. All rights reserved.
//

#import "CCDefaultYAxis.h"

@implementation CCDefaultYAxis

@synthesize font = _font;
@synthesize labelColor = _labelColor;

@synthesize axisColor = _axisColor;
@synthesize axisLineWidth = _axisLineWidth;
//@synthesize labelCount = _labelCount;
//@synthesize labelMaxLine = _labelMaxLine;
@synthesize xLabelOffset = _xLabelOffset;
@synthesize yLabelOffset = _yLabelOffset;


- (instancetype)init {
    self = [super init];
    if (self) {
        _axisColor = UIColor.redColor;
        _axisLineWidth = 1.f;
    }
    return self;
}

- (void)setAxisMinValue:(CGFloat)axisMinValue {
    self.customValue = YES;
    _axisMinValue = axisMinValue;
}


- (void)setAxisMaxValue:(CGFloat)axisMaxValue {
    self.customValue = YES;
    _axisMaxValue = axisMaxValue;
}

- (NSInteger)entityCount {
    return _entities.count;
}

//- (void)setLabelCount:(NSInteger)labelCount {
//    if (labelCount > 25) {
//        _labelCount = 25;
//    }else if (labelCount < 2) {
//        _labelCount = 2;
//    }else {
//        _labelCount = labelCount;
//    }
//}


@end
