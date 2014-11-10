//
//  RSCompetition.h
//  Perform
//
//  Created by Rafał Szastok on 07/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RSRound.h"

@interface RSCompetition : NSObject
@property (nonatomic) int64_t competitionId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *teamType;
@property (nonatomic) NSInteger displayOrder;
@property (nonatomic) NSString *type;
@property (nonatomic) int64_t areadId;
@property (nonatomic) NSString *areaName;
@property (nonatomic) NSDate *lastUpdated;
@property (nonatomic) NSString *soccerType;
@property (nonatomic) NSArray *seasons;
- (RSRound *)firstRoundInFirstSeason;
@end
