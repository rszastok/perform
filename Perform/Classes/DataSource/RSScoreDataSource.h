//
//  RSScoreDataSource.h
//  Perform
//
//  Created by Rafał Szastok on 09/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

#import "RSTableViewDataSource.h"
#import "RSMatch.h"
#import "RSScores.h"

@interface RSScoreDataSource : NSObject<RSTableViewDataSource>

@property (nonatomic, readonly) RSScores *scores;

- (RSMatch *)matchAtIndexPath:(NSIndexPath *)indexPath;

@end
