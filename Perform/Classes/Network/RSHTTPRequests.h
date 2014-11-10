//
//  NetworkManager.h
//  RSCatalog
//
//  Created by Rafał Szastok on 24/10/14.
//  Copyright (c) 2014 RSCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

#import "RSScores.h"
#import "RSChannel.h"

@interface RSHTTPRequests : NSObject
+ (instancetype)sharedInstance;
- (RACSignal *)requestLatestNews;
- (RACSignal *)requestScores;
- (RACSignal *)requestStandings;
@end
