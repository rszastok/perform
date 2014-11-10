//
//  ThirdViewController.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RSStandingsDataSource.h"

@interface RSStandingsTableViewController : UITableViewController
@property (nonatomic) RSStandingsDataSource *dataSource;
@end
