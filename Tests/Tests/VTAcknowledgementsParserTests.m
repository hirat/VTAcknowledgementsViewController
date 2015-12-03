//
//  VTAcknowledgementsParserTests.m
//  VTAck Tests
//
//  Created by Vincent Tourraine on 12/3/15.
//  Copyright © 2015 Vincent Tourraine. All rights reserved.
//

@import Foundation;
@import XCTest;

#import <VTAcknowledgementsParser.h>
#import <VTAcknowledgement.h>

@interface VTAcknowledgementsParserTests : XCTestCase

@end


@implementation VTAcknowledgementsParserTests

- (void)testBasicParsing {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Pods-acknowledgements" ofType:@"plist"];
    VTAcknowledgementsParser *parser = [[VTAcknowledgementsParser alloc] initWithAcknowledgementsPlistPath:path];

    XCTAssertEqualObjects(parser.header, @"This application makes use of the following third party libraries:");
    XCTAssertEqualObjects(parser.footer, @"Generated by CocoaPods - http://cocoapods.org");

    XCTAssertEqual(parser.acknowledgements.count, 1);

    VTAcknowledgement *acknowledgement = parser.acknowledgements.firstObject;
    XCTAssertEqualObjects(acknowledgement.title, @"VTAcknowledgementsViewController");
    XCTAssertTrue([acknowledgement.text hasPrefix:@"Copyright (c) 2013-2015 Vincent Tourraine (http://www.vtourraine.net)"]);
}

@end
