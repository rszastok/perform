//
//  RSRound+Deserializer.m
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSRound+Deserialization.h"

#import "NSDateFormatter+Helper.h"

@implementation RSRound (Deserializer)

- (void)updateByDictionary:(NSDictionary *)dict {
    for (NSString *key in [dict allKeys]) {
        if ([key isEqualToString:ROUND_ID]) {
            self.roundId = [dict[key] longLongValue];
        }
        else if ([key isEqualToString:ROUND_NAME]) {
            self.name = dict[key];
        }
        else if ([key isEqualToString:ROUND_START_DATE]) {
            NSDate *date = [[NSDateFormatter sharedDateFormatter] dateFromString:dict[key]];
            self.startDate = date;
        }
        else if ([key isEqualToString:ROUND_END_DATE]) {
            NSDate *date = [[NSDateFormatter sharedDateFormatter] dateFromString:dict[key]];
            self.endDate = date;
        }
        else if ([key isEqualToString:ROUND_TYPE]) {
            self.type = dict[key];
        }
        else if ([key isEqualToString:ROUND_GROUPS]) {
            // Ignore groups key.
        }
        else if ([key isEqualToString:ROUND_HAS_OUTGROUP_MATCHES]) {
            self.outGroupMatches = [dict[key] boolValue];
        }
        else if ([key isEqualToString:ROUND_LAST_UPDATED]) {
            NSDate *date = [[NSDateFormatter sharedDateTimeFormatter] dateFromString:dict[key]];
            self.lastUpdated = date;
        }
        else if ([key isEqualToString:ROUND_ORDER_METHOD]) {
            self.orderMethod = dict[key];
        }
        else {
            NSAssert(FALSE, ([NSString stringWithFormat:@"Unhandled attribute for Round:%@", key]));
        }
    }
}

@end
