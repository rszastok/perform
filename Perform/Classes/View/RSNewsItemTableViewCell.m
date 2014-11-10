//
//  RSTableViewCell.m
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSNewsItemTableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

NSString *const RSNewsItemCellIdentifier = @"NewsItemCell";

@interface RSNewsItemTableViewCell()
@property (strong, nonatomic) IBOutlet UIImageView *thumbnail;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *pubDateLabel;
@end

@implementation RSNewsItemTableViewCell

- (void)setupWithNewsItem:(RSNewsItem *)newsItem {
    __weak RSNewsItemTableViewCell *weakCell = self;
    [self.thumbnail setImageWithURLRequest:[NSURLRequest requestWithURL:newsItem.enclosureUrl]
                          placeholderImage:nil
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       weakCell.thumbnail.image = image;
                                       [weakCell setNeedsLayout];
                                   }
                                   failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                       NSLog(@"Error: %@", error);
    }];
    self.title.text = newsItem.title;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"cccc d MMMM yyyy, hh:mm"];
    self.pubDateLabel.text = [dateFormatter stringFromDate:newsItem.pubDate];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)height {
    return 60.0;
}
@end
