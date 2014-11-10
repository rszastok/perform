//
//  FirstViewController.h
//  Perform
//
//  Created by Rafał Szastok on 07/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RSLatestNewsDataSource.h"

/** 
 Presents latest news on the screen.
 @see RSLatestNews class
 */
@interface RSLatestNewsTableViewController : UITableViewController
@property (nonatomic) RSLatestNewsDataSource *dataSource;
@end

