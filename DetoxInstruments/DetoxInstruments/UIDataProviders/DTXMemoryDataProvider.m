//
//  DTXMemoryDataProvider.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 12/06/2017.
//  Copyright © 2017 Wix. All rights reserved.
//

#import "DTXMemoryDataProvider.h"

@implementation DTXMemoryDataProvider

- (NSArray<DTXColumnInformation *> *)columns
{
	DTXColumnInformation* info = [DTXColumnInformation new];
	info.title = NSLocalizedString(@"Memory Usage", @"");
	info.minWidth = 75;
	
	return @[info];
}

- (DTXSampleType)sampleType
{
	return DTXSampleTypePerformance;
}

- (NSString*)formattedStringValueForItem:(id)item column:(NSUInteger)column;
{
	return [[NSFormatter dtx_memoryFormatter] stringForObjectValue:@([(DTXPerformanceSample*)item memoryUsage])];
}

@end
