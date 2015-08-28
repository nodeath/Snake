//
//  NSMutableArray+StackAddition.m
//  Snake
//
//  Created by Shawn Hung on 8/28/15.
//  Copyright (c) 2015 Shawn Hung. All rights reserved.
//

#import "NSMutableArray+StackAddition.h"

@implementation NSMutableArray (StackAddition)

- (void) push: (id)item {
    [self addObject:item];
}

- (id) pop {
    id item = nil;
    if ([self count] != 0) {
        item = [self lastObject];
        [self removeLastObject];
    }
    return item;
}

- (id) peek {
    id item = nil;
    if ([self count] != 0) {
        item = [self lastObject];
    }
    return item;
}

@end
