//
//  NSDateFormatter+RSPredefinedFormatter.m
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "NSDateFormatter+Helper.h"

@implementation NSDateFormatter (Helper)

+ (NSDateFormatter *)sharedRssFormatter {
    static dispatch_once_t onceToken;
    static NSDateFormatter * _instance;
    dispatch_once(&onceToken, ^{
        _instance = [[self class] new];
        [_instance setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss Z"];
        NSLocale *gbLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
        [_instance setLocale:gbLocale];
    });
    return _instance;
}

+ (NSDateFormatter *)sharedDateFormatter {
    static dispatch_once_t onceToken;
    static NSDateFormatter * _instance;
    dispatch_once(&onceToken, ^{
        _instance = [[self class] new];
        [_instance setDateFormat:@"yyyy-MM-dd"];
        NSLocale *gbLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
        [_instance setLocale:gbLocale];
    });
    return _instance;
}

+ (NSDateFormatter *)sharedDateTimeFormatter {
    static dispatch_once_t onceToken;
    static NSDateFormatter * _instance;
    dispatch_once(&onceToken, ^{
        _instance = [[self class] new];
        [_instance setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSLocale *gbLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
        [_instance setLocale:gbLocale];
    });
    return _instance;
}

@end
