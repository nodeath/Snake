//
//  SnakeTests.m
//  SnakeTests
//
//  Created by Shawn Hung on 8/27/15.
//  Copyright (c) 2015 Shawn Hung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Snake.h"
#import "IntegerPoint.h"

@interface SnakeTests : XCTestCase

@property (strong, nonatomic) Snake *snake;

@end

@implementation SnakeTests

- (void)setUp {
    [super setUp];
    self.snake = [[Snake alloc] initWithBody:@[[IntegerPoint pointWithX:10 Y:10],
                                               [IntegerPoint pointWithX:11 Y:10],
                                               [IntegerPoint pointWithX:12 Y:10],
                                               [IntegerPoint pointWithX:13 Y:10],
                                               [IntegerPoint pointWithX:14 Y:10],
                                               [IntegerPoint pointWithX:15 Y:10],
                                               [IntegerPoint pointWithX:16 Y:10],
                                               [IntegerPoint pointWithX:17 Y:10],
                                               [IntegerPoint pointWithX:18 Y:10]]];
}

- (void)tearDown {
    self.snake = nil;
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testMove {
    [self.snake move];
    
    NSLog(@"snake:%@", self.snake.body);
    
    XCTAssertGreaterThan([self.snake head].x, [self.snake neck].x, @"snake should move right");
}

- (void)testTurningClockwise {
    [self.snake setTurningDirection:TurningDirectionClockwise];
    [self.snake move];

    NSLog(@"snake:%@", self.snake.body);
    XCTAssertTrue([[self.snake head] y] > [[self.snake neck] y], @"snake should move down");
}

- (void)testTurningCounterClockwise {
    [self.snake setTurningDirection:TurningDirectionCounterClockwise];
    [self.snake move];
    
    NSLog(@"snake:%@", self.snake.body);
    XCTAssertTrue([[self.snake head] y] < [[self.snake neck] y], @"snake should move up");
}

- (void)testCollisionToBody {
    [self.snake setTurningDirection:TurningDirectionClockwise];
    XCTAssertTrue([self.snake move]);
    [self.snake setTurningDirection:TurningDirectionClockwise];
    XCTAssertTrue([self.snake move]);
    [self.snake setTurningDirection:TurningDirectionClockwise];
    XCTAssertFalse([self.snake move], @"snake should have collision");
}

- (void)testCollisionToBoundry{
    for(int i=0; i< 100; i++){
        [self.snake move];
    }
    
    XCTAssertFalse([self.snake move], @"snake should have collision");
}

- (void)testTrace {
    IntegerPoint *initialTailPosition = [self.snake tail];
    
    [self.snake move];
    [self.snake move];
    [self.snake move];
    [self.snake move];
    [self.snake move];
    
    XCTAssertEqualObjects(self.snake.trace[0], initialTailPosition, @"initial position should be in trace");
}

- (void)testGrow {
    
    NSInteger originalLength = [self.snake.body count];
    [self.snake move];
    [self.snake move];
    [self.snake move];
    [self.snake move];
    [self.snake move];
    
    [self.snake grow];
    
    XCTAssert([self.snake.body count] > originalLength, @"grow should extend snake");
}

@end
