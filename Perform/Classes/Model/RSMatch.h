//
//  RSMarch.h
//  Perform
//
//  Created by Rafał Szastok on 07/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSMatchTeam.h"
#import "RSMatchTeamResult.h"

@interface RSMatch : NSObject
@property (nonatomic) int64_t matchId;
@property (nonatomic) NSDate *dateAndTimeUtc;
@property (nonatomic) NSDate *dateAndTimeLondon;
@property (nonatomic) RSMatchTeam *teamA;
@property (nonatomic) RSMatchTeam *teamB;
@property (nonatomic) NSString *status;
@property (nonatomic) NSInteger gameWeek;
@property (nonatomic) NSString *winner;
@property (nonatomic) RSMatchTeamResult *teamAResult;
@property (nonatomic) RSMatchTeamResult *teamBResult;
@property (nonatomic) NSDate *lastUpdated;
@end
