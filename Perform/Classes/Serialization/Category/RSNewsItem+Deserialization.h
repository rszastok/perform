//
//  RSNewsItem+RSDeserialization.h
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSNewsItem.h"

// Element name and attributes for News Item.
static NSString *const ITEM = @"item";
static NSString *const ITEM_ID = @"guid";
static NSString *const ITEM_TITLE = @"title";
static NSString *const ITEM_PUB_DATE = @"pubDate";
static NSString *const ITEM_ENCLOSURE = @"enclosure";
static NSString *const ITEM_ENCLOSURE_LENGTH = @"length";
static NSString *const ITEM_ENCLOSURE_URL = @"url";
static NSString *const ITEM_ENCLOSURE_TYPE = @"type";
static NSString *const ITEM_DESCRIPTION = @"description";
static NSString *const ITEM_LINK = @"link";
static NSString *const ITEM_CATEGORY = @"category";

@interface RSNewsItem (Deserializer)
- (void)updateValue:(NSString *)value forKey:(NSString *)key;
@end
