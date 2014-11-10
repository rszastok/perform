//
//  RSSeason+Deserializer.m
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSSeason+Deserialization.h"
#import "NSDateFormatter+Helper.h"

@implementation RSSeason (Deserializer)

- (void)updateByDictionary:(NSDictionary *)dict {
    for (NSString *key in [dict allKeys]) {
        if ([key isEqualToString:SEASON_ID]) {
            self.seasonId = [dict[key] longLongValue];
        }
        else if ([key isEqualToString:SEASON_NAME]) {
            self.name = dict[key];
        }
        else if ([key isEqualToString:SEASON_START_DATE]) {
            NSDate *date = [[NSDateFormatter sharedDateFormatter] dateFromString:dict[key]];
            self.startDate = date;
        }
        else if ([key isEqualToString:SEASON_END_DATE]) {
            NSDate *date = [[NSDateFormatter sharedDateFormatter] dateFromString:dict[key]];
            self.endDate = date;
        }
        else if ([key isEqualToString:SEASON_SERVICE_LEVEL]) {
            self.name = dict[key];
        }
        else if ([key isEqualToString:SEASON_LAST_UPDATED]) {
            NSDate *date = [[NSDateFormatter sharedDateTimeFormatter] dateFromString:dict[key]];
            self.lastUpdated = date;
        }
        else if ([key isEqualToString:SEASON_LAST_PLAYED_MATCH_DATE]) {
            NSDate *date = [[NSDateFormatter sharedDateFormatter] dateFromString:dict[key]];
            self.lastPlayedMatchDate = date;
        }
        else {
                        NSAssert(FALSE, ([NSString stringWithFormat:@"Unhandled attribute for Season:%@", key]));
        }
    }
}
@end
