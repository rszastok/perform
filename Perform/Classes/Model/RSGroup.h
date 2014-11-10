//
//  RSGroup.h
//  Perform
//
//  Created by Rafał Szastok on 07/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSGroup : NSObject
@property (nonatomic) int64_t groupId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *details;
@property (nonatomic) NSString *winner;
@property (nonatomic) NSDate *lastUpdated;
@property (nonatomic) NSArray *matches;
@end
