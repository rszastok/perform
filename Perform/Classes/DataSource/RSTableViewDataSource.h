//
//  RSDataSource.h
//  Perform
//
//  Created by Rafał Szastok on 09/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RSTableViewDataSource <UITableViewDataSource>

/// Connect table view with data source and reguster custom UITableViewCell.
- (id)initForTableView:(UITableView *)tableView;

/// Using key-value observer library download asynchronously data from the web.
- (RACSignal *)fetchData;

/// @return prefered cell height for custom cell.
- (CGFloat)cellHeight;

@end
