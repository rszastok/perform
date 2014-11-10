//
//  RSStandingsDataSource.m
//  Perform
//
//  Created by Rafał Szastok on 09/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSStandingsDataSource.h"

#import "RSRankingTableViewCell.h"
#import "RSHTTPRequests.h"

@interface RSStandingsDataSource ()
@property (nonatomic) RSCompetition *competition;
@end


@implementation RSStandingsDataSource

- (instancetype)initForTableView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([RSRankingTableViewCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:RSRankingCellIdentifier];
        tableView.tableHeaderView = [RSRankingTableViewCell headerView];
        tableView.dataSource = self;
    }
    return self;
}

#pragma mark - Public methods

- (RACSignal *)fetchData {
    return [[[RSHTTPRequests sharedInstance] requestStandings] doNext:^(id x) {
        self.competition = x;
    }];
}

- (RSRanking *)rankingForIndexPath:(NSIndexPath *)indexPath {
    RSRound *round = [self.competition firstRoundInFirstSeason];
    return round.resultsTable[indexPath.row];
}

- (CGFloat)cellHeight {
    return 40.0;
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RSRankingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RSRankingCellIdentifier forIndexPath:indexPath];
    RSRanking *ranking = [self rankingForIndexPath:indexPath];
    BOOL isEven = indexPath.row % 2 == 0;
    [cell setupWithRanking:ranking isEven:isEven];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    RSRound *round = [self.competition firstRoundInFirstSeason];
    return round.resultsTable.count;
}

@end
