//
//  RSChannel+Deserialization.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSChannel.h"

// Element name and attributes for channel.
static NSString *const CHANNEL = @"channel";
static NSString *const CHANNEL_TITLE = @"title";
static NSString *const CHANNEL_DESCRIPTION = @"description";
static NSString *const CHANNEL_LANGUAGE = @"language";
static NSString *const CHANNEL_PUB_DATE = @"pubDate";
static NSString *const CHANNEL_LINK = @"link";
static NSString *const CHANNEL_CATEGORY = @"category";

@interface RSChannel (Deserializer)
- (void)updateValue:(NSString *)value forKey:(NSString *)key;
@end
