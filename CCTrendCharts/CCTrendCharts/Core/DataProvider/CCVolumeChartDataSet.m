//
//  CCVolumeChartDataSet.m
//  CCTrendCharts
//
//  Created by Cocos on 2019/11/21.
//  Copyright © 2019 Cocos. All rights reserved.
//

#import "CCVolumeChartDataSet.h"

CCDataSetName const kCCVolumeChartDataSet = @"VolumeChartDataSet";

@implementation CCVolumeChartDataSet
// 子类重新合成变量, 因为这个变量本身是不对外界开放修改的, 只能这么做了
@synthesize maxY = _maxY;
@synthesize minY = _minY;
@synthesize maxX = _maxX;
@synthesize minX = _minX;

- (instancetype)initWithEntities:(NSArray<CCKLineDataEntity *> *)entities withName:(NSString *)name {
    if (name == nil) {
        name = kCCVolumeChartDataSet;
    }
    self = [super initWithEntities:entities withName:name];
    return self;
}

- (instancetype)initWithKLineChartDataSet:(CCKLineChartDataSet *)dataSet {
    // 把 kline dataset 中的实体转成交易量实体
    NSMutableArray *arr = @[].mutableCopy;
    for (id val in dataSet.entities) {
        [arr addObject:[[CCVolumeDataEntity alloc] initWithKLineDataEntity:val]];
    }
    
    self = [self initWithEntities:arr withName:nil];
    
    if (self) {
        
        self.risingColor = [dataSet.risingColor copy];
        self.fallingColor = [dataSet.fallingColor copy];
        self.flatColor = [dataSet.flatColor copy];
        self.highlightColor = [dataSet.highlightColor copy];
        
        self.isRisingFill = dataSet.isRisingFill;
        self.isFallingFill = dataSet.isFallingFill;

    }
    return self;
}

// 这里需要重写, 因为父类修改的是父类的私有变量
- (void)resetValue {
    _maxY = -CGFLOAT_MAX;
    _minY = CGFLOAT_MAX;
    
    _maxX = NSIntegerMin;
    _minX = NSIntegerMax;
}

/// 交易量数据集的最值计算
/// @param start 起点
/// @param end 终点
- (void)calcMinMaxStart:(NSInteger)start End:(NSInteger)end {
    [self resetValue];
    
    for (CCVolumeDataEntity *val in self.entities) {
        if (val.xIndex < start || val.xIndex > end) {
            continue;
        }
        
        if (_minY > val.volume) {
            _minY = val.volume;
        }

        if (_maxY < val.volume) {
            _maxY = val.volume;
        }

        if (_minX > val.xIndex) {
            _minX = val.xIndex;
        }
        if (_maxX < val.xIndex) {
            _maxX = val.xIndex;
        }
    }
}


@end
