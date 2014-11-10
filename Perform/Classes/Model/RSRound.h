//
//  RSRound.h
//  Perform
//
//  Created by Rafał Szastok on 07/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSRound : NSObject
@property (nonatomic) int64_t roundId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSDate *startDate;
@property (nonatomic) NSDate *endDate;
@property (nonatomic) NSString *type;
@property (nonatomic, getter=hasOutGroupMatches) BOOL outGroupMatches;
@property (nonatomic) NSDate *lastUpdated;
@property (nonatomic) NSString *orderMethod;
@property (nonatomic) NSArray *groups;
@property (nonatomic) NSArray *resultsTable;
@end
