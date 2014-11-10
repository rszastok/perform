//
//  RSMenuTableViewController.h
//  Perform
//
//  Created by Rafał Szastok on 09/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MyRowEnum) {
    kNewsRow,
    kScoresRow,
    kStandingsRow,
    RowEnumCount
};

@protocol RSMenuTableViewControllerDelegate<NSObject>
- (void)menuController:(id)sender didSelectRow:(MyRowEnum)row;
@end

@interface RSMenuTableViewController : UITableViewController
@property (nonatomic, assign) NSInteger numberOfPages;
@property (nonatomic, weak) id<RSMenuTableViewControllerDelegate> delegate;
@end
