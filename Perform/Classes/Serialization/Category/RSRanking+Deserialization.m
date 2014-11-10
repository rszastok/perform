//
//  RSRanking+Deserialization.m
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSRanking+Deserialization.h"

@implementation RSRanking (Deserialization)

- (void)updateByDictionary:(NSDictionary *)dict {
    
    for (NSString *key in [dict allKeys]) {
        if ([key isEqualToString:RANKING_RANK]) {
            self.rank = [dict[key] integerValue];
        }
        else if ([key isEqualToString:RANKING_LAST_RANK]) {
            self.lastRank = [dict[key] integerValue];
        }
        else if ([key isEqualToString:RANKING_ZONE_START]) {
            self.zoneStart = dict[key];
        }
        else if ([key isEqualToString:RANKING_ZONE_END]) {
            self.zoneEnd = dict[key];
        }
        else if ([key isEqualToString:RANKING_TEAM_ID]) {
            self.teamId = [dict[key] longLongValue];
        }
        else if ([key isEqualToString:RANKING_CLUB_NAME]) {
            self.clubName = dict[key];
        }
        else if ([key isEqualToString:RANKING_COUNTRYCODE]) {
            self.countryCode = dict[key];
        }
        else if ([key isEqualToString:RANKING_AREA_ID]) {
            self.areaId = [dict[key] longLongValue];
        }
        else if ([key isEqualToString:RANKING_MATCHES_TOTAL]) {
            self.matchesTotal = [dict[key] integerValue];
        }
        else if ([key isEqualToString:RANKING_MATCHES_WON]) {
            self.matchesWon = [dict[key] integerValue];
        }
        else if ([key isEqualToString:RANKING_MATCHES_DRAW]) {
            self.matchesDraw = [dict[key] integerValue];
        }
        else if ([key isEqualToString:RANKING_MATCHES_LOST]) {
            self.matchesLost = [dict[key] integerValue];
        }
        else if ([key isEqualToString:RANKING_GOALS_PRO]) {
            self.goalsPro = [dict[key] integerValue];
        }
        else if ([key isEqualToString:RANKING_GOALS_AGAINST]) {
            self.goalsAgainst = [dict[key] integerValue];
        }
        else if ([key isEqualToString:RANKING_POINTS]) {
            self.points = [dict[key] integerValue];
        }
        else {
            NSAssert(FALSE, @"Unhandled attribute for Group: %@", key);
        }
    }
}

@end
