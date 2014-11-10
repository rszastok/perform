//
//  RSSeason+Deserialization.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSSeason.h"

// Element name and attributes for season.
static NSString *const SEASON = @"season";
static NSString *const SEASON_ID = @"season_id";
static NSString *const SEASON_NAME = @"name";
static NSString *const SEASON_START_DATE = @"start_date";
static NSString *const SEASON_END_DATE = @"end_date";
static NSString *const SEASON_SERVICE_LEVEL = @"service_level";
static NSString *const SEASON_LAST_UPDATED = @"last_updated";
static NSString *const SEASON_LAST_PLAYED_MATCH_DATE = @"last_playedmatch_date";

@interface RSSeason (Deserializer)
- (void)updateByDictionary:(NSDictionary *)dict;
@end
