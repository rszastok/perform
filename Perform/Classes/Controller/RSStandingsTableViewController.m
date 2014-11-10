//
//  ThirdViewController.m
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSStandingsTableViewController.h"

#import "SVProgressHUD+RSUserInteraction.h"

@interface RSStandingsTableViewController()
@end


@implementation RSStandingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[RSStandingsDataSource alloc] initForTableView:self.tableView];
    [[self.dataSource fetchData] subscribeNext:^(id x) {
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
        [SVProgressHUD dismissAndUnlock];
    } error:^(NSError *error) {
        [SVProgressHUD dismissAndUnlock];
        [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"Could not complete request", @"")];
    }];
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataSource cellHeight];
}

@end
