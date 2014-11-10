//
//  RSScoresParser.h
//  Perform
//
//  Created by Rafał Szastok on 07/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSScores.h"
#import "RSXMLParserDelegate.h"

/// Designed RSScores deserializer for xml file
/// @see RSScores class
@interface RSScoresDeserializer : NSObject<RSXMLParserDelegate>
@end
