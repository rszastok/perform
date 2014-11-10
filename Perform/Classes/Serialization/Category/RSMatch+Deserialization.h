//
//  RSMatch+Deserialization.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSMatch.h"

// Element name and attributes for match.
static NSString *const MATCH = @"match";
static NSString *const MATCH_ID = @"match_id";
static NSString *const MATCH_DATE_UTC = @"date_utc";
static NSString *const MATCH_TIME_UTC = @"time_utc";
static NSString *const MATCH_DATE_LONDON = @"date_london";
static NSString *const MATCH_TIME_LONDON = @"time_london";
static NSString *const MATCH_TEAM_A_ID = @"team_A_id";
static NSString *const MATCH_TEAM_A_NAME = @"team_A_name";
static NSString *const MATCH_TEAM_A_COUNTRY = @"team_A_country";
static NSString *const MATCH_TEAM_B_ID = @"team_B_id";
static NSString *const MATCH_TEAM_B_NAME = @"team_B_name";
static NSString *const MATCH_TEAM_B_COUNTRY = @"team_B_country";
static NSString *const MATCH_STATUS = @"status";
static NSString *const MATCH_GAMEWEEK = @"gameweek";
static NSString *const MATCH_WINNER = @"winner";
static NSString *const MATCH_FS_A = @"fs_A";
static NSString *const MATCH_FS_B = @"fs_B";
static NSString *const MATCH_HTS_A = @"hts_A";
static NSString *const MATCH_HTS_B = @"hts_B";
static NSString *const MATCH_ETS_A = @"ets_A";
static NSString *const MATCH_ETS_B = @"ets_B";
static NSString *const MATCH_PS_A = @"ps_A";
static NSString *const MATCH_PS_B = @"ps_B";
static NSString *const MATCH_LAST_UPDATED = @"last_updated";

@interface RSMatch (Deserializer)
- (void)updateByDictionary:(NSDictionary *)dict;
@end
