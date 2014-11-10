//
//  RSScoreDataSource.m
//  Perform
//
//  Created by Rafał Szastok on 09/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSScoreDataSource.h"

#import "RSHTTPRequests.h"
#import "RSMatchesTableViewCell.h"
#import "RSGroup.h"

@interface RSScoreDataSource ()
@property (nonatomic) RSScores *scores;
@property (nonatomic) NSArray *matchesInRound;
@end

@implementation RSScoreDataSource

- (instancetype)initForTableView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([RSMatchesTableViewCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:RSMatchCellIdentifier];
        tableView.dataSource = self;
    }
    return self;
}

#pragma mark - Public methods

- (RACSignal *)fetchData {
    return [[[RSHTTPRequests sharedInstance] requestScores] doNext:^(id x) {
        self.scores = x;
        RSCompetition *competition = [self.scores.competitions firstObject];
        RSRound *round = [competition firstRoundInFirstSeason];
        
        NSMutableArray *allMatches = [NSMutableArray new];
        for (RSGroup *group in round.groups) {
            [allMatches addObjectsFromArray:group.matches];
        }
        self.matchesInRound = allMatches;
    }];
}

- (RSMatch *)matchAtIndexPath:(NSIndexPath *)indexPath {
    return self.matchesInRound[indexPath.row];
}

- (CGFloat)cellHeight {
    return [RSMatchesTableViewCell height];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RSMatchesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RSMatchCellIdentifier forIndexPath:indexPath];
    RSMatch *match = [self matchAtIndexPath:indexPath];
    BOOL isEven = indexPath.row % 2 == 0;
    [cell setupWithMatch:match isEven:isEven];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.matchesInRound.count;
}

@end
