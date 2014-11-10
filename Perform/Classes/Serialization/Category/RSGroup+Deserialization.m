//
//  RSGroup+Deserializer.m
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSGroup+Deserialization.h"

#import "NSDateFormatter+Helper.h"

@implementation RSGroup (Deserializer)

- (void)updateByDictionary:(NSDictionary *)dict {
    
    for (NSString *key in [dict allKeys]) {
        if ([key isEqualToString:GROUP_ID]) {
            self.groupId = [dict[key] longLongValue];
        }
        else if ([key isEqualToString:GROUP_NAME]) {
            self.name = dict[key];
        }
        else if ([key isEqualToString:GROUP_DETAILS]) {
            self.details = dict[key];
        }
        else if ([key isEqualToString:GROUP_WINNER]) {
            self.winner = dict[key];
        }
        else if ([key isEqualToString:GROUP_LAST_UPDATED]) {
            NSDate *date = [[NSDateFormatter sharedDateTimeFormatter] dateFromString:dict[key]];
            self.lastUpdated = date;
        }
        else {
            NSAssert(FALSE, ([NSString stringWithFormat:@"Unhandled attribute for Group:%@", key]));
        }
    }
}

@end
