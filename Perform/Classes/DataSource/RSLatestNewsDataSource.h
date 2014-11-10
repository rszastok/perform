//
//  RSLatestNewsDataSource.h
//  Perform
//
//  Created by Rafał Szastok on 09/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

#import "RSTableViewDataSource.h"
#import "RSChannel.h"

@interface RSLatestNewsDataSource : NSObject<RSTableViewDataSource>

@property (nonatomic, readonly) RSChannel *channel;

- (RSNewsItem *)newsItemAtIndexPath:(NSIndexPath *)indexPath;

@end
