//
//  Snake.m
//  Snake
//
//  Created by Shawn Hung on 8/27/15.
//  Copyright (c) 2015 Shawn Hung. All rights reserved.
//

#import "Snake.h"
#import "NSMutableArray+QueueAdditions.h"
#import "NSMutableArray+StackAddition.h"

@interface Snake ()

@property (strong, nonatomic) NSMutableArray *body;
@property (strong, nonatomic) NSMutableArray *trace;

@end

@implementation Snake

- (instancetype)initWithBody:(NSArray *)body
{
    if(self = [super init]){
        self.turningDirection = TurningDirectionNone;
        self.bodyLength = [body count];
        self.body = [NSMutableArray arrayWithArray:body];
        self.trace = [NSMutableArray arrayWithCapacity:100];
        self.boundry = [IntegerPoint pointWithX:100 Y:100];
        
        if([self.body count] < 2){
            self = nil;
        }
    }
    
    return self;
}

- (Direction)direction{
    IntegerPoint *headPostion = [self.body lastObject];
    IntegerPoint *neckPosition = self.body[[self.body count] - 2];
    Direction direction = DirectionNone;
    if(headPostion.x > neckPosition.x ) {
        direction = DirectionRight;
    } else if(headPostion.x < neckPosition.x) {
        direction = DirectionLeft;
    } else {
        if(headPostion.y > neckPosition.y){
            direction = DirectionDown;
        } else if(headPostion.y < neckPosition.y){
            direction = DirectionUp;
        } else {
            direction = DirectionNone;
        }
    }
    
    return direction;
}

- (BOOL)move{
    IntegerPoint *newHeadPostion = [[self.body lastObject] copy];
    
    switch (self.turningDirection) {
        case TurningDirectionNone:{
            switch (self.direction) {
                case DirectionUp:
                    newHeadPostion.y--;
                    break;
                case DirectionDown:
                    newHeadPostion.y++;
                    break;
                case DirectionLeft:
                    newHeadPostion.x--;
                    break;
                case DirectionRight:
                    newHeadPostion.x++;
                    break;
                case DirectionNone:
                    return YES;
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case TurningDirectionCounterClockwise:{
            switch (self.direction) {
                case DirectionUp:
                    newHeadPostion.x--;
                    break;
                case DirectionDown:
                    newHeadPostion.x++;
                    break;
                case DirectionLeft:
                    newHeadPostion.y++;
                    break;
                case DirectionRight:
                    newHeadPostion.y--;
                    break;
                case DirectionNone:
                    return YES;
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case TurningDirectionClockwise:{
            switch (self.direction) {
                case DirectionUp:
                    newHeadPostion.x++;
                    break;
                case DirectionDown:
                    newHeadPostion.x--;
                    break;
                case DirectionLeft:
                    newHeadPostion.y--;
                    break;
                case DirectionRight:
                    newHeadPostion.y++;
                    break;
                case DirectionNone:
                    return YES;
                    break;
                    
                default:
                    break;
            }
        }
            break;
            
        default:
            break;
    }
    
    //check new position is included in boundry
    if(newHeadPostion.x <= 0 ||
       newHeadPostion.x >= self.boundry.x ||
       newHeadPostion.y >= self.boundry.y ||
       newHeadPostion.y <= 0){
        return NO;
    }
    
    //check new position isn't collided to itself's body.
    if([self.body containsObject:newHeadPostion]){
        return NO;
    }
    
    [self.body enqueue:newHeadPostion];
    
    [self.trace push:[self.body dequeue]];
    if([self.trace count] >= 100){
        [self.trace dequeue];
    }
    
    self.turningDirection = TurningDirectionNone;
    return YES;
}

- (void)grow {
    [self.body insertObject:[self.trace pop] atIndex:0];
    [self.body insertObject:[self.trace pop] atIndex:0];
    [self.body insertObject:[self.trace pop] atIndex:0];
    [self.body insertObject:[self.trace pop] atIndex:0];
    [self.body insertObject:[self.trace pop] atIndex:0];
}

- (IntegerPoint *)head {
    
    return [self.body lastObject];
}

- (IntegerPoint *)neck {
    
    return [self.body objectAtIndex:[self.body count] - 2];
}

- (IntegerPoint *)tail {
    return [self.body firstObject];
}

@end
