//
//  RSStandingsDataSource.h
//  Perform
//
//  Created by Rafał Szastok on 09/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

#import "RSTableViewDataSource.h"
#import "RSRanking.h"
#import "RSCompetition.h"

@interface RSStandingsDataSource : NSObject<RSTableViewDataSource>

@property (nonatomic, readonly) RSCompetition *competition;

- (RSRanking *)rankingForIndexPath:(NSIndexPath *)indexPath;

@end
