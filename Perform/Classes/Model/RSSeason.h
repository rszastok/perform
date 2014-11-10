//
//  RSSeason.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSRound.h"

@interface RSSeason : NSObject
@property (nonatomic) int64_t seasonId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSDate *startDate;
@property (nonatomic) NSDate *endDate;
@property (nonatomic) NSString *serviceLevel;
@property (nonatomic) NSDate *lastUpdated;
@property (nonatomic) NSArray *rounds;
@property (nonatomic) NSDate *lastPlayedMatchDate;
@end
