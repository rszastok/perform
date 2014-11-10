//
//  RSScoresTableViewCell.m
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSMatchesTableViewCell.h"

NSString *const RSMatchCellIdentifier = @"MatchCell";

@interface RSMatchesTableViewCell ()
@property (strong, nonatomic) IBOutlet UILabel *teamLeftLabel;
@property (strong, nonatomic) IBOutlet UILabel *teamRightLabel;
@property (strong, nonatomic) IBOutlet UIView *scoreBackView;
@property (strong, nonatomic) IBOutlet UILabel *scoreResultLabel;

@end

@implementation RSMatchesTableViewCell

- (void)awakeFromNib {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.scoreBackView.bounds;
    UIColor *firstColor = [UIColor colorWithWhite:0.4 alpha:0.5];
    UIColor *secondColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    gradient.colors = @[(id)firstColor.CGColor, (id)secondColor.CGColor];
    [self.scoreBackView.layer insertSublayer:gradient atIndex:0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupWithMatch:(RSMatch *)match isEven:(BOOL)isEven {
    self.teamLeftLabel.text = match.teamA.name;
    self.teamRightLabel.text = match.teamB.name;
    self.scoreResultLabel.text = [NSString stringWithFormat:@"%d-%d", match.teamAResult.fs, match.teamBResult.fs];
    self.backgroundColor = isEven ? [UIColor colorWithWhite:0.95 alpha:1.0] : [UIColor whiteColor];
}

+ (CGFloat)height {
    return 40.0;
}

@end
