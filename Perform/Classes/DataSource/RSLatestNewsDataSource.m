//
//  RSLatestNewsDataSource.m
//  Perform
//
//  Created by Rafał Szastok on 09/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSLatestNewsDataSource.h"

#import "RSHTTPRequests.h"
#import "RSNewsItemTableViewCell.h"

@interface RSLatestNewsDataSource()
@property (nonatomic) RSChannel *channel;
@end

@implementation RSLatestNewsDataSource

- (instancetype)initForTableView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([RSNewsItemTableViewCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:RSNewsItemCellIdentifier];
        tableView.dataSource = self;
    }
    return self;
}

#pragma mark - Public methods

- (RACSignal *)fetchData {
    return [[[RSHTTPRequests sharedInstance] requestLatestNews] doNext:^(id x) {
        self.channel = x;
    }];
}

- (RSNewsItem *)newsItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.channel.items[indexPath.row];
}

- (CGFloat)cellHeight {
    return [RSNewsItemTableViewCell height];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RSNewsItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RSNewsItemCellIdentifier forIndexPath:indexPath];
    RSNewsItem *item = [self newsItemAtIndexPath:indexPath];
    [cell setupWithNewsItem:item];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.channel.items.count;
}

@end
