//
//  RSXMLParserDelegate.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const METHOD = @"method";
static NSString *const METHOD_PARAMETER = @"parameter";

@protocol RSXMLParserDelegate <NSXMLParserDelegate>

///@return Parsed object
- (id)parseResult;
@end
