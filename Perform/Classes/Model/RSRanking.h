//
//  RSRanking.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSRanking : NSObject
@property (nonatomic) NSInteger rank;
@property (nonatomic) NSInteger lastRank;
@property (nonatomic) NSString *zoneStart;
@property (nonatomic) NSString *zoneEnd;
@property (nonatomic) int64_t teamId;
@property (nonatomic) NSString *clubName;
@property (nonatomic) NSString *countryCode;
@property (nonatomic) int64_t areaId;
@property (nonatomic) NSInteger matchesTotal;
@property (nonatomic) NSInteger matchesWon;
@property (nonatomic) NSInteger matchesDraw;
@property (nonatomic) NSInteger matchesLost;
@property (nonatomic) NSInteger goalsPro;
@property (nonatomic) NSInteger goalsAgainst;
@property (nonatomic) NSInteger points;
@end
