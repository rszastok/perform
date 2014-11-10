//
//  RSScoresParser.m
//  Perform
//
//  Created by Rafał Szastok on 07/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSScoresDeserializer.h"
#import <ReactiveCocoa/RACTuple.h>

#import "RSCompetition+Deserialization.h"
#import "RSSeason+Deserialization.h"
#import "RSRound+Deserialization.h"
#import "RSGroup+Deserialization.h"
#import "RSMatch+Deserialization.h"

static NSString *const ROOT = @"gsmrs";

@interface RSScoresDeserializer ()
@property (nonatomic) RSScores *scores;

@property (nonatomic) RSCompetition *currentCompetition;
@property (nonatomic) RSSeason *currentSeason;
@property (nonatomic) RSRound *currentRound;
@property (nonatomic) RSGroup *currentGroup;
@property (nonatomic) RSMatch *currentMatch;

@property (nonatomic) NSMutableDictionary *parameterDictionary;
@property (nonatomic) NSMutableArray *groupArray;
@property (nonatomic) NSMutableArray *matchArray;
@end


@implementation RSScoresDeserializer

- (id)parseResult {
    return self.scores;
}

#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    self.scores = [RSScores new];
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName
     attributes:(NSDictionary *)attributeDict {
    
    // Create and fill Competition attributes.
    if ([elementName isEqualToString:COMPETITION]) {
        self.currentCompetition = [RSCompetition new];
        [self.currentCompetition updateByDictionary:attributeDict];
        return;
    }
    
    // Create and fill Season attributes.
    if ([elementName isEqualToString:SEASON]) {
        self.currentSeason = [RSSeason new];
        [self.currentSeason updateByDictionary:attributeDict];
        return;
    }
    
    // Create and fill Round attributes.
    if ([elementName isEqualToString:ROUND]) {
        self.currentRound = [RSRound new];
        [self.currentRound updateByDictionary:attributeDict];
        self.groupArray = [NSMutableArray new];
        return;
    }
    
    // Create and fill Group attributes.
    if ([elementName isEqualToString:GROUP]) {
        self.currentGroup = [RSGroup new];
        [self.currentGroup updateByDictionary:attributeDict];
        self.matchArray = [NSMutableArray new];
        return;
    }
    
    // Create and fill Match attributes.
    if ([elementName isEqualToString:MATCH]) {
        self.currentMatch = [RSMatch new];
        [self.currentMatch updateByDictionary:attributeDict];
        return;
    }
    
    if ([elementName isEqualToString:METHOD]) {
        self.parameterDictionary = [NSMutableDictionary new];
    }
    
    if ([elementName isEqualToString:METHOD_PARAMETER]) {
        self.parameterDictionary[attributeDict[@"name"]] = attributeDict[@"value"];
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    // Save to parent Competition element.
    if ([elementName isEqualToString:COMPETITION]) {
        self.scores.competitions = @[self.currentCompetition];
    }
    // Save to parent Season element.
    else if ([elementName isEqualToString:SEASON]) {
        self.currentCompetition.seasons = @[self.currentSeason];
    }
    // Save to parent Round element.
    else if ([elementName isEqualToString:ROUND]) {
        self.currentRound.groups = self.groupArray;
        self.currentSeason.rounds = @[self.currentRound];
    }
    // Save to parent Group element.
    else if ([elementName isEqualToString:GROUP]) {
        self.currentGroup.matches = self.matchArray;
        [self.groupArray addObject:self.currentGroup];
    }
    // Save to parent Match element.
    else if ([elementName isEqualToString:MATCH]) {
        [self.matchArray addObject:self.currentMatch];
    }
    else if ([elementName isEqualToString:METHOD_PARAMETER]) {
        self.scores.parameters = self.parameterDictionary;
    }
    else if ([elementName isEqualToString:ROOT] ||
             [elementName isEqualToString:METHOD]) {
         // Ignore element.
    }
    else {
        NSAssert(FALSE, @"Unhandled Scores element name: %@", elementName);
    }
}

@end
