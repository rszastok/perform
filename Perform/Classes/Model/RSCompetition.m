//
//  RSCompetition.m
//  Perform
//
//  Created by Rafał Szastok on 07/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSCompetition.h"
#import "RSSeason.h"

@implementation RSCompetition

- (RSRound *)firstRoundInFirstSeason {
    RSSeason *season = [self.seasons firstObject];
    return [season.rounds firstObject];
}

@end
