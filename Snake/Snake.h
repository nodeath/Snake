//
//  Snake.h
//  Snake
//
//  Created by Shawn Hung on 8/27/15.
//  Copyright (c) 2015 Shawn Hung. All rights reserved.
//

@import UIKit;
#import "IntegerPoint.h"

typedef NS_ENUM(NSInteger, TurningDirection){
    TurningDirectionNone = 0,
    TurningDirectionCounterClockwise,
    TurningDirectionClockwise
};

typedef NS_ENUM(NSInteger, Direction){
    DirectionNone,
    DirectionUp,
    DirectionDown,
    DirectionLeft,
    DirectionRight
};

@interface Snake : NSObject

@property (copy, nonatomic) IntegerPoint *boundry; // default is (100, 100)

@property (nonatomic) TurningDirection turningDirection;
@property (nonatomic) NSInteger bodyLength;

@property (readonly, strong, nonatomic) NSMutableArray *body;
@property (readonly, strong, nonatomic) NSMutableArray *trace;

@property (readonly, nonatomic) Direction direction;

- (instancetype)initWithBody:(NSArray *)body;

- (BOOL)move;

- (void)grow;

- (IntegerPoint *)head;
- (IntegerPoint *)neck;
- (IntegerPoint *)tail;

@end
