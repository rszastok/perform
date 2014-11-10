//
//  NetworkManager.m
//  RSCatalog
//
//  Created by Rafał Szastok on 24/10/14.
//  Copyright (c) 2014 RSCompany. All rights reserved.
//

#import "RSHTTPRequests.h"

#import "RSChannelDeserializer.h"
#import "RSScoresDeserializer.h"
#import "RSStandingsDeserializer.h"

static NSString *const PERFORM_GROUP_ADDRESS = @"http://www.mobilefeeds.performgroup.com/utilities/interviews/techtest";

@implementation RSHTTPRequests

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken = 0;
    static RSHTTPRequests *_sharedServer;
    dispatch_once(&onceToken, ^{
        _sharedServer = [RSHTTPRequests new];
    });
    return _sharedServer;
}

- (RACSignal *)requestForPath:(NSString *)path deserializer:(NSObject<RSXMLParserDelegate> *)deserializer {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *urlStr = [NSString stringWithFormat:@"%@/%@", PERFORM_GROUP_ADDRESS, path];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (connectionError != nil) {
                [subscriber sendError:connectionError];
            }
            else {
                NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
                parser.delegate = deserializer;
                [parser parse];
                [subscriber sendNext:[deserializer parseResult]];
            }
        }];
        return [RACDisposable disposableWithBlock:^{
            // Dispose objects here.
        }];
    }];
}

- (RACSignal *)requestLatestNews {
    return [self requestForPath:@"latestnews.xml" deserializer:[RSChannelDeserializer new]];
}

- (RACSignal *)requestScores {
    return [self requestForPath:@"scores.xml" deserializer:[RSScoresDeserializer new]];
}

- (RACSignal *)requestStandings {
    return [self requestForPath:@"standings.xml" deserializer:[RSStandingsDeserializer new]];
}

@end
