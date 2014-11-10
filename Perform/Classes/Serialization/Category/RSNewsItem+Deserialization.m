//
//  RSNewsItem+RSDeserializer.m
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSNewsItem+Deserialization.h"

#import "NSDateFormatter+Helper.h"

@implementation RSNewsItem (Deserializer)

- (void)updateValue:(NSString *)value forKey:(NSString *)key {
    if ([key isEqualToString:ITEM_ID]) {
        self.guid = [value integerValue];
    }
    else if ([key isEqualToString:ITEM_TITLE]) {
        self.title = value;
    }
    else if ([key isEqualToString:ITEM_PUB_DATE]) {
        self.pubDate = [[NSDateFormatter sharedRssFormatter] dateFromString:value];
    }
    else if ([key isEqualToString:ITEM_ENCLOSURE]) {
        // The enclosure is taken in different place method. No action need here.
        // Case is handled only to not show warning on console.
    }
    else if ([key isEqualToString:ITEM_DESCRIPTION]) {
        self.localizedDescription = value;
    }
    else if ([key isEqualToString:ITEM_LINK]) {
        self.link = value;
    }
    else if ([key isEqualToString:ITEM_CATEGORY]) {
        self.category = value;
    }
    else {
        NSAssert(FALSE, ([NSString stringWithFormat:@"Unhandled attribute for NewsItem:%@", key]));
    }
}

@end
