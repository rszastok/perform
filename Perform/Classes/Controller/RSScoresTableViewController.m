//
//  SecondViewController.m
//  Perform
//
//  Created by Rafał Szastok on 07/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSScoresTableViewController.h"

#import "SVProgressHUD+RSUserInteraction.h"

static NSTimeInterval const UPDATE_TIME_INTERVAL = 30.0;

@interface RSScoresTableViewController ()
@property (nonatomic) UILabel *dateHeaderTableViewLabel;
@end

@implementation RSScoresTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[RSScoreDataSource alloc] initForTableView:self.tableView];
    [NSTimer scheduledTimerWithTimeInterval:UPDATE_TIME_INTERVAL target:self selector:@selector(updateContent) userInfo:nil repeats:YES];
    [SVProgressHUD showAndLock];
    [[self.dataSource fetchData] subscribeNext:^(RSScores *scores) {
        self.dateHeaderTableViewLabel.text = scores.parameters[@"date"];
        [SVProgressHUD dismissAndUnlock];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    } error:^(NSError *error) {
        [SVProgressHUD dismissAndUnlock];
        [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"Could not complete request", @"")];
    }];
    
    self.tableView.tableFooterView = [UIView new];
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor grayColor];
    headerView.frame = CGRectMake(0, 0, 320.0, 40.0);
    self.dateHeaderTableViewLabel = [UILabel new];
    self.dateHeaderTableViewLabel.frame = CGRectInset(headerView.bounds, 10.0, 2.0);
    self.dateHeaderTableViewLabel.textColor = [UIColor whiteColor];
    [headerView addSubview:self.dateHeaderTableViewLabel];
    self.tableView.tableHeaderView = headerView;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataSource cellHeight];
}

#pragma mark - Private methods

- (void)updateContent {
    [[self.dataSource fetchData] subscribeNext:^(id x) {
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    } error:^(NSError *error) {
       [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"Could not complete request", @"")];
    }];
}

@end
