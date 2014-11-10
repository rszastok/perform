//
//  NSDateFormatter+RSPredefinedFormatter.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Helper)
+ (NSDateFormatter *)sharedRssFormatter;
+ (NSDateFormatter *)sharedDateFormatter;
+ (NSDateFormatter *)sharedDateTimeFormatter;
@end
