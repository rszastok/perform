//
//  RSMenuTableViewController.m
//  Perform
//
//  Created by Rafał Szastok on 09/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSMenuTableViewController.h"

#import "RSMenuTableViewCell.h"

@implementation RSMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([RSMenuTableViewCell class]) bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:RSMenuCellIdentifier];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return RowEnumCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RSMenuCellIdentifier forIndexPath:indexPath];
    switch (indexPath.row) {
        case kNewsRow:
            cell.textLabel.text = NSLocalizedString(@"News", @"");
            break;
        case kScoresRow:
            cell.textLabel.text = NSLocalizedString(@"Scores", @"");
            break;
        case kStandingsRow:
            cell.textLabel.text = NSLocalizedString(@"Standings", @"");
            break;
        default:
            NSAssert(FALSE, @"Unknown section");
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate menuController:self didSelectRow:indexPath.row];
}

@end
