//
//  RSChannel+Deserializer.m
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSChannel+Deserialization.h"

#import "NSDateFormatter+Helper.h"

@implementation RSChannel (Deserializer)

- (void)updateValue:(NSString *)value forKey:(NSString *)key {
    if ([key isEqualToString:CHANNEL_TITLE]) {
        self.title = value;
    }
    else if ([key isEqualToString:CHANNEL_DESCRIPTION]) {
        self.localizedDescription = value;
    }
    else if ([key isEqualToString:CHANNEL_LANGUAGE]) {
        self.language = value;
    }
    else if ([key isEqualToString:CHANNEL_PUB_DATE]) {
        self.pubDate = [[NSDateFormatter sharedRssFormatter] dateFromString:value];
    }
    else if ([key isEqualToString:CHANNEL_LINK]) {
        self.link = value;
    }
    else {
        NSAssert(FALSE, ([NSString stringWithFormat:@"Unhandled attribute for Channel:%@", key]));
    }
}
@end
