//
//  DTXCPUDataProvider.m
//  DetoxInstruments
//
//  Created by Leo Natan (Wix) on 12/06/2017.
//  Copyright © 2017 Wix. All rights reserved.
//

#import "DTXCPUDataProvider.h"

@implementation DTXCPUDataProvider

- (NSArray<DTXColumnInformation *> *)columns
{
	DTXColumnInformation* info = [DTXColumnInformation new];
	info.title = NSLocalizedString(@"CPU Usage", @"");
	info.minWidth = 55;
	
	return @[info];
}

- (DTXSampleType)sampleType
{
	return DTXSampleTypePerformance;
}

- (NSString*)formattedStringValueForItem:(id)item column:(NSUInteger)column;
{
	return [[NSFormatter dtx_percentFormatter] stringForObjectValue:@([(DTXPerformanceSample*)item cpuUsage])];
}

- (NSColor*)textColorForItem:(id)item
{
	return NSColor.blackColor;
}

- (NSColor*)backgroundRowColorForItem:(id)item
{
	double cpu = [(DTXPerformanceSample*)item cpuUsage];
	double fps = [(DTXPerformanceSample*)item fps];
	
	if(fps <= 30 && cpu >= 0.95)
	{
		return NSColor.warning3Color;
	}
	
	return cpu >= 2.0 ? NSColor.warning3Color : cpu > 1.5 ? NSColor.warning2Color : cpu > 1.0 ? NSColor.warningColor : NSColor.whiteColor;
}

@end
