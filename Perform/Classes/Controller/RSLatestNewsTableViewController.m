//
//  FirstViewController.m
//  Perform
//
//  Created by Rafał Szastok on 07/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSLatestNewsTableViewController.h"

#import "RSNewsWebViewController.h"
#import "SVProgressHUD+RSUserInteraction.h"

static NSString *const SHOW_DETAILS_NAVIGATION = @"ShowLink";

@interface RSLatestNewsTableViewController ()
@end

@implementation RSLatestNewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[RSLatestNewsDataSource alloc] initForTableView:self.tableView];
    [SVProgressHUD showAndLock];
    [[self.dataSource fetchData] subscribeNext:^(id x) {
        [SVProgressHUD dismissAndUnlock];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    } error:^(NSError *error) {
        [SVProgressHUD dismissAndUnlock];
        [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"Could not complete request", @"")];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view delegate and data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RSNewsItem *item = [self.dataSource newsItemAtIndexPath:indexPath];
    [self performSegueWithIdentifier:SHOW_DETAILS_NAVIGATION sender:item];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataSource cellHeight];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:SHOW_DETAILS_NAVIGATION]) {
        RSNewsItem *item = sender;
        RSNewsWebViewController *dvc = segue.destinationViewController;
        dvc.url = [NSURL URLWithString:item.link];
    }
}

@end
