//
//  SecondViewController.h
//  Perform
//
//  Created by Rafał Szastok on 07/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RSScoreDataSource.h"

@interface RSScoresTableViewController : UITableViewController
@property (nonatomic) RSScoreDataSource *dataSource;
@end

