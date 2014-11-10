//
//  RSNews.h
//  Perform
//
//  Created by Rafał Szastok on 07/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RSNewsItem.h"

@interface RSChannel : NSObject
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *localizedDescription;
@property (nonatomic) NSString *language;
@property (nonatomic) NSDate *pubDate;
@property (nonatomic) NSString *link;
@property (nonatomic) NSSet *categories;
@property (nonatomic) NSArray *items;
@end
