//
//  RSRanking+Deserialization.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSRanking.h"

static NSString *const RANKING = @"ranking";
static NSString *const RANKING_RANK = @"rank";
static NSString *const RANKING_LAST_RANK = @"last_rank";
static NSString *const RANKING_ZONE_START = @"zone_start";
static NSString *const RANKING_ZONE_END = @"zone_end";
static NSString *const RANKING_TEAM_ID = @"team_id";
static NSString *const RANKING_CLUB_NAME = @"club_name";
static NSString *const RANKING_COUNTRYCODE = @"countrycode";
static NSString *const RANKING_AREA_ID = @"area_id";
static NSString *const RANKING_MATCHES_TOTAL = @"matches_total";
static NSString *const RANKING_MATCHES_WON = @"matches_won";
static NSString *const RANKING_MATCHES_DRAW = @"matches_draw";
static NSString *const RANKING_MATCHES_LOST = @"matches_lost";
static NSString *const RANKING_GOALS_PRO = @"goals_pro";
static NSString *const RANKING_GOALS_AGAINST = @"goals_against";
static NSString *const RANKING_POINTS = @"points";

@interface RSRanking (Deserialization)
- (void)updateByDictionary:(NSDictionary *)dict;
@end
