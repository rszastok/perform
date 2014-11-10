//
//  RSMatch+Deserializer.m
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSMatch+Deserialization.h"

#import "NSDateFormatter+Helper.h"

@implementation RSMatch (Deserializer)

- (void)updateByDictionary:(NSDictionary *)dict {
    RSMatchTeam *matchTeamA = [RSMatchTeam new];
    RSMatchTeam *matchTeamB = [RSMatchTeam new];
    RSMatchTeamResult *matchResultTeamA = [RSMatchTeamResult new];
    RSMatchTeamResult *matchResultTeamB = [RSMatchTeamResult new];
    NSString *utcTimeStr;
    NSString *utcDateStr;
    NSString *londonTimeStr;
    NSString *londonDateStr;
    
    for (NSString *key in [dict allKeys]) {
        if ([key isEqualToString:MATCH_ID]) {
            self.matchId = [dict[key] longLongValue];
        }
        else if ([key isEqualToString:MATCH_DATE_UTC]) {
            utcDateStr = dict[key];
        }
        else if ([key isEqualToString:MATCH_TIME_UTC]) {
            utcTimeStr = dict[key];
        }
        else if ([key isEqualToString:MATCH_DATE_LONDON]) {
            londonDateStr = dict[key];            }
        else if ([key isEqualToString:MATCH_TIME_LONDON]) {
            londonTimeStr = dict[key];
        }
        else if ([key isEqualToString:MATCH_TEAM_A_ID]) {
            matchTeamA.matchTeamId = [dict[key] longLongValue];
        }
        else if ([key isEqualToString:MATCH_TEAM_A_NAME]) {
            matchTeamA.name = dict[key];
        }
        else if ([key isEqualToString:MATCH_TEAM_A_COUNTRY]) {
            matchTeamA.country = dict[key];
        }
        else if ([key isEqualToString:MATCH_TEAM_B_ID]) {
            matchTeamB.matchTeamId = [dict[key] longLongValue];
        }
        else if ([key isEqualToString:MATCH_TEAM_B_NAME]) {
            matchTeamB.name = dict[key];
        }
        else if ([key isEqualToString:MATCH_TEAM_B_COUNTRY]) {
            matchTeamB.country = dict[key];
        }
        else if ([key isEqualToString:MATCH_STATUS]) {
            self.status = dict[key];
        }
        else if ([key isEqualToString:MATCH_GAMEWEEK]) {
            self.gameWeek = [dict[key] integerValue];
        }
        else if ([key isEqualToString:MATCH_WINNER]) {
            self.winner = dict[key];
        }
        else if ([key isEqualToString:MATCH_FS_A]) {
            matchResultTeamA.fs = [dict[key] integerValue];
        }
        else if ([key isEqualToString:MATCH_FS_B]) {
            matchResultTeamB.fs = [dict[key] integerValue];
        }
        else if ([key isEqualToString:MATCH_HTS_A]) {
            matchResultTeamA.hts = [dict[key] integerValue];
        }
        else if ([key isEqualToString:MATCH_HTS_B]) {
            matchResultTeamB.hts = [dict[key] integerValue];
        }
        else if ([key isEqualToString:MATCH_ETS_A]) {
            matchResultTeamA.ets = [dict[key] integerValue];
        }
        else if ([key isEqualToString:MATCH_ETS_B]) {
            matchResultTeamB.ets = [dict[key] integerValue];
        }
        else if ([key isEqualToString:MATCH_PS_A]) {
            matchResultTeamA.ps = [dict[key] integerValue];
        }
        else if ([key isEqualToString:MATCH_PS_B]) {
            matchResultTeamB.ps = [dict[key] integerValue];
        }
        else if ([key isEqualToString:MATCH_LAST_UPDATED]) {
            NSDate *date = [[NSDateFormatter sharedDateFormatter] dateFromString:dict[key]];
            self.lastUpdated = date;
        }
        else {
            NSAssert(FALSE, ([NSString stringWithFormat:@"Unhandled attribute for Match: %@", key]));
        }
    }
    self.teamA = matchTeamA;
    self.teamB = matchTeamB;
    self.teamAResult = matchResultTeamA;
    self.teamBResult = matchResultTeamB;
    NSString *timeDateUtcStr = [NSString stringWithFormat:@"%@ %@", utcDateStr, utcTimeStr];
    self.dateAndTimeUtc = [[NSDateFormatter sharedDateTimeFormatter] dateFromString:timeDateUtcStr];
    NSString *timeDateLondonStr = [NSString stringWithFormat:@"%@ %@", londonDateStr, londonTimeStr];
    self.dateAndTimeLondon = [[NSDateFormatter sharedDateTimeFormatter] dateFromString:timeDateLondonStr];
}
@end
