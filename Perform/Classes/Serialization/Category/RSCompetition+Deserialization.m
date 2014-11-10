//
//  RSCompetition+Deserializer.m
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSCompetition+Deserialization.h"

#import "NSDateFormatter+Helper.h"

@implementation RSCompetition (Deserializer)

- (void)updateByDictionary:(NSDictionary *)dict {
    for (NSString *key in [dict allKeys]) {
        if ([key isEqualToString:COMPETITION_ID]) {
            self.competitionId = [dict[key] longLongValue];
        }
        else if ([key isEqualToString:COMPETITION_NAME]) {
            self.name = dict[key];
        }
        else if ([key isEqualToString:COMPETITION_TEAMTYPE]) {
            self.teamType = dict[key];
        }
        else if ([key isEqualToString:COMPETITION_DISPLAY_ORDER]) {
            self.displayOrder = [dict[key] integerValue];
        }
        else if ([key isEqualToString:COMPETITION_TYPE]) {
            self.type = dict[key];
        }
        else if ([key isEqualToString:COMPETITION_AREA_ID]) {
            self.areadId = [dict[key] longLongValue];
        }
        else if ([key isEqualToString:COMPETITION_AREA_NAME]) {
            self.areaName = dict[key];
        }
        else if ([key isEqualToString:COMPETITION_LAST_UPDATED]) {
            NSDate *date = [[NSDateFormatter sharedDateTimeFormatter] dateFromString:dict[key]];
            self.lastUpdated = date;
        }
        else if ([key isEqualToString:COMPETITION_AREA_SOCCER_TYPE]) {
            self.soccerType = dict[key];
        }
        else {
            NSAssert(FALSE, ([NSString stringWithFormat:@"Unhandled attribute for Competition:%@", key]));
        }
    }
}
@end
