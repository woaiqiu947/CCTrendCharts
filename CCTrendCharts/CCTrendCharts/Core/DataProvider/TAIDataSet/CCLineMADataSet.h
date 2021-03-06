//
//  CCLineMADataSet.h
//  CCTrendCharts
//
//  Created by Cocos on 2019/11/29.
//  Copyright © 2019 Cocos. All rights reserved.
//

#import "CCLineChartDataSet.h"
#import "CCProtocolTAIDataSet.h"

#import "CCKLineDataEntity.h"

NS_ASSUME_NONNULL_BEGIN

/// MA指标 (Moving average)
@interface CCLineMADataSet : CCLineChartDataSet <CCProtocolTAIDataSet>

- (instancetype)initWithRawEntities:(NSArray<CCKLineDataEntity *> *)rawEntities N:(id)N NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithEntities:(NSArray<CCKLineDataEntity *> *)entities withName:(nullable CCDataSetName)name NS_UNAVAILABLE;

+ (nullable NSArray<id<CCProtocolChartDataEntityBase>> *)rawEntitiesToEntities:(NSArray<CCKLineDataEntity *> *)rawEntities N:(id)N;

@end

NS_ASSUME_NONNULL_END
