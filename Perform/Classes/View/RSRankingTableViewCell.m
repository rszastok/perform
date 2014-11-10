//
//  RSStandingsTableViewCell.m
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSRankingTableViewCell.h"

NSString *const RSRankingCellIdentifier = @"RankingCell";
int32_t const NUMBER_OF_STATISTICS = 6;

@interface RSRankingTableViewCell ()
@property (strong, nonatomic) IBOutlet UILabel *rankLabel;
@property (strong, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *proLabel;
@property (strong, nonatomic) IBOutlet UILabel *wonLabel;
@property (strong, nonatomic) IBOutlet UILabel *drawLabel;
@property (strong, nonatomic) IBOutlet UILabel *lostLabel;
@property (strong, nonatomic) IBOutlet UILabel *matchesTotalLabel;
@property (strong, nonatomic) IBOutlet UILabel *pointsLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *rankLabelWidthConstraint;
@property (nonatomic) NSArray *statisticLabels;
@end

@implementation RSRankingTableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Public methods

- (void)setupWithRanking:(RSRanking *)ranking isEven:(BOOL)isEven {
    self.rankLabel.text = [NSString stringWithFormat:@"%02d", ranking.rank];
    NSInteger rankingDifference = ranking.lastRank - ranking.rank;
    if (rankingDifference < 0) {
        // Dark red color.
        self.rankLabel.textColor = [UIColor colorWithRed:0.8 green:0.0 blue:0.0 alpha:1.0];
    }
    else if (rankingDifference == 0) {
        self.rankLabel.textColor = [UIColor darkGrayColor];
    }
    else { // > 0
        // Dark green color.
        self.rankLabel.textColor = [UIColor colorWithRed:0.0 green:0.8 blue:0.0 alpha:1.0];
    }
    
    self.teamNameLabel.text = [NSString stringWithFormat:@"%@ (%+d)", ranking.clubName, rankingDifference];
    self.proLabel.text = [@(ranking.goalsPro) stringValue];
    self.wonLabel.text = [@(ranking.matchesWon) stringValue];
    self.drawLabel.text = [@(ranking.matchesDraw) stringValue];
    self.lostLabel.text = [@(ranking.matchesLost) stringValue];
    self.matchesTotalLabel.text = [@(ranking.matchesTotal) stringValue];
    self.pointsLabel.text = [@(ranking.points) stringValue];
    self.backgroundColor = isEven ? [UIColor colorWithWhite:0.95 alpha:1.0] : [UIColor whiteColor];
}

+ (UIView *)headerView {
    RSRankingTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    cell.contentView.backgroundColor = [UIColor darkGrayColor];
    cell.rankLabelWidthConstraint.constant = 0.0;
    cell.teamNameLabel.text = NSLocalizedString(@"Club", @"");
    cell.rankLabel.text = @"";
    for (UILabel *l in [cell allLabels]) {
        l.textColor = [UIColor whiteColor];
    }
    return cell.contentView;
}

#pragma mark - Private methods

- (NSArray *)allLabels {
    return @[self.rankLabel, self.teamNameLabel, self.proLabel, self.wonLabel, self.drawLabel, self.lostLabel, self.matchesTotalLabel, self.pointsLabel];
}
@end
