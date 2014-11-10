//
//  RSStandingsTableViewCell.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSRanking.h"

extern NSString *const RSRankingCellIdentifier;

@interface RSRankingTableViewCell : UITableViewCell
- (void)setupWithRanking:(RSRanking *)ranking isEven:(BOOL)isEven;
+ (UIView *)headerView;
@end
