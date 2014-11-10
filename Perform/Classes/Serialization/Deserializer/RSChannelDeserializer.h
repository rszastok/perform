//
//  RSLatestNewsParser.h
//  Perform
//
//  Created by Rafał Szastok on 07/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSChannel.h"
#import "RSXMLParserDelegate.h"

/// Designed RSChannel deserializer for xml file
/// @see RSChannel class
@interface RSChannelDeserializer : NSObject<RSXMLParserDelegate>

@end
