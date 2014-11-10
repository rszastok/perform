//
//  RSGroup+Deserialization.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSGroup.h"

// Element name and attributes for group.
static NSString *const GROUP = @"group";
static NSString *const GROUP_ID = @"group_id";
static NSString *const GROUP_NAME = @"name";
static NSString *const GROUP_DETAILS = @"details";
static NSString *const GROUP_WINNER = @"winner";
static NSString *const GROUP_LAST_UPDATED = @"last_updated";

@interface RSGroup (Deserializer)
- (void)updateByDictionary:(NSDictionary *)dict;
@end
