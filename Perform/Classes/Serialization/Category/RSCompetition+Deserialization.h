//
//  RSCompetition+Deserialization.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSCompetition.h"

// Element name and attributes for competition.
static NSString *const COMPETITION = @"competition";
static NSString *const COMPETITION_ID = @"competition_id";
static NSString *const COMPETITION_NAME = @"name";
static NSString *const COMPETITION_TEAMTYPE = @"teamtype";
static NSString *const COMPETITION_DISPLAY_ORDER = @"display_order";
static NSString *const COMPETITION_TYPE = @"type";
static NSString *const COMPETITION_AREA_ID = @"area_id";
static NSString *const COMPETITION_AREA_NAME = @"area_name";
static NSString *const COMPETITION_LAST_UPDATED = @"last_updated";
static NSString *const COMPETITION_AREA_SOCCER_TYPE = @"soccertype";

@interface RSCompetition (Deserializer)
- (void)updateByDictionary:(NSDictionary *)dict;
@end
