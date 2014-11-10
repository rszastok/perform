//
//  RSTableViewCell.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RSNewsItem.h"

extern NSString *const RSNewsItemCellIdentifier;

@interface RSNewsItemTableViewCell : UITableViewCell
- (void)setupWithNewsItem:(RSNewsItem *)newsItem;
+ (CGFloat)height;
@end
