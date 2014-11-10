//
//  RSNewsItem.h
//  Perform
//
//  Created by Rafał Szastok on 07/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSNewsItem : NSObject
@property (nonatomic) int64_t guid;
@property (nonatomic) NSString *title;
@property (nonatomic) NSDate *pubDate;
@property (nonatomic) NSURL *enclosureUrl;
@property (nonatomic) NSString *localizedDescription;
@property (nonatomic) NSString *link;
@property (nonatomic) NSString *category;
@end
