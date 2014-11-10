//
//  RSRound+Deserialization.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSRound.h"

// Element name and attributes for score round.
static NSString *const ROUND = @"round";
static NSString *const ROUND_ID = @"round_id";
static NSString *const ROUND_NAME = @"name";
static NSString *const ROUND_START_DATE = @"start_date";
static NSString *const ROUND_END_DATE = @"end_date";
static NSString *const ROUND_TYPE = @"type";
static NSString *const ROUND_GROUPS = @"groups";
static NSString *const ROUND_HAS_OUTGROUP_MATCHES = @"has_outgroup_matches";
static NSString *const ROUND_LAST_UPDATED = @"last_updated";
static NSString *const ROUND_RESULTS_TABLE = @"resultstable";
static NSString *const ROUND_ORDER_METHOD = @"ordermethod";

@interface RSRound (Deserializer)
- (void)updateByDictionary:(NSDictionary *)dict;
@end
