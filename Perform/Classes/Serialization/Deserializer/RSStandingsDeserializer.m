//
//  RSCompetitionDeserializer.m
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSStandingsDeserializer.h"
#import "RSCompetition+Deserialization.h"
#import "RSSeason+Deserialization.h"
#import "RSRound+Deserialization.h"
#import "RSRanking+Deserialization.h"

static NSString *const ROOT = @"gsmrs";

@interface RSStandingsDeserializer ()

@property (nonatomic) RSCompetition *competition;
@property (nonatomic) RSSeason *currentSeason;
@property (nonatomic) RSRound *currentRound;
@property (nonatomic) RSRanking *currentRanking;
@property (nonatomic) NSMutableArray *rankingArray;

@end


@implementation RSStandingsDeserializer

- (id)parseResult {
    return self.competition;
}

#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName
     attributes:(NSDictionary *)attributeDict {
    
    // Create and fill Competition attributes.
    if ([elementName isEqualToString:COMPETITION]) {
        self.competition = [RSCompetition new];
        [self.competition updateByDictionary:attributeDict];
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
        self.rankingArray = [NSMutableArray new];
        return;
    }
    
    // Create and fill Ranking attributes.
    if ([elementName isEqualToString:RANKING]) {
        self.currentRanking = [RSRanking new];
        [self.currentRanking updateByDictionary:attributeDict];
        return;
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    // Save to parent Competition element.
    if ([elementName isEqualToString:COMPETITION]) {
        // Document is about to finish. Do nothing.
    }
    // Save to parent Season element.
    else if ([elementName isEqualToString:SEASON]) {
        self.competition.seasons = @[self.currentSeason];
    }
    // Save to parent Round element.
    else if ([elementName isEqualToString:ROUND]) {
        self.currentRound.resultsTable = self.rankingArray;
        self.currentSeason.rounds = @[self.currentRound];
    }
    // Add ranking object
    else if ([elementName isEqualToString:RANKING]) {
        [self.rankingArray addObject:self.currentRanking];
    }
    else if ([elementName isEqualToString:ROOT] ||
             [elementName isEqualToString:METHOD] ||
             [elementName isEqualToString:METHOD_PARAMETER] ||
             [elementName isEqualToString:ROUND_RESULTS_TABLE]) {
        // Ignore element.
    }
    else {
        NSAssert(FALSE, @"Unhandled Standings element name");
    }
}

@end
