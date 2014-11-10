//
//  RSScoresTableViewCell.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RSMatch.h"

extern NSString *const RSMatchCellIdentifier;

@interface RSMatchesTableViewCell : UITableViewCell
- (void)setupWithMatch:(RSMatch *)match isEven:(BOOL)isEven;
+ (CGFloat)height;
@end
