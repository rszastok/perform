//
//  RSLatestNewsParser.m
//  Perform
//
//  Created by Rafał Szastok on 07/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSChannelDeserializer.h"

#import "RSNewsItem.h"
#import "RSNewsItem+Deserialization.h"
#import "RSChannel+Deserialization.h"

static NSString *const ROOT = @"rss";

// States that parser may enter.
typedef NS_ENUM(NSInteger, RSCurrentElement) {
    RSCurrentElementChannel,
    RSCurrentElementItem
};

@interface RSChannelDeserializer ()
@property (nonatomic) RSCurrentElement currentElementTree;
@property (nonatomic) RSNewsItem *currentNewsItem;
@property (nonatomic) NSMutableArray *itemArray;
@property (nonatomic) NSMutableSet *channelCategoriesSet;
@property (nonatomic, strong) RSChannel *channel;
@property (nonatomic, strong) NSMutableString *outString;
@end


@implementation RSChannelDeserializer

- (id)parseResult {
    return self.channel;
}

#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    self.channel = [RSChannel new];
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName
     attributes:(NSDictionary *)attributeDict {
    // Prepare fields
    self.outString = [NSMutableString new];
    
    // Setup channel tree
    if ([elementName isEqualToString:CHANNEL]) {
        self.currentElementTree = RSCurrentElementChannel;
        self.itemArray = [NSMutableArray new];
        self.channelCategoriesSet = [NSMutableSet new];
        return;
    }
    
    // Entering (if needed) into the item object tree.
    if ([elementName isEqualToString:ITEM]) {
        self.currentElementTree = RSCurrentElementItem;
        self.currentNewsItem = [RSNewsItem new];
        return;
    }
    
    if ([elementName isEqualToString:ITEM_ENCLOSURE]) {
        NSString *enclosureUrlStr = attributeDict[ITEM_ENCLOSURE_URL];
        self.currentNewsItem.enclosureUrl = [NSURL URLWithString:enclosureUrlStr];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    [self.outString appendString:string];
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    // Parsing object is about to finish. Move mutable objects to output object.
    if ([elementName isEqualToString:CHANNEL]) {
        self.channel.categories = self.channelCategoriesSet;
        self.channel.items = self.itemArray;
        return;
    }
    
    // Leaving item object tree. Add created object only.
    if ([elementName isEqualToString:ITEM]) {
        self.currentElementTree = RSCurrentElementChannel;
        [self.itemArray addObject:self.currentNewsItem];
        return;
    }
    
    if ([elementName isEqualToString:ROOT] ||
        [elementName isEqualToString:METHOD] ||
        [elementName isEqualToString:METHOD_PARAMETER]) {
        // Ignore element.
        return;
    }
    
    NSString *trimString = [self.outString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    // Select and update the element.
    if (self.currentElementTree == RSCurrentElementChannel) {
        if ([elementName isEqualToString:CHANNEL_CATEGORY]) {
            [self.channelCategoriesSet addObject:trimString];
            return;
        }
        [self.channel updateValue:trimString forKey:elementName];
    }
    else { // RSCurrentElementItem case
        [self.currentNewsItem updateValue:trimString forKey:elementName];
    }
}

@end
